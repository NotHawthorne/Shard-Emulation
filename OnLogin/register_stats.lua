local function register_stats (event, player)
	CharDBExecute("INSERT INTO shard_aa_points (playerguid) VALUES ("..player:GetGUIDLow()..")")
	base_statdb = WorldDBQuery("SELECT str, agi, sta, inte, spi FROM player_levelstats WHERE race="..player:GetRace().."")
	CharDBExecute("INSERT INTO shard_stats (playerguid, str, agi, sta, inte, spi) VALUES ("..base_statdb:GetUInt32(0)..", "..base_statdb:GetUInt32(1)..", "..base_statdb:GetUInt32(2)..", "..base_statdb:GetUInt32(3)..", "..base_statdb:GetUInt32(4)..")")
end

RegisterPlayerEvent(30, register_stats)