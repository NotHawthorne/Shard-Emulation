local function flag (event, player, spell)
	if (spell:GetEntry()==818059) then
		local playerguid = player:GetGUIDLow()
		local query = CharDBQuery("SELECT guildid FROM guild_member WHERE guid="..playerguid.."")
		local bleh = WorldDBExecute("UPDATE ownership SET guild="..query:GetUInt32(0).."")
		local guild = player:GetGuild()
		local name = guild:GetName()
		for k, v in ipairs(GetPlayersInWorld()) do
			v:SendBroadcastMessage("|cffff0000"..player:GetName().." of "..name.." has captured Taunka'le Village!|r")
		end
		for k, v in ipairs(player:GetGameObjectsInRange(20, 190589)) do
			v:Despawn(10800)
			player:SendBroadcastMessage("Despawn werkd")
		end
	end
end
RegisterPlayerEvent(5, flag)