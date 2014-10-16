local function blackmask (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==21568) then
		player:LearnSpell(19883, player) --TRACK HUMANOIDS
		player:LearnSpell(1784, player) --STEALTH
		player:LearnSpell(31615, player) -- PLACE BOUNTY
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==19883) or (spell:GetEntry()==1784) or (spell:GetEntry()==31615) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=21568) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=21568) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=21568) and (player:GetEquippedItemBySlot(13):GetEntry()~=21568)) then
			if ((player:GetClass())~=4) then
				spell:Cancel()
				player:RemoveSpell(1784, player)
				player:RemoveSpell(19883, player)
				player:RemoveSpell(31615, player)
			else
				player:RemoveSpell(19883, player)
				player:RemoveSpell(31615, player)
			end
	end end
end
RegisterPlayerEvent(29, blackmask)
RegisterPlayerEvent(5, unlearn)