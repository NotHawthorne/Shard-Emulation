local function sniper (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==47213) then
		player:LearnSpell(20900, player) --SNIPE
		player:LearnSpell(53351, player) --KILL SHOT
		player:LearnSpell(6197, player) --EAGLE EYE
		player:LearnSpell(1499, player) --FREEZING TRAP
		player:LearnSpell(264, player) --BOWS
		player:LearnSpell(1130, player) --HUNTER'S MARK
		player:RemoveSpell(19434, player)
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==20900)  or (spell:GetEntry()==53351) or (spell:GetEntry()==6197) or (spell:GetEntry()==1499) or (spell:GetEntry()==1130) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=47213) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=47213) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=47213) and (player:GetEquippedItemBySlot(13):GetEntry()~=47213)) then	
			spell:Cancel()
			player:RemoveSpell(20900, player)
			player:RemoveSpell(53351, player)
			player:RemoveSpell(6197, player)
			player:RemoveSpell(1499, player)
			if (player:GetClass()~=3) then
				player:RemoveSpell(264, player)
			end
			player:RemoveSpell(19434, player)
		end
	end
end
RegisterPlayerEvent(29, sniper)
RegisterPlayerEvent(5, unlearn)