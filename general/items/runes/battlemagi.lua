local function battlemagi (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==21567) then
		player:LearnSpell(2139, player) --COUNTERSPELL
		player:LearnSpell(15091, player) --BLAST WAVE
		player:LearnSpell(1953, player) --BLINK
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==2139) or (spell:GetEntry()==15091) or (spell:GetEntry()==1953) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=21567) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=21567) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=21567) and (player:GetEquippedItemBySlot(13):GetEntry()~=21567)) then	
			spell:Cancel()
			player:RemoveSpell(15091, player)
			if ((player:GetClass())~=8) then
				player:RemoveSpell(1953, player)
				player:RemoveSpell(2139, player)
			end
		end
	end
end
RegisterPlayerEvent(29, battlemagi)
RegisterPlayerEvent(5, unlearn)