local function changezone (event, player, newZone, newArea)
	if (newZone==1519) then
		player:SendBroadcastMessage("Entered Stormwind City!")
	end
end

RegisterPlayerEvent(27, changezone)