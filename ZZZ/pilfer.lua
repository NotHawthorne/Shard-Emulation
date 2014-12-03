local function pilfer (event, player, spell)

	local target = spell:GetTarget()
	local id = 921
	
	if (spell:GetEntry()==921) then
	
		local slot_roll = math.random (1,38)
		local target_guid = target:GetGUIDLow()
		local target_query = CharDBQuery("SELECT item_template,item FROM character_inventory WHERE guid = ("..target_guid..") AND slot = ("..slot_roll..")")
		if (target_query == nil) then
			player:SendBroadcastMessage("Pilfer attempt failed!")
		else
			local itemtemplate = target_query:GetString(0)
			local itemid = target_query:GetUInt32(1)
			local lastitemindb = 818000
			local itemlink = GetItemLink(itemtemplate)
			player:SendBroadcastMessage("slot_roll: "..slot_roll..", target_guid: "..target_guid.."")
			player:SendBroadcastMessage("You took "..itemlink.."!")

			player:SaveToDB()
			target:SaveToDB()
		
			if (tonumber(itemtemplate)<=lastitemindb) then 						--invoke inventory function
				player:AddItem(itemtemplate, 1)
				target:RemoveItem(itemtemplate, 1)
			else
				player:SendBroadcastMessage("Pilfer attempt failed!")
			end
	
			player:SaveToDB()
			target:SaveToDB()
		end
	end
end

RegisterPlayerEvent(5, pilfer)