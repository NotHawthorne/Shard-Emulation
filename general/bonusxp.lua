local function bonusxp (event, killer, killed)
	if killer:IsInGroup() then
		local lvl = killed:GetLevel()
		local lvl2 = killer:GetLevel()
		if (lvl2-lvl>3) then
			killer:SendBroadcastMessage("No bonus experience because the mob you killed is far less powerful than you.")
		else
			killer:GiveXP((lvl*24), killer)
			killer:SendBroadcastMessage("You gain "..(lvl*24).." bonus experience from being in a group!")
		end
	end
end
RegisterPlayerEvent(7, bonusxp)