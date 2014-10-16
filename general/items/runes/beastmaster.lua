local function beast (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==19120) then
		player:LearnSpell(196, player) --AXES
		player:LearnSpell(13964, player) --HACK AND SLASH
		player:LearnSpell(51533, player) --FERAL SPIRIT
		player:LearnSpell(17364, player) -- STORMSTRIKE
		player:LearnSpell(1515, player) -- TAME BEAST
		player:LearnSpell(6991, player) -- FEED PET
		player:LearnSpell(982, player) -- REVIVE PET
		player:LearnSpell(883, player) -- CALL PET
		player:LearnSpell(5149, player) -- TRAINING
		player:LearnSpell(2641, player) -- DISMISS
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==51533) or (spell:GetEntry()==17364) or (spell:GetEntry()==1515) or (spell:GetEntry()==6991) or (spell:GetEntry()==982) or (spell:GetEntry()==883) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=19120) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=19120) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=19120) and (player:GetEquippedItemBySlot(13):GetEntry()~=19120)) then	
			spell:Cancel()
			player:RemoveSpell(51533, player)
			player:RemoveSpell(13964, player)
			player:RemoveSpell(17364, player)
			player:RemoveSpell(1515, player)
			player:RemoveSpell(6991, player)
			player:RemoveSpell(982, player)
			player:RemoveSpell(883, player)
			player:RemoveSpell(5149, player)
			player:RemoveSpell(2641, player)
			if ((player:GetClass()~=1) and (player:GetClass()~=4)) then 
				player:RemoveSpell(196, player)
			end
		end
	end
end
RegisterPlayerEvent(29, beast)
RegisterPlayerEvent(5, unlearn)