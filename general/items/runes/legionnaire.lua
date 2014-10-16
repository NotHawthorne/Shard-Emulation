local function battlemagi (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==21565) then
		player:LearnSpell(202, player) --TWO-HANDED SWORDS
		player:LearnSpell(30814, player) --MENTAL QUICKNESS
		player:LearnSpell(51885, player) --MENTAL DEX
		player:LearnSpell(12963, player) --IMP OP
		player:LearnSpell(7887, player) -- OVERPOWER
		player:LearnSpell(57789, player) -- MORTAL STRIKE
		player:LearnSpell(12849, player) -- DEEP WOUNDS
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==7887) or (spell:GetEntry()==57789) or (spell:GetEntry()==34097) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=21565) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=21565) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=21565) and (player:GetEquippedItemBySlot(13):GetEntry()~=21565)) then	
			spell:Cancel()
			player:RemoveSpell(30814, player)
			player:RemoveSpell(51885, player)
			player:RemoveSpell(12963, player)
			player:RemoveSpell(7887, player)
			player:RemoveSpell(57789, player)
			player:RemoveSpell(12849, player)
			if ((player:GetClass())~=1) and ((player:GetClass())~=2) then
				player:RemoveSpell(202, player)
			end
		end
	end
end
RegisterPlayerEvent(29, battlemagi)
RegisterPlayerEvent(5, unlearn)