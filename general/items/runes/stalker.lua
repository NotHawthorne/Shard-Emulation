local function stalker (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==11815) then
		player:LearnSpell(51690, player) --KILLING SPREE
		player:LearnSpell(1856, player) -- VANISH
		player:LearnSpell(16511, player) -- HEMO
		player:LearnSpell(921, player) -- PILFER
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==51690) or (spell:GetEntry()==1856) or (spell:GetEntry()==16511) or (spell:GetEntry()==921) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=11815) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=11815) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=11815) and (player:GetEquippedItemBySlot(13):GetEntry()~=11815)) then	
			spell:Cancel()
			player:RemoveSpell(51690, player)
			player:RemoveSpell(1856, player)
			player:RemoveSpell(16511, player)
			player:RemoveSpell(921, player)
		end
	end
end
RegisterPlayerEvent(29, stalker)
RegisterPlayerEvent(5, unlearn)