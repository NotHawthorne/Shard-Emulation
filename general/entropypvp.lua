--Full Loot On Death Script by NotHawthorne of ModCraft--
local function FFAPvP(event, pKiller, pKilled)
		--Fetch Guild Names
		if (pKiller:GetGuildName()~=nil) then
			killerguild_name = " of "..pKiller:GetGuildName()..""
		else
			killerguild_name = ", a Lone Wolf"
		end
		if (pKilled:GetGuildName()~=nil) then
			killedguild_name = " of"..killedguild:GetName()..""
		else
			killedguild_name = ", a Lone Wolf"
		end
		
		--Class color codes (Killed)
		killed_color = 0
		if (pKilled:GetClass()==1) then killed_color = "C79C6E"
		elseif (pKilled:GetClass()==2) then killed_color = "F58CBA"
		elseif (pKilled:GetClass()==3) then killed_color = "ABD473"
		elseif (pKilled:GetClass()==4) then killed_color = "FFF569"
		elseif (pKilled:GetClass()==5) then killed_color = "FFFFFF"
		elseif (pKilled:GetClass()==6) then killed_color = "C41F3B"
		elseif (pKilled:GetClass()==7) then killed_color = "0070DE"
		elseif (pKilled:GetClass()==8) then killed_color = "69CCF0"
		elseif (pKilled:GetClass()==9) then killed_color = "9482C9"
		elseif (pKilled:GetClass()==11) then killed_color = "FF7D0A"
		elseif (pKilled:GetClass()==12) then killed_color = "EB2FDE" end
		
		--Class color codes (Killer)
		killer_color = 0
		if (pKiller:GetClass()==1) then killer_color = "C79C6E"
		elseif (pKiller:GetClass()==2) then killer_color = "F58CBA"
		elseif (pKiller:GetClass()==3) then killer_color = "ABD473"
		elseif (pKiller:GetClass()==4) then killer_color = "FFF569"
		elseif (pKiller:GetClass()==5) then killer_color = "FFFFFF"
		elseif (pKiller:GetClass()==6) then killer_color = "C41F3B"
		elseif (pKiller:GetClass()==7) then killer_color = "0070DE"
		elseif (pKiller:GetClass()==8) then killer_color = "69CCF0"
		elseif (pKiller:GetClass()==9) then killer_color = "9482C9"
		elseif (pKiller:GetClass()==11) then killer_color = "FF7D0A"
		elseif (pKiller:GetClass()==12) then killer_color = "EB2FDE" end
	if ((pKiller:GetLevel())-(pKilled:GetLevel())<4) then
		local receiver = pKiller:GetGUIDLow()
		local pKilledGUID = pKilled:GetGUIDLow()
		local pKillerGUID = pKiller:GetGUIDLow()
		local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
		local VendorID = math.random(1,10)+818000
		local kill_message = math.random(1,6)
		VendorRemoveAllItems(VendorID)
		pKilled:SaveToDB()
		pKiller:SaveToDB()												--Save Players to DB
		pKiller:SpawnCreature(VendorID, x, y, z, 2.5, 1, 300000)			--Spawn Loot Ghost
		local KilledDB = CharDBQuery("SELECT item_template,item FROM character_inventory WHERE guid = ("..pKilledGUID..") AND slot <= 38 GROUP BY item_template ORDER BY item_template DESC") --CharDB Query 
		repeat
			local itemtemplate = KilledDB:GetString(0)
			local itemid = KilledDB:GetUInt32(1)
			local lastitemindb = 817999
			local itemlink = GetItemLink(itemtemplate)
			if (tonumber(itemtemplate)<=lastitemindb) and (tonumber(itemtemplate)~=6948) and (tonumber(itemtemplate)~=25994) and (tonumber(itemtemplate)~=42991) and (tonumber(itemtemplate)~=11815) then			--Loops through players inventory, excluding ones beyond entryID 817999
				AddVendorItem(VendorID, itemtemplate, 1, 10000, 0)
				pKilled:RemoveItem(itemtemplate, 1)
			else
				pKiller:SendBroadcastMessage(""..pKilled:GetName().."'s item: "..itemlink.." is soulbound and will not be dropped!")			--If itemID >818000, then the item won't drop and player gets this message
			end
		until not KilledDB:NextRow()
		
		--Kill Announcer
		if (kill_message==1) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", got rekt by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!")
		elseif (kill_message==2) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", got knocked in da gabba by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!")
		elseif (kill_message==3) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", had their behind superfluously carved by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!")
		elseif (kill_message==4) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", had their lease on life terminated by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!")
		elseif (kill_message==5) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", died of an iron overdose, courtesy of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..".")
		elseif (kill_message==6) then
			SendWorldMessage("[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", wanted a piece of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..", but bit off a little more than they could chew!")
		end
	else
		SendWorldMessage("[PvP]: |cffff0000Everyone give a big round of applause to|r |CFF"..killer_color..""..pKiller:GetName().."|r |cffff0000"..killerguild_name..", whom is level "..pKiller:GetLevel()..", killed|r |CFF"..killed_color..""..pKilled:GetName().."|r|cffff0000, a level "..pKilled:GetLevel()..".|r")
	end
end

RegisterPlayerEvent(6, FFAPvP)										--Triggered when player dies