local function additem (event, player, creature, quest)
	if quest:GetId()==818008 then
		player:AddItem(1362, 1)
	end
end
RegisterCreatureEvent(17849, 31, additem)