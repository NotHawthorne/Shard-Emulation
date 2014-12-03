local spell_ids = {24292, 19879, 100, 781, 53399, 101, 23922, 2565}
--[[ DRAGON SLAYING, TRACK DRAGONKIN, CHARGE, DISENGAGE, SWEEPING, SLAM, TRIP, SHIELD, SLAM, SHIELD BLOCK ]]
local function dragoon (event, player, item, bag, slot)
	if (item:IsEquipped()) and (item:GetEntry()==25994) then
		for _k, spell in pairs(spell_ids) do
			player:LearnSpell(spell, player)
		end
	end
end
local function unlearn (event, player, spell)
	for _k, spellID in pairs(spell_ids) do
		if (spellID == spell:GetEntry()) then
			if ((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
			((player:GetEquippedItemBySlot(12):GetEntry()~=25994) and (player:GetEquippedItemBySlot(13)==nil)) or
			((player:GetEquippedItemBySlot(13):GetEntry()~=25994) and (player:GetEquippedItemBySlot(12)==nil)) or
			((player:GetEquippedItemBySlot(12):GetEntry()~=25994) and (player:GetEquippedItemBySlot(13):GetEntry()~=25994)) then
				spell:Cancel()
				for _k, remove_spell in pairs(spell_ids)
					if (player:GetClass() ~= 1) then
						player:RemoveSpell(remove_spell, player)
					elseif((remove_spell ~= 100) or (remove_spell ~= 23922) or (remove_spell ~= 2565))
						player:RemoveSpell(remove_spell, player)
					end
				end
			end
		end
	end
end
RegisterPlayerEvent(29, dragoon)
RegisterPlayerEvent(5, unlearn)