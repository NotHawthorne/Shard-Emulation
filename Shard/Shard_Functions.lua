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
end

RegisterPlayerEvent(30, first_login)

--[[ON LOGIN]]
function On_LogIn (event, player)
	local statdb = CharDBQuery("SELECT str, agi, sta, inte, spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
	local allocated_str = statdb:GetUInt32(0)
	local allocated_agi = statdb:GetUInt32(1)
	local allocated_sta = statdb:GetUInt32(2)
	local allocated_inte = statdb:GetUInt32(3)
	local allocated_spi = statdb:GetUInt32(4)

	local ticker1 = 0
	local ticker2 = 0
	local ticker3 = 0
	local ticker4 = 0
	local ticker5 = 0
	local ticker6 = 0

	if (allocated_str>0) then
		repeat
			player:AddAura(7464, player)
			ticker1 = ((ticker1)+1)
		until (ticker1==allocated_str)
	end
	
	if (allocated_agi>0) then
		repeat
			player:AddAura(7471, player)
			ticker2 = ((ticker2)+1)
		until (ticker2==allocated_agi)
	end
	
	if (allocated_sta>0) then
		repeat
			player:AddAura(7477, player)
			ticker3 = ((ticker3)+1)
		until (ticker3==allocated_sta)
	end
	
	if (allocated_inte>0) then
		repeat
			player:AddAura(7468, player)
			ticker4 = ((ticker4)+1)
		until (ticker4==allocated_sta)
	end
	
	if (allocated_spi>0) then
		repeat
			player:AddAura(7474, player)
			ticker5 = ((ticker5)+1)
		until (ticker5==allocated_sta)
	end
	
	speed = ((player:GetStat(1)/80))
	
	if (speed>0) then
		ticker6=1
		repeat
			ticker6 = ((ticker6)+0.01)
		until (ticker6>=speed)
		player:SetSpeed(1, ticker6, true)
	end
	
	player:AddAura(7711, player)			--Modded in the DBC files, this is the aura that makes auto attacks cost energy.

	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)			--Language glitch band-aid.

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

--[[COMMANDS]]
function ShardCommands(event, player, msg, Type, lang)				--Reloads shard_spell_table
	if (player:GetGMRank()==3) then
		if (msg==ReloadSpellsCommand) then
			CacheSpells()
			return false
		end
		--[[if (msg==CullCharactersCommand) then
			CullCharacters()
			return false
		end]]
	end
end
RegisterPlayerEvent(18, ShardCommands)