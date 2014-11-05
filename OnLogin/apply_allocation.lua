function apply_allocation (event, player)
	statdb = CharDBQuery("SELECT str, agi, sta, inte, spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
	allocated_str = statdb:GetUInt32(0)
	allocated_agi = statdb:GetUInt32(1)
	allocated_sta = statdb:GetUInt32(2)
	allocated_inte = statdb:GetUInt32(3)
	allocated_spi = statdb:GetUInt32(4)

	ticker1 = 0
	ticker2 = 0
	ticker3 = 0
	ticker4 = 0
	ticker5 = 0
	ticker6 = 0

	if (allocated_str>0) then
		repeat
			player:AddAura(7464, player)
			ticker1 = ((ticker1)+1)
		until (ticker1==allocated_str)
	end
	
	if (allocated_agi>0) then
		repeat
			player:AddAura(7471, player)
			ticker2 = ((ticker2)+1)
		until (ticker2==allocated_agi)
	end
	
	if (allocated_sta>0) then
		repeat
			player:AddAura(7477, player)
			ticker3 = ((ticker3)+1)
		until (ticker3==allocated_sta)
	end
	
	if (allocated_inte>0) then
		repeat
			player:AddAura(7468, player)
			ticker4 = ((ticker4)+1)
		until (ticker4==allocated_sta)
	end
	
	if (allocated_spi>0) then
		repeat
			player:AddAura(7474, player)
			ticker5 = ((ticker5)+1)
		until (ticker5==allocated_sta)
	end
	
	speed = ((player:GetStat(1)/80))
	
	if (speed>0) then
		ticker6=1
		repeat
			ticker6 = ((ticker6)+0.01)
		until (ticker6>=speed)
		player:SetSpeed(1, ticker6, true)
	end
	
	player:AddAura(7711, player)			--Modded in the DBC files, this is the auto attack energy aura now.
		
end


RegisterPlayerEvent(3, apply_allocation)