local function changezone (event, player, newZone, newArea)
	if (newZone~=618) and (newzone~=616) and (newzone~=493) and (newzone~=44) and (newzone~=405) and (newzone~=361) and (n then
        player:Teleport(1, 7638, -4016, 704.17, 0.48)
		player:SendBroadcastMessage("No going outside of the playpen!")
	end
end

RegisterPlayerEvent(27, changezone)