local function dragoon (event, player, item, bag, slot)
	local playerguid = player:GetGUIDLow()
	if (item:IsEquipped()) and (item:GetEntry()==25994) then
		player:LearnSpell(24292, player) --DRAGON SLAYING
		player:LearnSpell(19879, player) --TRACK DRAGONKIN
		player:LearnSpell(100, player) --CHARGE
		player:LearnSpell(781, player) --DISENGAGE
		player:LearnSpell(53399, player) --SWEEPING SLAM
		player:LearnSpell(101, player) --TRIP
		player:LearnSpell(23922, player) --SHIELD SLAM
		player:LearnSpell(2565, player) --SHIELD BLOCK
	end
end
local function unlearn (event, player, spell)
	if (spell:GetEntry()==19879) or ((spell:GetEntry()==100) and (player:GetClass()~=1)) or (spell:GetEntry()==65869) or (spell:GetEntry()==53399) or (spell:GetEntry()==101) or (spell:GetEntry()==23922) or  (spell:GetEntry()==2565) then
		if 
		((player:GetEquippedItemBySlot(12)==nil) and (player:GetEquippedItemBySlot(13)==nil)) or 
		((player:GetEquippedItemBySlot(12):GetEntry()~=25994) and (player:GetEquippedItemBySlot(13)==nil)) or
		((player:GetEquippedItemBySlot(13):GetEntry()~=25994) and (player:GetEquippedItemBySlot(12)==nil)) or
		((player:GetEquippedItemBySlot(12):GetEntry()~=25994) and (player:GetEquippedItemBySlot(13):GetEntry()~=25994)) then	
			if (player:GetClass()==1) then
				player:RemoveSpell(24292, player)
				player:RemoveSpell(19879, player)
				player:RemoveSpell(781, player)
				player:RemoveSpell(53399, player)
				player:RemoveSpell(101, player)
				player:RemoveAura(19879, player)
			else
				spell:Cancel()
				player:RemoveSpell(24292, player)
				player:RemoveSpell(19879, player)
				player:RemoveSpell(100, player)
				player:RemoveSpell(781, player)
				player:RemoveSpell(53399, player)
				player:RemoveSpell(101, player)
				player:RemoveSpell(23922, player)
				player:RemoveSpell(2565, player)
				player:RemoveAura(19879, player)
			end
		end
	end
end
RegisterPlayerEvent(29, dragoon)
RegisterPlayerEvent(5, unlearn)