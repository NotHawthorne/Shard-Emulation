local function archmage (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==21566) then
		player:LearnSpell(26208, player) --RESIST SILENCE
		player:LearnSpell(60209, player) --SILENCE DURATION
		player:LearnSpell(50182, player) --HASTE AURA
		player:LearnSpell(30449, player) --SPELLSTEAL
		player:LearnSpell(31589, player) --SLOW
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==50182) or (spell:GetEntry()==30449) or (spell:GetEntry()==31589) then
		if (spell:GetEntry()==19137) then
			player:RemoveSpell(19137, player)
			player:SendBroadcastMessage("Sorry Carl!")
		else
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=21566) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=21566) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=21566) and (player:GetEquippedItemBySlot(13):GetEntry()~=21566)) then	
			spell:Cancel()
			player:RemoveSpell(25208, player)
			player:RemoveSpell(60209, player)
			player:RemoveSpell(50182, player)
			player:RemoveSpell(30449, player)
			player:RemoveSpell(19137, player)
		end
		end
	end
end
RegisterPlayerEvent(29, archmage)
RegisterPlayerEvent(5, unlearn)