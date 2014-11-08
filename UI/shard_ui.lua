--Sidebar
require("AIO")

--[[STATIC SIDEBAR]]--
    local Frame = AIO:CreateFrame("Frame", "FrameTest", "UIParent", nil)
    Frame:SetSize(42, 179)
    Frame:SetMovable(false)
    Frame:SetEnabledMouse(true)
    Frame:RegisterForDrag("LeftButton")
    Frame:SetPoint("RIGHT")
    Frame:SetClampedToScreen(true)
    Frame:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 10,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })	

--[[TRAINING FRAME]]--
    local TrainingFrame = AIO:CreateFrame("Frame", "TrainingFrame", "UIParent", nil)
    TrainingFrame:SetSize(500, 300)
    TrainingFrame:SetMovable(true)
    TrainingFrame:SetEnabledMouse(true)
    TrainingFrame:RegisterForDrag("LeftButton")
    TrainingFrame:SetPoint("CENTER")
    TrainingFrame:SetClampedToScreen(true)
    TrainingFrame:SetBackdrop({
        bgFile = "Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
        edgeSize = 20,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    TrainingFrame:Hide()
	
	local StatFrame = AIO:CreateFrame("Frame", "StatFrame", "UIParent", nil)
    StatFrame:SetSize(200, 300)
    StatFrame:SetMovable(true)
    StatFrame:SetEnabledMouse(true)
    StatFrame:RegisterForDrag("LeftButton")
    StatFrame:SetPoint("CENTER")
    StatFrame:SetClampedToScreen(true)
    StatFrame:SetBackdrop({
        bgFile = "Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
        edgeSize = 20,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    StatFrame:Hide()

    local TrainingButton = AIO:CreateFrame("Button", "TrainingButton", Frame)
    TrainingButton:SetSize(32, 32)
    TrainingButton:SetPoint("CENTER", 0, 67)
    TrainingButton:SetEnabledMouse(true)
    TrainingButton:SetNormalTexture("Interface/ICONS/INV_Misc_Book_11")
    TrainingButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TrainingButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
    TrainingButton:SetScript("OnMouseUp", AIO:ToFunction("TrainingFrame:Show() StatFrame:Hide()"))
    local TrainingsButton_Tooltip_OnEnter = [[
        GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT")
        GameTooltip:SetText("|cffFFFFFFCharacter Advancement|r\nLearn new skills, or allocate skill points\nto improve existing ones.")
        GameTooltip:Show()
    ]]
    TrainingButton:SetScript("OnEnter", AIO:ToFunction(TrainingsButton_Tooltip_OnEnter))
    local TrainingsButton_Tooltip_OnLeave = [[
        GameTooltip:Hide()
    ]]
    TrainingButton:SetScript("OnLeave", AIO:ToFunction(TrainingsButton_Tooltip_OnLeave))

    local StatAllocationButton = AIO:CreateFrame("Button", "StatAllocationButton", Frame)
    StatAllocationButton:SetSize(32, 32)
    StatAllocationButton:SetPoint("CENTER", 0, 33)
    StatAllocationButton:SetEnabledMouse(true)
    StatAllocationButton:SetNormalTexture("Interface/ICONS/Ability_Warrior_StrengthOfArms")
    StatAllocationButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    StatAllocationButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
    StatAllocationButton:SetScript("OnMouseUp", AIO:ToFunction("StatFrame:Show() TrainingFrame:Hide()"))
	local StatAllocationButton_Tooltip_OnEnter = [[
        GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT")
        GameTooltip:SetText("|cffFFFFFFStat Allocation|r\nManage allocation of your attribute\npoints.")
        GameTooltip:Show()
    ]]
    StatAllocationButton:SetScript("OnEnter", AIO:ToFunction(StatAllocationButton_Tooltip_OnEnter))
    local StatAllocationButton_Tooltip_OnLeave = [[
        GameTooltip:Hide()
    ]]
    StatAllocationButton:SetScript("OnLeave", AIO:ToFunction(StatAllocationButton_Tooltip_OnLeave))


    local TestButton2 = AIO:CreateFrame("Button", "TestButton2", Frame)
    TestButton2:SetSize(32, 32)
    TestButton2:SetPoint("CENTER", 0, -1)
    TestButton2:SetEnabledMouse(true)
    TestButton2:SetNormalTexture("Interface/ICONS/Spell_Arcane_Rune")
    TestButton2:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton2:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

    local TestButton3 = AIO:CreateFrame("Button", "TestButton3", Frame)
    TestButton3:SetSize(32, 32)
    TestButton3:SetPoint("CENTER", 0, -35)
    TestButton3:SetEnabledMouse(true)
    TestButton3:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_Outland_Dungeon_Hero")
    TestButton3:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton3:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

    local TestButton4 = AIO:CreateFrame("Button", "TestButton4", Frame)
    TestButton4:SetSize(32, 32)
    TestButton4:SetPoint("CENTER", 0, -69)
    TestButton4:SetEnabledMouse(true)
    TestButton4:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_PlagueWing")
    TestButton4:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton4:SetPushedTexture("Interface/Buttons/CheckButtonHilight")

--[[TRAINING FRAME UI]]--

    local TrainingFrame_CloseButton = AIO:CreateFrame("Button", "TrainingFrame_CloseButton", TrainingFrame, "UIPanelCloseButton")
    TrainingFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
    TrainingFrame_CloseButton:SetEnabledMouse(true)
    TrainingFrame_CloseButton:SetSize(27, 27)

    local TrainingFrame_TitleBar = AIO:CreateFrame("Frame", "TrainingFrame_TitleBar", TrainingFrame, nil)
    TrainingFrame_TitleBar:SetSize(100, 25)
    TrainingFrame_TitleBar:SetBackdrop({
        bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 16,
        tileSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    TrainingFrame_TitleBar:SetPoint("TOP", 0, 9)

    local TrainingFrame_TitleText = TrainingFrame_TitleBar:CreateFontString("TrainingFrame_TitleText")
    TrainingFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
    TrainingFrame_TitleText:SetSize(190, 5)
    TrainingFrame_TitleText:SetPoint("CENTER", 0, 0)
    TrainingFrame_TitleText:SetText("|cffFFC125Training|r")

    local TrainingFrame_CategoryPanel = AIO:CreateFrame("Frame", "TrainingFrame_CategoryPanel", TrainingFrame, nil)
    TrainingFrame_CategoryPanel:SetSize(150, 250)
    TrainingFrame_CategoryPanel:SetPoint("LEFT", 10, -15)
    TrainingFrame_CategoryPanel:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 16,
        tileSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })

    local TrainingFrame_CategoryText = TrainingFrame_CategoryPanel:CreateFontString("TrainingFrame_CategoryText")
    TrainingFrame_CategoryText:SetFont("Fonts\\FRIZQT__.TTF", 11)
    TrainingFrame_CategoryText:SetSize(190, 5)
    TrainingFrame_CategoryText:SetPoint("TOP", 0, 13)
    TrainingFrame_CategoryText:SetText("Category")

    local TrainingFrame_SpellPanel = AIO:CreateFrame("Frame", "TrainingFrame_SpellPanel", TrainingFrame, nil)
    TrainingFrame_SpellPanel:SetSize(150, 250)
    TrainingFrame_SpellPanel:SetPoint("CENTER", 0, -15)
    TrainingFrame_SpellPanel:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 16,
        tileSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })

    local TrainingFrame_SpellText = TrainingFrame_SpellPanel:CreateFontString("TrainingFrame_SpellText")
    TrainingFrame_SpellText:SetFont("Fonts\\FRIZQT__.TTF", 11)
    TrainingFrame_SpellText:SetSize(190, 5)
    TrainingFrame_SpellText:SetPoint("TOP", 0, 13)
    TrainingFrame_SpellText:SetText("Ability")

    local TrainingFrame_DescriptionText = TrainingFrame_SpellPanel:CreateFontString("TrainingFrame_DescriptionText")
    TrainingFrame_DescriptionText:SetFont("Fonts\\FRIZQT__.TTF", 11)
    TrainingFrame_DescriptionText:SetSize(190, 5)
    TrainingFrame_DescriptionText:SetPoint("TOP", 160, 13)
    TrainingFrame_DescriptionText:SetText("Ability Description")

    local TrainingFrame_IconPanel = AIO:CreateFrame("Frame", "TrainingFrame_IconPanel", TrainingFrame, nil)
    TrainingFrame_IconPanel:SetSize(40, 40)
    TrainingFrame_IconPanel:SetPoint("RIGHT", -10, 90)
    TrainingFrame_IconPanel:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        edgeSize = 16,
        tileSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
	--[[DEFINE SPELL TRAINING FRAMES]]--
		local HolyBonds_Icon = AIO:CreateFrame("Button", "HolyBonds_Icon", TrainingFrame, nil)
		HolyBonds_Icon:SetSize(32, 32)
		HolyBonds_Icon:SetPoint("RIGHT", -14, 90)
		HolyBonds_Icon:SetToplevel(true)
		HolyBonds_Icon:SetClampedToScreen(true)
		HolyBonds_Icon:SetBackdrop({
			bgFile = "Interface/ICONS/Spell_Nature_Slow.png"
		})
		HolyBonds_Icon:Hide()
	
	--[[DEFINE SPELL SELECTION BUTTONS]]--
		--Holy Bonds
        local HolyBonds_Button = AIO:CreateFrame("Button", "HolyBonds_Button", TrainingFrame, nil)
        HolyBonds_Button:SetSize(137, 13)
        HolyBonds_Button:SetPoint("TOP", 0, -50)
        HolyBonds_Button:SetEnabledMouse(true)
        HolyBonds_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        HolyBonds_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		HolyBonds_Button:SetScript("OnMouseUp", AIO:ToFunction([[
		HolyBonds_Icon:Show()
		]]))
        local HolyBonds_Text = HolyBonds_Button:CreateFontString("HolyBonds_Text")
        HolyBonds_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        HolyBonds_Text:SetSize(137, 5)
        HolyBonds_Text:SetPoint("CENTER", 0, 0)
        HolyBonds_Text:SetText("Holy Bonds")
		HolyBonds_Text:Hide()
		HolyBonds_Button:Hide()
				
		--Smite
        local Smite_Button = AIO:CreateFrame("Button", "Smite_Button", TrainingFrame, nil)
        Smite_Button:SetSize(137, 13)
        Smite_Button:SetPoint("TOP", 0, -65)
        Smite_Button:SetEnabledMouse(true)
        Smite_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Smite_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Smite_Text = Smite_Button:CreateFontString("Smite_Text")
        Smite_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Smite_Text:SetSize(137, 5)
        Smite_Text:SetPoint("CENTER", 0, 0)
        Smite_Text:SetText("Smite")
		Smite_Text:Hide()
		Smite_Button:Hide()
		
		--Bloodbolt
        local Bloodbolt_Button = AIO:CreateFrame("Button", "Bloodbolt_Button", TrainingFrame, nil)
        Bloodbolt_Button:SetSize(137, 13)
        Bloodbolt_Button:SetPoint("TOP", 0, -50)
        Bloodbolt_Button:SetEnabledMouse(true)
        Bloodbolt_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Bloodbolt_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Bloodbolt_Text = Bloodbolt_Button:CreateFontString("Bloodbolt_Text")
        Bloodbolt_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Bloodbolt_Text:SetSize(137, 5)
        Bloodbolt_Text:SetPoint("CENTER", 0, 0)
        Bloodbolt_Text:SetText("Bloodbolt")
		Bloodbolt_Text:Hide()
		Bloodbolt_Button:Hide()
		
	--[[DEFINE CATEGORY SELECTION BUTTONS]]
		--Liturgy
        local Liturgy_Button = AIO:CreateFrame("Button", "Liturgy_Button", TrainingFrame, nil)
        Liturgy_Button:SetSize(137, 13)
        Liturgy_Button:SetPoint("LEFT", 16, 92.5)
        Liturgy_Button:SetEnabledMouse(true)
        Liturgy_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Liturgy_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		Liturgy_Button:SetScript("OnMouseUp", AIO:ToFunction([[
		HolyBonds_Text:Show() HolyBonds_Button:Show()
		Smite_Text:Show() Smite_Button:Show()
		]]))
        local Liturgy_Text = Liturgy_Button:CreateFontString("Liturgy_Text")
        Liturgy_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Liturgy_Text:SetSize(137, 5)
        Liturgy_Text:SetPoint("CENTER", 0, 0)
        Liturgy_Text:SetText("Liturgy")
		
		--Bloodcraft
        local Bloodcraft_Button = AIO:CreateFrame("Button", "Bloodcraft_Button", TrainingFrame, nil)
        Bloodcraft_Button:SetSize(137, 13)
        Bloodcraft_Button:SetPoint("LEFT", 16, 77.5)
        Bloodcraft_Button:SetEnabledMouse(true)
        Bloodcraft_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Bloodcraft_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		Bloodcraft_Button:SetScript("OnMouseUp", AIO:ToFunction([[
		Bloodbolt_Button:Show() Bloodbolt_Text:Show()
		]]))
        local Bloodcraft_Text = Bloodcraft_Button:CreateFontString("Bloodcraft_Text")
        Bloodcraft_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Bloodcraft_Text:SetSize(137, 5)
        Bloodcraft_Text:SetPoint("CENTER", 0, 0)
        Bloodcraft_Text:SetText("Bloodcraft")

--[[STAT ALLOCATION UI]]--
    local StatFrame_CloseButton = AIO:CreateFrame("Button", "StatFrame_CloseButton", StatFrame, "UIPanelCloseButton")
    StatFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
    StatFrame_CloseButton:SetEnabledMouse(true)
    StatFrame_CloseButton:SetSize(27, 27)

    local FrameUI = AIO:CreateMsg()
    FrameUI:Append(Frame)

    local TrainingFrameUI = AIO:CreateMsg()
    TrainingFrameUI:Append(TrainingFrame)
	
    local StatFrameUI = AIO:CreateMsg()
    TrainingFrameUI:Append(StatFrame)
	

function SidePanel(event, player)
    player:SendBroadcastMessage("[DEBUG]: SideBar activated.")

    FrameUI:SendIgnoreIf(Frame, player)
    TrainingFrameUI:SendIgnoreIf(TrainingFrame, player)

    -- Send Frame
    Frame:Send(player)
    Frame:Clear()
    Frame:Show()

    -- Send Frame Children
    TrainingFrame:Send(player)
    TrainingFrame:Clear()

    return false
end

RegisterPlayerEvent(3, SidePanel)
RegisterPlayerEvent(18, SidePanel)