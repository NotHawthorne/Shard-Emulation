local function focused_strike (event, player, spell)
	if (spell:GetEntry()==818001) then
		local INT = (player:GetStat(3))*0.75
		local target = spell:GetTarget()
		player:SendBroadcastMessage("Focused Strike deals "..INT.." bonus damage from your intelligence!")
		player:DealDamage(target, INT)
	else
	end
end
--RegisterPlayerEvent(5, focused_strike)