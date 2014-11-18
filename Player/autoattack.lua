function auto_attack(event, player, spell)
	if (spell:GetEntry() == 7712) then
		if (player:GetPower(3) >= 75) then
			player:CastSpell(player, 69488, false)
		else
			player:CastSpell(player, 63726, false)
			player:SendBroadcastMessage("|cffff0000You are too exhausted to attack!|r")
		end
	end
end
RegisterPlayerEvent(5, auto_attack)