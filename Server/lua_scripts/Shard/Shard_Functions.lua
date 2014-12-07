CacheMsg = AIO:CreateMsg()

--[[DYNAMIC SPELL SYSTEM FUNCTIONS]]
function SendDamage(player, target, spellID, amount, school)		--Sends damage to the target.
	player:SendDamage(target, amount, spellID, school, false)
end
function SendHeal(player, target, spellID, amount)					--Heals the target.
	player:DealHeal(target, spellID, amount, false)
end
function SendCooldown(player, spellID, duration)					--Sends the cooldown to the player.
	player:SendCooldown(spellID, duration)
end
function SendAura(player, target, spellID, duration)				--Sets the duration of the effect on the target.
	player:AddAura(spellID, target)
	local aura = target:GetAura(spellID)
	if (aura) then
		aura:SetMaxDuration(duration)
		aura:SetDuration(duration)
	end
end

--[[CACHE SHARD DATA]]

Shard_ClassData = {}

function CacheClasses()
	if (CustomClasses==true) then
		Shard_ClassData = {}
		cached_classes = 0
		local CustomClassInfo = CharDBQuery("SELECT * FROM shard_class_info ORDER BY id")
		repeat
			Shard_ClassData[CustomClassInfo:GetUInt32(0)] = {
			CustomClassInfo:GetUInt32(0), CustomClassInfo:GetString(1), CustomClassInfo:GetUInt32(2), 
			CustomClassInfo:GetUInt32(3), CustomClassInfo:GetUInt32(4), CustomClassInfo:GetUInt32(5),
			CustomClassInfo:GetString(6), CustomClassInfo:GetString(7), CustomClassInfo:GetString(8),
			CustomClassInfo:GetString(9), CustomClassInfo:GetUInt32(10)}
			cached_classes = cached_classes+1
		until not CustomClassInfo:NextRow()
		for _k, v in pairs(Shard_ClassData) do
			print("[Shard]: Successfully loaded data for class '"..v[2].."'")
		end
	else
		print("[Shard]: Custom classes disabled.")
	end
end
CacheClasses()

Shard_CharData	= {}

function CacheCharacters()
	local CharInfo = CharDBQuery("SELECT playerguid,class FROM shard_assigned_class ORDER BY playerguid")
	cached_characters = 0
	repeat
		Shard_CharData[CharInfo:GetUInt32(0)] = CharInfo:GetUInt32(1)
		cached_characters = cached_characters+1
	until not CharInfo:NextRow()
	print("[Shard]: Loaded "..cached_characters.." chars.")
end
CacheCharacters()

--[[AUTO ATTACK]]
function auto_attack(event, player, spell)
	if (spell:GetEntry()==7712) then
		if (player:GetPower(3)>=75) then
			player:CastSpell(player, 69488, false)
		else
			player:CastSpell(player, 63726, false)
			player:SendBroadcastMessage("|cffff0000You are too exhausted to attack!|r")
		end
	end
end
RegisterPlayerEvent(5, auto_attack)

--[[GROUP EXP CALCULATION]]
bonus_xp_system = {}
bonus_xp_system.creature_exceptions = {} -- By Id
function bonus_xp_system.check(group, killed_level)
	local membercount = 0
	local combinedlevel = 0
	for k, v in ipairs(group) do 
		membercount = membercount+1
		combinedlevel = combinedlevel+v:GetLevel()
	end
	local avglevel = combinedlevel/membercount
	for k, v in ipairs(group) do
		sub_level = killed_level - avglevel
		if ((killed_level-v:GetLevel()) < GroupBonusExpLevelDiff) then
			v:SendBroadcastMessage(sub_level)
			bonus_xp_calc = math.floor((killed_level * GroupBonusExpMultiplier)*(1+(sub_level/10)))
			bonus_xp_system.give(v, bonus_xp_calc)
		end
	end
end
function bonus_xp_system.give(player, xp_to_give)
	player:GiveXP(xp_to_give)
	player:SendBroadcastMessage("You gain "..xp_to_give.." bonus experience due to kill difficulty and grouping.")
