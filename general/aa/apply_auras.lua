local function apply_aa (event, player)
	local db = CharDBQuery("SELECT selection,points,category FROM shard_aa_allocation WHERE playerguid="..player:GetGUIDLow().." ORDER BY category ASC")
	repeat
		--local category=db:GetUInt32(0)
		local selection=db:GetUInt32(0)
		local points=db:GetUInt32(1)
		local category=db:GetUInt32(2)
		
		--[[WEAPONMASTERY]]--
		if (category==1) then
			if (selection==1) then
				if (points==1) then
					player:AddAura(13706, player)
					player:SendBroadcastMessage("werk")
				elseif (points==2) then
					player:AddAura(13804, player)
				elseif (points==3) then
					player:AddAura(13805, player)
				elseif (points==4) then
					player:AddAura(13806, player)
				elseif (points==5) then
					player:AddAura(13807, player)
				end
			elseif (selection==2) then				--PRECISION
				if (points==1) then
					player:AddAura(29590, player)
				elseif (points==2) then
					player:AddAura(29591, player)
				elseif (points==3) then
					player:AddAura(29592, player)
				end
			elseif (selection==3) then				--1H SPEC
				if (points==1) then
					player:AddAura(16538, player)
				elseif (points==2) then
					player:AddAura(16539, player)
				elseif (points==3) then
					player:AddAura(16540, player)
				elseif (points==4) then
					player:AddAura(16541, player)
				elseif (points==5) then
					player:AddAura(16542, player)
				end
			elseif (selection==6) then				--SWORD SPEC
				if (points==1) then
					player:AddAura(12281, player)
				elseif (points==2) then
					player:AddAura(12812, player)
				elseif (points==3) then
					player:AddAura(12813, player)
				elseif (points==4) then
					player:AddAura(12814, player)
				elseif (points==5) then
					player:AddAura(12815, player)
				end
			elseif (selection==4) then				--2H SPEC
				if (points==1) then
					player:AddAura(20111, player)
				elseif (points==2) then
					player:AddAura(20112, player)
				elseif (points==3) then
					player:AddAura(20113, player)
				end
			elseif (selection==5) then				--DW SPEC
				if (points==1) then
					player:AddAura(13715, player)
				elseif (points==2) then
					player:AddAura(13848, player)
				elseif (points==3) then
					player:AddAura(13849, player)
				elseif (points==4) then
					player:AddAura(13851, player)
				elseif (points==5) then
					player:AddAura(13852, player)
				end
			end
		end

		--[[DEFENSE]]--
		if (category==2) then
			if (selection==1) then
				
			end
		end
		until not db:NextRow()
end

RegisterPlayerEvent(3, apply_aa)