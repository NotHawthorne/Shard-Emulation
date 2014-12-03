local function FFAPvP(event, pKiller, pKilled)

    --VARIABLE DEFINITION
    local VendorID = 818001		--EntryID of the first empty vendor NPC.
    local VendorCount = 1		--Number of vendors you've added in creature_template.
    local DespawnTime = 300000 	-- NPC despawn time in milliseconds.
	local ColorCodeTable = {"C79C6E", "F58CBA", "ABD473", "FFF569", "FFFFFF", "C41F3B", "0070DE", "69CCF0", "9482C9", nil, "FF7D0A"}
	local pKilled_colorCode = ColorCodeTable[pKiller:GetClass()]
	local pKiller_colorCode = ColorCodeTable[pKilled:GetClass()]
	local killerguild_name = nil
	local killedguild_name = nil
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
	local DeathAnnouncements = {
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", got rekt by |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name.."!",
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", got knocked in da gabba by |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name.."!",
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", had their behind superfluously carved by |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name.."!",
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", had their lease on life terminated by |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name.."!",
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", died of an iron overdose, courtesy of |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name..".",
		"[PvP]: |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r"..killedguild_name..", wanted a piece of |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r"..killerguild_name..", but bit off a little more than they could chew!"
	}
	local DeathAnnouncementsCount = 6 --Equal to the amount of Death Announcements defined in the table above.
	local DishonorableKillAnnouncement = "[PvP]: |cffff0000Everyone give a big round of applause to|r |CFF"..pKiller_colorCode..""..pKiller:GetName().."|r |cffff0000"..killerguild_name..", for killing|r |CFF"..pKilled_colorCode..""..pKilled:GetName().."|r|cffff0000, whom is "..(pKiller:GetLevel()-pKilled:GetLevel()).." levels below them.|r"
	local pKilledGUID = pKilled:GetGUIDLow()
	local pKillerGUID = pKiller:GetGUIDLow()
	local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
	local inven_ticker = 0

	--MAIN FUNCTION
	if ((pKiller:GetLevel())-(pKilled:GetLevel())<4) then
		local VendorRoll = (math.random(1, VendorCount)-1)+VendorID
		VendorRemoveAllItems(VendorRoll)
		pKiller:SpawnCreature(VendorRoll, x, y, z, 2.5, 1, DespawnTime)
		repeat
			inven_ticker = inven_ticker+1
			local checkitem = pKilled:GetItemByPos(255, inven_ticker)
			if (checkitem~=nil) and (checkitem:IsBag()==false) and (checkitem:GetEntry()~=6948) then
				AddVendorItem(VendorRoll, checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()), DespawnTime, 0)
			end
		until (inven_ticker>=38)
		SendWorldMessage(DeathAnnouncements[math.random(1,DeathAnnouncementsCount)])
	else
		SendWorldMessage(DishonorableKillAnnouncement)
	end
end
--RegisterPlayerEvent(6, FFAPvP) 