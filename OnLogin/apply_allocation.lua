--stat_allocation_system
sas = {}
sas.getStats = nil
sas.stas = {}
function sas.apply_allocation(event, player)
	
	sas.getStats = CharDBQuery("SELECT str, agi, sta, inte, spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
	sas.stats = {
		["str"] = {sas.getStats:GetUInt32(0), 7464},
		["agi"] = {sas.getStats:GetUInt32(1), 7471},
		["sta"] = {sas.getStats:GetUInt32(2), 7477},
		["inte"] = {sas.getStats:GetUInt32(3), 7468},
		["spi"] = {sas.getStats:GetUInt32(4), 7474}
	}

	for stat, stat_data in pairs(sas.stats) do
		if (stat_data[0] > 0) then
			local i = 0
			repeat
				player:AddAura(spell_data[1], player)
				i = i + 1
			until (i == stat_data[0])
		end
	end
	if ( sas.calculate_speed() > 0 ) then
		local i = 1
		repeat
			i = i + 0.01 
		until ( i >= sas.calculate_speed() )
		player:SetSpeed(1, i, true)
	end
	player:AddAura(7711, player) --Modded in the DBC files, this is the auto attack energy aura now.
end

function sas.calculate_speed() --Created for advanced speed calculation later.
	return sas.getStats:GetUInt32(1) / 80
end
RegisterPlayerEvent(3, sas.apply_allocation)

--[[
	Mana regeneration should be moved here, along with stat registration.
	This script should contain player_data_handling solely.
]]