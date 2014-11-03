local function manaregen (event, player)
	if (player:GetStat(4)>1) then
		spirit = player:GetStat(4)
		repeat
			player:AddAura(21359, player)
			spirit = (spirit-2)
		until (spirit<=1)
	end
end

RegisterPlayerEvent(29, manaregen)
RegisterPlayerEvent(13, manaregen)
RegisterPlayerEvent(3, manaregen)