end
function bonus_xp_system.initialize(event, killer, killed)
	if(killer:GetOwner()) then
		killer = killer:GetOwner()
	end
	local stop = false
	for _k, creature_entry in pairs(bonus_xp_system.creature_exceptions) do
		if (creature_entry == killed:GetEntry()) then
			stop = true
		end
	end
	if ((killer:IsInGroup()) and (stop == false)) then
		local group = killer:GetGroup()
		local group_table = group:GetMembers()
		bonus_xp_system.check(group_table, killed:GetLevel())
	end
end
RegisterPlayerEvent(7, bonus_xp_system.initialize)

--[[ON FIRST LOGIN]]
function first_login (event, player)
	CharDBExecute("INSERT INTO shard_aa_points (playerguid) VALUES ("..player:GetGUIDLow()..")")
	CharDBExecute("INSERT INTO shard_stats (playerguid, str, agi, sta, inte, spi) VALUES (0, 0, 0, 0, 0)")
	CharDBExecute("INSERT INTO shard_pvp_stats (playerguid) VALUES ("..player:GetGUIDLow()..")")
end

RegisterPlayerEvent(30, first_login)

--[[STAT ALLOCATION]]
stat_cache = {}
statpoints_cache = {}
stat_auras = {7464, 7471, 7477, 7468, 7474}
function init_stats (event, player)
	local statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow())
	if (statquery==nil) then
		CharDBExecute("INSERT INTO shard_stats VALUES ("..player:GetGUIDLow()..", 0, 0, 0, 0, 0);")
		statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow())
	end
	local statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
	stat_cache[player:GetGUIDLow()] = {statquery:GetUInt32(0), statquery:GetUInt32(1), statquery:GetUInt32(2), statquery:GetUInt32(3), statquery:GetUInt32(4)}
	statpoints_cache[player:GetGUIDLow()] = statpointquery:GetUInt32(0)
	local ticker = 0
	repeat
	    ticker = ticker+1
	    if (stat_cache[player:GetGUIDLow()][ticker]>0) then
	        player:AddAura(stat_auras[ticker], player)
	        local aura = player:GetAura(stat_auras[ticker])
	        aura:SetStackAmount(stat_cache[player:GetGUIDLow()][ticker])
	    end
	until (ticker==5)
	player:SetSpeed(1, 0.8+(player:GetStat(1)*0.013))
end
RegisterPlayerEvent(3, init_stats)

--[[ON LOGIN]]
function On_LogIn (event, player)
	player:AddAura(7711, player)			--Modded in the DBC files, this is the aura that makes auto attacks cost energy.

	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)			--Language glitch band-aid.

	local SecondaryClassQuery = CharDBQuery("SELECT class FROM shard_assigned_class WHERE playerguid="..player:GetGUIDLow())
	if (CustomClasses==true) then
		if (SecondaryClassQuery~=nil) then
			print("[Shard]: Player '"..player:GetName().."' is assigned Secondary Class '"..Shard_ClassData[SecondaryClassQuery:GetUInt32(0)][2].."'")
		else
			if (player:GetLevel()>10) then
				--Show Secondary Class Selection screen maybe?
				print("[Shard]: Player '"..player:GetName().."' has no assigned Secondary Class and is above level 10. Issue grabbing data?")
			else
				print("[Shard]: Player '"..player:GetName().."' has no assigned Secondary Class.")
			end
		end
	end
end

RegisterPlayerEvent(3, On_LogIn)

