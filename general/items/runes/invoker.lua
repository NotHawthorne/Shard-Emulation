local function invoker (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==25936) then
		player:LearnSpell(818022, player) --WEX
		player:LearnSpell(818023, player) --QUAS
		player:LearnSpell(818024, player) --EXORT
		player:LearnSpell(818025, player) --INVOKE
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==818022)  or (spell:GetEntry()==818023) or (spell:GetEntry()==818024) or (spell:GetEntry()==818025) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=25936) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=25936) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=25936) and (player:GetEquippedItemBySlot(13):GetEntry()~=25936)) then	
			spell:Cancel()
			player:RemoveSpell(818022, player)
			player:RemoveSpell(818023, player)
			player:RemoveSpell(818024, player)
			player:RemoveSpell(818025, player)
		end
	end
end
RegisterPlayerEvent(29, invoker)
RegisterPlayerEvent(5, unlearn)