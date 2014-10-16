local function place_bounty (event, pKiller, pKilled)
	local aura = pKilled:GetAura(31615)
	if (aura) then
		if 
		((pKilled:GetEquippedItemBySlot(12)==nil) and (pKilled:GetEquippedItemBySlot(13)==nil)) or 
		((pKilled:GetEquippedItemBySlot(12):GetEntry()~=21568) and (pKilled:GetEquippedItemBySlot(13)==nil)) or
		((pKilled:GetEquippedItemBySlot(13):GetEntry()~=21568) and (pKilled:GetEquippedItemBySlot(12)==nil)) or
		((pKilled:GetEquippedItemBySlot(12):GetEntry()~=21568) and (pKilled:GetEquippedItemBySlot(13):GetEntry()~=21568)) then	
			pKiller:AddItem(40753, 7)
		end
	end
end
RegisterPlayerEvent(6, place_bounty)