local function flag (event, player, spell)
	if (spell:GetEntry()==818059) then
		local guild_id = CharDBQuery("SELECT guildid FROM guild_member WHERE guid="..player:GetGUIDLow().."")
		WorldDBExecute("UPDATE ownership SET guild="..guild_id:GetUInt32(0).."")
		local guild_name = player:GetGuild():GetName()
		for k, v in ipairs(GetPlayersInWorld()) do
			v:SendBroadcastMessage("|cffff0000"..player:GetName().." of "..guild_name.." has captured Taunka'le Village!|r")
		end
		for k, v in ipairs(player:GetGameObjectsInRange(20, 190589)) do
			v:Despawn(10800)
			player:SendBroadcastMessage("Despawn werkd")
		end
	end
end
RegisterPlayerEvent(5, flag)