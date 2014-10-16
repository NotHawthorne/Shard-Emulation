local function cleric (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==19812) then
		player:LearnSpell(20271, player) --JUDGEMENT OF LIGHT
		player:LearnSpell(53653, player) --BEACON OF LIGHT
		player:LearnSpell(20165, player) --SEAL OF LIGHT
		player:LearnSpell(2060, player) -- GREATER HEAL
		player:LearnSpell(9474, player) -- FLASH HEAL
	end
end
local function unlearn (event, player, spell)
	if ((spell:GetEntry()==20271) and (player:GetClass()~=2)) or (spell:GetEntry()==53653) or (spell:GetEntry()==20165) or (spell:GetEntry()==2060) or (spell:GetEntry()==9474) or (spell:GetEntry()==9473) or (spell:GetEntry()==9472) or (spell:GetEntry()==2061) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=19812) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=19812) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=19812) and (player:GetEquippedItemBySlot(13):GetEntry()~=19812)) then	
			spell:Cancel()
			if (player:GetClass()==2) then
				player:RemoveSpell(53653, player)
				player:RemoveSpell(2060, player)
				player:RemoveSpell(20165, player)
				player:RemoveSpell(9474, player)
				player:RemoveSpell(9473, player)
				player:RemoveSpell(9472, player)
				player:RemoveSpell(2061, player)
				player:RemoveAura(20165, player)
			else
				player:RemoveSpell(20271, player)
				player:RemoveSpell(53653, player)
				player:RemoveSpell(2060, player)
				player:RemoveSpell(20165, player)
				player:RemoveSpell(9474, player)
				player:RemoveSpell(9473, player)
				player:RemoveSpell(9472, player)
				player:RemoveSpell(2061, player)
				player:RemoveAura(20165, player)
			end
		end	
	end
end
RegisterPlayerEvent(29, cleric)
RegisterPlayerEvent(5, unlearn)