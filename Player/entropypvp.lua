--Full Loot On Death Script by NotHawthorne of ModCraft/EmuDevs--
local AIO = require("AIO")

--DEFINE VARS
local leveldiff = 5         --Amount of levels higher someone can be than the person they're killing and still recieve an HK
local decaytime = 300       --Time in seconds it takes for belongings to decay
local creaturedeath = true  --Enable inventory dropping on creature death?
local playerdeath = true    --Enable inventory dropping on player death?

guid_linking_table = {}
item_table = {}
remove_table = {}

--DEFINE LOOT FRAME
local FullLootFrame = AIO:CreateFrame("Frame", "FullLootFrame", "UIParent", nil)
FullLootFrame:SetSize(350, 500)
FullLootFrame:SetMovable(true)
FullLootFrame:SetEnabledMouse(true)
FullLootFrame:RegisterForDrag("LeftButton")
FullLootFrame:SetPoint("BOTTOMRIGHT", -270, 60)
FullLootFrame:SetToplevel(true)
FullLootFrame:SetClampedToScreen(true)
FullLootFrame:SetBackdrop({
	bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
	edgeSize = 20,
	--tile = true,
	--tilesize = 256,
	insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
FullLootFrame:SetScript("OnDragStart", "StartMoving")
FullLootFrame:SetScript("OnHide", AIO:ToFunction("select(1, ...):StopMovingOrSizing()"))
FullLootFrame:SetScript("OnDragStop", AIO:ToFunction("return function(self) self:StopMovingOrSizing() end", true))
FullLootFrame:Hide()
local FullLootFrame_TitleBar = AIO:CreateFrame("Frame", "FullLootFrame_TitleBar", FullLootFrame, nil)
FullLootFrame_TitleBar:SetSize(255, 25)
FullLootFrame_TitleBar:SetBackdrop({
	bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
	tile = true,
	edgeSize = 16,
	tileSize = 16,
	insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
FullLootFrame_TitleBar:SetPoint("TOP", 0, 9)
local FullLootFrame_TitleText = FullLootFrame_TitleBar:CreateFontString("FullLootFrame_TitleText")
FullLootFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
FullLootFrame_TitleText:SetSize(190, 5)
FullLootFrame_TitleText:SetPoint("CENTER", 0, 0)
local FullLootFrame_CloseButton = AIO:CreateFrame("Button", "FullLootFrame_CloseButton", FullLootFrame, "UIPanelCloseButton")
FullLootFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
FullLootFrame_CloseButton:SetEnabledMouse(true)
FullLootFrame_CloseButton:SetSize(27, 27)

local FullLoot_Button1 = AIO:CreateFrame("Button", "FullLoot_Button1", FullLootFrame, nil)
local FullLoot_Button2 = AIO:CreateFrame("Button", "FullLoot_Button2", FullLootFrame, nil)
local FullLoot_Button3 = AIO:CreateFrame("Button", "FullLoot_Button3", FullLootFrame, nil)
local FullLoot_Button4 = AIO:CreateFrame("Button", "FullLoot_Button4", FullLootFrame, nil)
local FullLoot_Button5 = AIO:CreateFrame("Button", "FullLoot_Button5", FullLootFrame, nil)
local FullLoot_Button6 = AIO:CreateFrame("Button", "FullLoot_Button6", FullLootFrame, nil)
local FullLoot_Button7 = AIO:CreateFrame("Button", "FullLoot_Button7", FullLootFrame, nil)
local FullLoot_Button8 = AIO:CreateFrame("Button", "FullLoot_Button8", FullLootFrame, nil)
local FullLoot_Button9 = AIO:CreateFrame("Button", "FullLoot_Button9", FullLootFrame, nil)
local FullLoot_Button10 = AIO:CreateFrame("Button", "FullLoot_Button10", FullLootFrame, nil)
local FullLoot_Button11 = AIO:CreateFrame("Button", "FullLoot_Button11", FullLootFrame, nil)
local FullLoot_Button12 = AIO:CreateFrame("Button", "FullLoot_Button12", FullLootFrame, nil)
local FullLoot_Button13 = AIO:CreateFrame("Button", "FullLoot_Button13", FullLootFrame, nil)
local FullLoot_Button14 = AIO:CreateFrame("Button", "FullLoot_Button14", FullLootFrame, nil)
local FullLoot_Button15 = AIO:CreateFrame("Button", "FullLoot_Button15", FullLootFrame, nil)
local FullLoot_Button16 = AIO:CreateFrame("Button", "FullLoot_Button16", FullLootFrame, nil)
local FullLoot_Button17 = AIO:CreateFrame("Button", "FullLoot_Button17", FullLootFrame, nil)
local FullLoot_Button18 = AIO:CreateFrame("Button", "FullLoot_Button18", FullLootFrame, nil)
local FullLoot_Button19 = AIO:CreateFrame("Button", "FullLoot_Button19", FullLootFrame, nil)
local FullLoot_Button20 = AIO:CreateFrame("Button", "FullLoot_Button20", FullLootFrame, nil)
local FullLoot_Button21 = AIO:CreateFrame("Button", "FullLoot_Button21", FullLootFrame, nil)
local FullLoot_Button22 = AIO:CreateFrame("Button", "FullLoot_Button22", FullLootFrame, nil)
local FullLoot_Button23 = AIO:CreateFrame("Button", "FullLoot_Button23", FullLootFrame, nil)
local FullLoot_Button24 = AIO:CreateFrame("Button", "FullLoot_Button24", FullLootFrame, nil)
local FullLoot_Button25 = AIO:CreateFrame("Button", "FullLoot_Button25", FullLootFrame, nil)

local FullLoot_Text1 = FullLoot_Button1:CreateFontString("FullLoot_Text1")
local FullLoot_Text2 = FullLoot_Button2:CreateFontString("FullLoot_Text2")
local FullLoot_Text3 = FullLoot_Button3:CreateFontString("FullLoot_Text3")
local FullLoot_Text4 = FullLoot_Button4:CreateFontString("FullLoot_Text4")
local FullLoot_Text5 = FullLoot_Button5:CreateFontString("FullLoot_Text5")
local FullLoot_Text6 = FullLoot_Button6:CreateFontString("FullLoot_Text6")
local FullLoot_Text7 = FullLoot_Button7:CreateFontString("FullLoot_Text7")
local FullLoot_Text8 = FullLoot_Button8:CreateFontString("FullLoot_Text8")
local FullLoot_Text9 = FullLoot_Button9:CreateFontString("FullLoot_Text9")
local FullLoot_Text10 = FullLoot_Button10:CreateFontString("FullLoot_Text10")
local FullLoot_Text11 = FullLoot_Button11:CreateFontString("FullLoot_Text11")
local FullLoot_Text12 = FullLoot_Button12:CreateFontString("FullLoot_Text12")
local FullLoot_Text13 = FullLoot_Button13:CreateFontString("FullLoot_Text13")
local FullLoot_Text14 = FullLoot_Button14:CreateFontString("FullLoot_Text14")
local FullLoot_Text15 = FullLoot_Button15:CreateFontString("FullLoot_Text15")
local FullLoot_Text16 = FullLoot_Button16:CreateFontString("FullLoot_Text16")
local FullLoot_Text17 = FullLoot_Button17:CreateFontString("FullLoot_Text17")
local FullLoot_Text18 = FullLoot_Button18:CreateFontString("FullLoot_Text18")
local FullLoot_Text19 = FullLoot_Button19:CreateFontString("FullLoot_Text19")
local FullLoot_Text20 = FullLoot_Button20:CreateFontString("FullLoot_Text20")
local FullLoot_Text21 = FullLoot_Button21:CreateFontString("FullLoot_Text21")
local FullLoot_Text22 = FullLoot_Button22:CreateFontString("FullLoot_Text22")
local FullLoot_Text23 = FullLoot_Button23:CreateFontString("FullLoot_Text23")
local FullLoot_Text24 = FullLoot_Button24:CreateFontString("FullLoot_Text24")
local FullLoot_Text25 = FullLoot_Button25:CreateFontString("FullLoot_Text25")

local FullLoot_ButtonTable = {FullLoot_Button1, FullLoot_Button2, FullLoot_Button3, FullLoot_Button4, FullLoot_Button5, 
FullLoot_Button6, FullLoot_Button7, FullLoot_Button8, FullLoot_Button9, FullLoot_Button10, FullLoot_Button11, FullLoot_Button12, 
FullLoot_Button13, FullLoot_Button14, FullLoot_Button15, FullLoot_Button16, FullLoot_Button17, FullLoot_Button18, FullLoot_Button19, 
FullLoot_Button20, FullLoot_Button21, FullLoot_Button22, FullLoot_Button23, FullLoot_Button24, FullLoot_Button25}

local FullLoot_TextTable = {FullLoot_Text1, FullLoot_Text2, FullLoot_Text3, FullLoot_Text4, FullLoot_Text5, 
FullLoot_Text6, FullLoot_Text7, FullLoot_Text8, FullLoot_Text9, FullLoot_Text10, FullLoot_Text11, FullLoot_Text12, 
FullLoot_Text13, FullLoot_Text14, FullLoot_Text15, FullLoot_Text16, FullLoot_Text17, FullLoot_Text18, FullLoot_Text19, 
FullLoot_Text20, FullLoot_Text21, FullLoot_Text22, FullLoot_Text23, FullLoot_Text24, FullLoot_Text25}

--Function that removes bag from world.
local function Remove_FullLootContainer(event, delay, call, object)
	local nearbyplayers = object:GetPlayersInRange(100)
	for k, v in pairs(nearbyplayers) do
		v:SendBroadcastMessage("|CFFFF8040The sack of items turns to dust, and blows away with the wind.|r")
	end
	object:Despawn(1)
	object:RemoveFromWorld(false)
	FullLootFrame:Hide()
    guid_linking_table[object:GetGUIDLow()] = nil
	item_table[object:GetGUIDLow()] = nil
end

local function EntropyPvP(event, pKiller, pKilled)
	if (playerdeath==true) then
		local killed_color = ClassColorCodes[pKilled:GetClass()]
		local killer_color = ClassColorCodes[pKiller:GetClass()]
		--Fetch PvP Stats
		local killerstats = CharDBQuery("SELECT honorable_kills,dishonorable_kills FROM shard_pvp_stats WHERE playerguid="..pKiller:GetGUIDLow().."")
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
		
		if ((pKiller:GetLevel()-pKilled:GetLevel())<=leveldiff) then
			local pKilledGUID = pKilled:GetGUIDLow()
			local pKillerGUID = pKiller:GetGUIDLow()
			local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
			local ContainerID = 818001
			local FullLootContainer = pKiller:SummonGameObject(ContainerID, x, y, z, 2.5, 0)			--Spawn a Sack of Belongings
			FullLootContainer:RegisterEvent(Remove_FullLootContainer, decaytime*1000, 0)				--Register the Remove/Despawn event to the Sack of Belongings
			guid_linking_table[FullLootContainer:GetGUIDLow()] = pKilled:GetGUIDLow()
			--Get Items
			local bagslot = 255
			local inven_ticker = 0
			local item_ticker = 0
			local maxitems = 25 --Equal to amount of buttons that I have declared.
			item_table[FullLootContainer:GetGUIDLow()] = {}
			repeat
				inven_ticker = inven_ticker+1
				local checkitem = pKilled:GetItemByPos(255, inven_ticker)
				if (checkitem~=nil) and (checkitem:IsBag()==false) and (checkitem:GetEntry()~=6948) then
					item_ticker = item_ticker+1
					table.insert (item_table[FullLootContainer:GetGUIDLow()], {checkitem:GetItemLink(), checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()), pKilled:GetName()})
					table.insert (remove_table[FullLootContainer:GetGUIDLow()], {item_ticker, false})
					--pKilled:RemoveItem(checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()))
				end
			until (inven_ticker>=38) or (item_ticker>=maxitems)
			--Kill Announcer
			local DeathAnnouncements = {
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", got rekt by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", got knocked in da gabba by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", had their behind superfluously carved by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", had their lease on life terminated by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", died of an iron overdose, courtesy of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..".",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", wanted a piece of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..", but bit off a little more than they could chew!"
			}
			if (EnableDeathAnnouncer==true) then
				local DeathAnnounce_Roll = math.random(1,6)
				SendWorldMessage(DeathAnnounce_Roll)
			end
			CharDBExecute("UPDATE shard_pvp_stats SET honorable_kills="..(killerstats:GetUInt32(0)+1).." WHERE playerguid = "..pKiller:GetGUIDLow().."")
		else
			CharDBExecute("UPDATE shard_pvp_stats SET dishonorable_kills="..(killerstats:GetUInt32(1)+1).." WHERE playerguid = "..pKiller:GetGUIDLow().."")
			SendWorldMessage("[PvP]: |cffff0000Everyone give a big round of applause to|r |CFF"..killer_color..""..pKiller:GetName().."|r |cffff0000"..killerguild_name..", whom is level "..pKiller:GetLevel()..", killed|r |CFF"..killed_color..""..pKilled:GetName().."|r|cffff0000, a level "..pKilled:GetLevel()..".|r")
		end
	end
end

local function CreatureDeath (event, pKiller, pKilled)
	if (creaturedeath==true) then
	local pKilledGUID = pKilled:GetGUIDLow()
	local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
	local ContainerID = 818001
	local kill_message = math.random(1,6)
	local FullLootContainer = pKiller:SummonGameObject(ContainerID, x, y, z, 2.5, 0)			--Spawn a Sack of Belongings
	FullLootContainer:RegisterEvent(Remove_FullLootContainer, decaytime*1000, 0)				--Register the Remove/Despawn event to the Sack of Belongings
	guid_linking_table[FullLootContainer:GetGUIDLow()] = pKilled:GetGUIDLow()
	--Get Items
	local bagslot = 255
	local inven_ticker = 0
	local item_ticker = 0
	local maxitems = 25 --Equal to amount of buttons that I have declared.
	item_table[FullLootContainer:GetGUIDLow()] = {}
	repeat
		inven_ticker = inven_ticker+1
		local checkitem = pKilled:GetItemByPos(255, inven_ticker)
		if (checkitem~=nil) and (checkitem:IsBag()==false) and (checkitem:GetEntry()~=6948) then
			item_ticker = item_ticker+1
			table.insert (item_table[FullLootContainer:GetGUIDLow()], {checkitem:GetItemLink(), checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()), pKilled:GetName()})
			--pKilled:RemoveItem(checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()))
		end
	until (inven_ticker>=38) or (item_ticker>=maxitems)
	end