--[[CULL CHARACTERS -- UNFINISHED/BROKEN
function CullCharacters()
	local existing_chars		= CharDBQuery("SELECT guid FROM characters ORDER BY guid")
	local registered_chars		= CharDBQuery("SELECT playerguid FROM shard_aa_points ORDER BY playerguid")
	local chardb_guids			= {}
	local registered_guids		= {}
	local valid_guids			= {}
	local invalid_guids			= {}
	local querystrtable			= {}
	print(registered_chars:GetUInt32(0))
	repeat
		table.insert(chardb_guids, existing_chars:GetUInt32(0))
	until not existing_chars:NextRow()
	repeat
		table.insert(registered_guids, registered_chars:GetUInt32(0))
	until not registered_chars:NextRow()
	local ticker1 = 0
	repeat
		ticker1 = ticker1+1
		if (registered_guids[ticker1]~=nil) then
			local valid = 0
			for k, v in pairs(chardb_guids) do
				if (registered_guids[ticker1]==v) and (valid==0) then
					table.insert(valid_guids, v)
					valid = 1
				end
			end
			if (valid==0) then
				if (ticker1==1) then
					table.insert(querystrtable, "DELETE FROM shard_aa_points WHERE playerguid="..registered_guids[ticker1])
					table.insert(querystrtable, "DELETE FROM shard_aa_allocation WHERE playerguid="..registered_guids[ticker1])
					table.insert(querystrtable, "DELETE FROM shard_aa_allocation WHERE playerguid="..registered_guids[ticker1])
				else
					table.insert(invalid_guids, )
			end
		end
	until (registered_guids[ticker1]==nil)
	for k, v in pairs(invalid_guids) do
		print(v)
	end
end]]

--[[APPLY MANA REGEN FROM SPIRIT]]
local function manaregen (event, player)
	if (player:GetStat(4)>1) then
		spirit = player:GetStat(4)
		repeat
			player:AddAura(21359, player)
			spirit = (spirit-2)
		until (spirit<=1)
	end
end
RegisterPlayerEvent(29, manaregen)
RegisterPlayerEvent(13, manaregen)
RegisterPlayerEvent(3, manaregen)

--[[ON LEVELUP]]
function On_LevelUp (event, player, oldLevel)
	if (oldLevel>player:GetLevel()) then
		if ((statpoints_cache[player:GetGUIDLow()]-((oldLevel-player:GetLevel())*StatPointsPerLevel))<0) then
			statpoints_cache[player:GetGUIDLow()] = 0
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints_cache[player:GetGUIDLow()].." WHERE playerguid="..player:GetGUIDLow())
			player:SendBroadcastMessage("Stat points set to 0.")
		else
			statpoints_cache[player:GetGUIDLow()] = statpoints_cache[player:GetGUIDLow()]-((oldLevel-player:GetLevel())*StatPointsPerLevel)
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints_cache[player:GetGUIDLow()].." WHERE playerguid="..player:GetGUIDLow())
			player:SendBroadcastMessage("You've lost "..(oldLevel-player:GetLevel())*StatPointsPerLevel.." stat points. You now have "..statpoints_cache[player:GetGUIDLow()].." unallocated stat points.")
		end
	else
	    statpoints_cache[player:GetGUIDLow()] = statpoints_cache[player:GetGUIDLow()]+((player:GetLevel()-oldLevel)*StatPointsPerLevel)
	    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints_cache[player:GetGUIDLow()].." WHERE playerguid="..player:GetGUIDLow())
	    player:SendBroadcastMessage("You've gained "..(player:GetLevel()-oldLevel)*StatPointsPerLevel.." stat points! You now have "..statpoints_cache[player:GetGUIDLow()].." unallocated stat points.")
	end
	init_statvalues(player)
end

RegisterPlayerEvent(13, On_LevelUp)

--[[SEND ADDON INFO]]
function SendShardLoginData(player)
	CacheMsg:AddBlock("SendData", Shard_ClassData, 1)
	CacheMsg:AddBlock("SendData", Shard_SpellData, 2)
	CacheMsg:AddBlock("SendData", Shard_CharData, 3)
	CacheMsg:Send(player)
	player:SendBroadcastMessage("[Server]: AddOn detected! Sent data.")
end

--[[RECIEVED ADDON INFO]]
function ReturnData(Player, Identifier)
	if (Identifier==1) then
		SendShardLoginData(Player)
	end
end

--[[COMMANDS]]
function ShardCommands(event, player, msg, Type, lang)
	if (player:GetGMRank()==3) then
		if (msg==ReloadSpellsCommand) then
			CacheSpells()
			return false
		end
		if (msg==SyncStatsCommand) then
			sync_stats(event, player)
			return false
		end
	end
end
RegisterPlayerEvent(18, ShardCommands)