local function assassin (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==42991) then
		player:LearnSpell(36554, player) --SHADOWSTEP
		player:LearnSpell(1329, player) -- MUTILATE
		player:LearnSpell(1833, player) --CHEAP SHOT
		player:LearnSpell(19145, player) --SEAL FATE
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==36554) or (spell:GetEntry()==1329) or (spell:GetEntry()==1833) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=42991) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=42991) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=42991) and (player:GetEquippedItemBySlot(13):GetEntry()~=42991)) then	
			spell:Cancel()
			player:RemoveSpell(36554, player)
			player:RemoveSpell(1329, player)
			player:RemoveSpell(1833, player)
			player:RemoveSpell(19145, player)
		end
	end
end
RegisterPlayerEvent(29, assassin)
RegisterPlayerEvent(5, unlearn)