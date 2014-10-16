local function essence_implosion (event, player, spell)

	local target = spell:GetTarget()
	local id = 818016
	
	if (spell:GetEntry()==818016) then
		local aura = target:GetAura(818009)
		if (aura) then
			player:SendBroadcastMessage("Essence Implosion deals "..((aura:GetStackAmount())*52).." bonus damage from your Essence Leak stacks!")
			player:DealDamage(target, ((aura:GetStackAmount())*102))
		else
			player:SendBroadcastMessage("Target has no stacks of Essence Leak!")
			spell:Cancel()
		end
	else
	end
end
RegisterPlayerEvent(5, essence_implosion)