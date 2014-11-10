local function bonusxp (event, killer, killed)
	if killer:IsInGroup() then
		local lvl = killed:GetLevel()
		local lvl2 = killer:GetLevel()
		if (lvl2-lvl>4) then
			killer:SendBroadcastMessage("No bonus experience because the mob you killed is far less powerful than you.")
		else
			killer:GiveXP((lvl*24), killer)
			killer:SendBroadcastMessage("You gain "..(lvl*24).." bonus experience from being in a group!")
		end
	end
	if (killer:GetLevel()==25) and (((killer:GetLevel())-(killed:GetLevel()))<1) then
		chancetoproc = math.random(100, 100)
		if (chancetoproc==100) then
			query = CharDBQuery("SELECT points FROM shard_aa_points WHERE playerguid="..killer:GetGUIDLow().."")
			points = (query:GetUInt32(0))+1
			CharDBExecute("UPDATE shard_aa_points SET points="..points.." WHERE playerguid="..killer:GetGUIDLow().."")
			killer:SendBroadcastMessage("|cff41E62EYou've gained an Alternate Advancement point! Total points: "..points.."")
		end
	end
end
--RegisterPlayerEvent(7, bonusxp)

--[[
Needs to be reworked so that
everyone in the group recieves
bonus exp.    -NotHawthorne  ]]