end

local function AddItem(player)
player:SendBroadcastMessage("Function triggered")
end

local function Init_FullLootFrame(event, player, object)
	FullLootFrame:Clear()
	local item_ticker1 = 0
	for k, v in pairs(item_table[object:GetGUIDLow()]) do
		item_ticker1 = item_ticker1+1
		if (remove_table[object:GetGUIDLow()[item_ticker1]]==false) then
			local FullLoot_Button = FullLoot_ButtonTable[item_ticker1]
			local FullLoot_Text = FullLoot_TextTable[item_ticker1]
			if (FullLoot_Button~=nil) then
				FullLoot_Button:SetSize(200, 13)
				FullLoot_Button:SetPoint("TOPLEFT", 25, (-10-(item_ticker1*15)))
				FullLoot_Button:SetEnabledMouse(true)
				FullLoot_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
				FullLoot_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")        
				local FullLoot_Button_Tooltip_OnEnter = 'GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT") GameTooltip:SetHyperlink("item:'..v[2]..':0:0:0:0:0:0:0") GameTooltip:Show()'
				FullLoot_Button:SetScript("OnEnter", AIO:ToFunction(FullLoot_Button_Tooltip_OnEnter))
				local FullLoot_Button_Tooltip_OnLeave = [[
					GameTooltip:Hide()
				]]
				FullLoot_Button:SetScript("OnLeave", AIO:ToFunction(FullLoot_Button_Tooltip_OnLeave))
				FullLoot_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
				FullLoot_Text:SetSize(200, 5)
				FullLoot_Text:SetPoint("CENTER", 0, 0)
				FullLoot_Text:SetText(""..v[1].." x"..v[3])
				FullLoot_Text:SetJustifyH("LEFT")
				local function AddItem(player)
					FullLootFrame:Clear()
					FullLoot_Button:Hide()
					FullLoot_Text:SetText("|cff9d9d9dLooted Item|r")
					player:SendBroadcastMessage("You got a "..v[1])
					player:AddItem(v[2], v[3])
					remove_table[object:GetGUIDLow()[item_ticker1]] = true
					FullLootFrame:Send(player)
				end
				FullLoot_Button:SetScript("OnMouseUp", AddItem, AIO:ObjDo(""))
				FullLoot_Button:Show()
				FullLoot_Text:Show()
			else
				player:SendBroadcastMessage("Ran out of available button slots.")
			end
		else
			player:SendBroadcastMessage("Detected an item that has already been looted.")
		end
	end
	if (item_ticker1<25) then
		repeat
			item_ticker1 = item_ticker1+1
			local FullLoot_Button = FullLoot_ButtonTable[item_ticker1]
			local FullLoot_Text = FullLoot_TextTable[item_ticker1]
			FullLoot_Button:Hide()
			FullLoot_Text:Hide()
		until (item_ticker1>=25)
	end
	if (guid_linking_table[object:GetGUIDLow()]~=nil) then
		local owner = GetPlayerByGUID(guid_linking_table[object:GetGUIDLow()])
		FullLootFrame_TitleText:SetText("|cffFFC125"..owner:GetName().."'s Belongings|r")
	else
		FullLootFrame_TitleText:SetText("|cffFFC125Unclaimed Belongings|r")
	end
	FullLootFrame:Send(player)
	FullLootFrame:Show()
end

local function Container_Interact(event, player, object)
	Init_FullLootFrame(event, player, object)
	FullLootFrame:Send(player)
	FullLootFrame:Show()
	FullLootFrame:Clear()
	return false
end

AIO:AddInitMsg(FullLootFrame)
RegisterPlayerEvent(6, EntropyPvP)										--Triggered when player dies to player
RegisterPlayerEvent(8, CreatureDeath)								--Triggered when player dies to creature
RegisterGameObjectGossipEvent(818001, 1, Container_Interact)