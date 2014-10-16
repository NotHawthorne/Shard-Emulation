local function aero (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==19340) then
		player:LearnSpell(8232, player) --WHIRLWIND WEAPON
		player:LearnSpell(33786, player) -- CYCLONE
		player:LearnSpell(8385, player) -- SWIFT WIND
		player:LearnSpell(32182, player) -- HERO
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==57784) or (spell:GetEntry()==8232) or (spell:GetEntry()==33786) or (spell:GetEntry()==8385) or (spell:GetEntry()==55866) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=19340) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=19340) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=19340) and (player:GetEquippedItemBySlot(13):GetEntry()~=19340)) then	
			spell:Cancel()
			player:RemoveSpell(33786, player)
			player:RemoveSpell(8385, player)
			player:RemoveSpell(57784, player)
			player:RemoveSpell(55866, player)
		    player:RemoveSpell(32182, player) -- HERO
			if ((player:GetClass())~=7) then
				player:RemoveSpell(8232, player)
			end
			player:RemoveAura(32182, player)
			player:RemoveAura(8385, player)
		end
	end
end
RegisterPlayerEvent(29, aero)
RegisterPlayerEvent(5, unlearn)