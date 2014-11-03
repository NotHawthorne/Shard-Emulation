disable_for_gms = 1

local function languagefix (event, player)
	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)
end

local function register_stats (event, player)
	CharDBExecute("INSERT INTO shard_aa_points (playerguid) VALUES ("..player:GetGUIDLow()..")")
	base_statdb = WorldDBQuery("SELECT str, agi, sta, inte, spi FROM player_levelstats WHERE race="..player:GetRace().."")
	CharDBExecute("INSERT INTO shard_stats (playerguid, str, agi, sta, inte, spi) VALUES ("..base_statdb:GetUInt32(0)..", "..base_statdb:GetUInt32(1)..", "..base_statdb:GetUInt32(2)..", "..base_statdb:GetUInt32(3)..", "..base_statdb:GetUInt32(4)..")")
end

local function multiboxing (event, player)
	for k, v in ipairs(GetPlayersInWorld()) do
		if(v:GetPlayerIP() == player:GetPlayerIP()) then -- check areas so we wont spam to the whole world
			if (v:GetName()~=player:GetName()) then
				if v:IsGM() and (disable_for_gms==1) then
					player:SendBroadcastMessage("GM detected. Multibox prevention disabled.")
					v:SendBroadcastMessage("GM detected. Multibox prevention disabled.")
				else
					SendWorldMessage("[Security]: |cffff0000Automatically kicked characters '"..v:GetName().."' and '"..player:GetName().."' for multiboxing.|r")
					v:KickPlayer()
					player:KickPlayer()
				end
			end
		end
	end
end

function apply_allocation (event, player)
	statdb = CharDBQuery("SELECT str, agi, sta, inte, spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
	allocated_str = statdb:GetUInt32(0)
	allocated_agi = statdb:GetUInt32(1)
	allocated_sta = statdb:GetUInt32(2)
	allocated_inte = statdb:GetUInt32(3)
	allocated_spi = statdb:GetUInt32(4)

	ticker1 = 0
	ticker2 = 0
	ticker3 = 0
	ticker4 = 0
	ticker5 = 0

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
end

local function manaregen (event, player)
	if (player:GetStat(4)>1) then
		spirit = player:GetStat(4)
		repeat
			player:AddAura(21359, player)
			spirit = (spirit-2)
		until (spirit<=1)
	end
end

RegisterPlayerEvent(30, register_stats)
RegisterPlayerEvent(3, apply_allocation)
RegisterPlayerEvent(29, manaregen)
RegisterPlayerEvent(13, manaregen)
RegisterPlayerEvent(3, manaregen)
RegisterPlayerEvent(3, languagefix)
RegisterPlayerEvent(3, multiboxing)
RegisterPlayerEvent(27, languagefix)