function first_login (event, player)
	CharDBExecute("INSERT INTO shard_stats (playerguid) VALUES ("..player:GetGUIDLow()..")")
	CharDBExecute("INSERT INTO shard_aa_points (playerguid) VALUES ("..player:GetGUIDLow()..")")
	local ticker=0
	repeat
		ticker = ticker+1
		CharDBExecute("INSERT INTO shard_aa_allocation (playerguid, category) VALUES ("..player:GetGUIDLow()..", "..ticker..")")
	until (ticker==10)
	CharDBExecute("INSERT INTO shard_pvp_stats (playerguid) VALUES ("..player:GetGUIDLow()..")")
end

function weaponskills (event, player)
	player:LearnSpell(227, player)
	player:LearnSpell(264, player)
end
	
--[[ADD STAT POINTS ON LEVELUP]]--
function add_statpoints (event, player, oldLevel)
    local existing_statpoints = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
    statpoints = existing_statpoints:GetUInt32(0)+pointgain -- Old points + points/lvl
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've gained "..pointgain.." stat points! You now have "..statpoints.." unallocated stat points.")
end

RegisterPlayerEvent(30, weaponskills)
RegisterPlayerEvent(30, first_login)
RegisterPlayerEvent(13, add_statpoints)