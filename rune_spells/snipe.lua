local function snipe (event, player, spell)
	if (spell:GetEntry()==20900) then
		local target = spell:GetTarget()
		local aura = target:GetAura(1130)
		if (aura) then
		else
			player:SendBroadcastMessage("Snipe requires Hunter's Mark to be applied to the target!")
			spell:Cancel()
		end
	end
	
end
RegisterPlayerEvent(5, snipe)