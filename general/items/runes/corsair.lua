local function corsair (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==1713) then
		player:LearnSpell(14278, player) --GHOSTLY STRIKE
		player:LearnSpell(26669, player) --EVASION
		player:LearnSpell(58567, player) --SUNDER ARMOR
		player:LearnSpell(13789, player) --LIGHTNING REFLEXES
		player:LearnSpell(20243, player) --DEVASTATE
		player:AddItem(12185, player) --PIRATE HAT
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==14278)  or ((spell:GetEntry()==26669) and (player:GetClass()~=3)) or (spell:GetEntry()==58567) or (spell:GetEntry()==20243)  then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=1713) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=1713) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=1713) and (player:GetEquippedItemBySlot(13):GetEntry()~=1713)) then	
			spell:Cancel()
			player:RemoveSpell(14278, player)
			player:RemoveSpell(26669, player)
			player:RemoveSpell(58567, player)
			player:RemoveSpell(13789, player)
			player:RemoveSpell(20243, player)
			player:RemoveSpell(5277, player)
			player:RemoveAura(26669, player)
			player:RemoveAura(5277, player)
			player:RemoveItem(12185, player) --PIRATE HAT
		end
	end
end
RegisterPlayerEvent(29, corsair)
RegisterPlayerEvent(5, unlearn)