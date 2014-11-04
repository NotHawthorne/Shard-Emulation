local function unleash (event, player, spell)

	local target = spell:GetTarget()
	
	if (spell:GetEntry()==818050) then
		local aura = player:GetAura(818021)
		if (aura) then
			player:SendBroadcastMessage("Unleash Anger "..((aura:GetStackAmount())*35).." and consumes your Rage stacks!")
			player:DealDamage(target, ((aura:GetStackAmount())*35))
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
			player:RemoveAura(818021)
		else
			player:SendBroadcastMessage("You have no Rage stacks! No bonus damage for you.")
		end
	else
	end
end
--RegisterPlayerEvent(5, unleash)