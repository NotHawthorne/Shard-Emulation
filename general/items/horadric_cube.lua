local function save (event, player, item, target)
	if (item:GetEntry()==25647) then
		player:SaveToDB()
	end
end
local function horadric (event, player, spell)
	if (spell:GetEntry()==818054) then
	player:SaveToDB()
	local guid = player:GetGUIDLow()
	local KilledDB = CharDBQuery("SELECT item_template,item FROM character_inventory WHERE guid = ("..guid..") AND slot = 0 AND bag = 24873 GROUP BY item_template ORDER BY item_template DESC") --CharDB Query 
	if (KilledDB~=nil) then
		repeat
			local itemtemplate = KilledDB:GetString(0)
			local itemid = KilledDB:GetUInt32(1)
			local raritydb = WorldDBQuery("SELECT Quality FROM item_template WHERE entry = "..itemtemplate.." GROUP BY Quality ORDER BY Quality DESC")
			local rarity = raritydb:GetString(0)
			local rolldb = WorldDBQuery("SELECT item FROM horadric_cube WHERE rarity = "..rarity.." ORDER BY RAND() LIMIT 1")
			local roll = rolldb:GetUInt32(0)
			local lastitemindb = 817999
			local itemlink = GetItemLink(itemtemplate)
			if (tonumber(itemtemplate)<=lastitemindb) and (tonumber(itemtemplate)~=6948) and (tonumber(itemtemplate)~=25994) then
				player:RemoveItem(itemtemplate, 1)
				player:AddItem(roll, 1)
				player:SendBroadcastMessage(""..roll.."")
			else
				player:SendBroadcastMessage(""..player:GetName().."'s item: "..itemlink.." is soulbound and will not be dropped!")			--If itemID >818000, then the item won't drop and player gets this message
			end
		until not KilledDB:NextRow()
	else
		player:SendBroadcastMessage("NotHawthorne sucks at scripting. Try that one again.")
	end
	player:SaveToDB()
	end
end

RegisterPlayerEvent(5, horadric)
RegisterItemEvent(25647, 2, save)