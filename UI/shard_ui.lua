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
	
    local TrainingButton = AIO:CreateFrame("Button", "TrainingButton", Frame)
    TrainingButton:SetSize(32, 32)
    TrainingButton:SetPoint("CENTER", 0, 67)
    TrainingButton:SetEnabledMouse(true)
    TrainingButton:SetNormalTexture("Interface/ICONS/INV_Misc_Book_11")
    TrainingButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TrainingButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
    TrainingButton:SetScript("OnMouseUp", AIO:ToFunction("TrainingFrame:Show()"))
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
	
    local TestButton1 = AIO:CreateFrame("Button", "TestButton1", Frame)
    TestButton1:SetSize(32, 32)
    TestButton1:SetPoint("CENTER", 0, 33)
    TestButton1:SetEnabledMouse(true)
    TestButton1:SetNormalTexture("Interface/ICONS/Ability_Warrior_StrengthOfArms")
    TestButton1:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    TestButton1:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
 
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
	

    --[[local spell_list={
    --{"number of button", SetPoint, XOffset, YOffset, text}
        {"1", "CENTER", 0, 92.5, "Holy Bonds"},
        {"2", "CENTER", 0, 72.5, "Smite"}
    };
	
    for k, v in pairs(spell_list) do
        local Register_Spell_Button = AIO:CreateFrame("Button", v[1], TrainingFrame, nil)
        Register_Spell_Button:SetSize(137, 13)
        Register_Spell_Button:SetPoint(v[2], v[3], v[4])
        Register_Spell_Button:SetEnabledMouse(true)
        Register_Spell_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Register_Spell_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        
        local Register_Spell_Text = Register_Spell_Button:CreateFontString(v[1])
        Register_Spell_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Register_Spell_Text:SetSize(137, 5)
        Register_Spell_Text:SetPoint("CENTER", 0, 0)
        Register_Spell_Text:SetText(v[5])
    end]]
	
    local TestSpellButton = AIO:CreateFrame("Button", "TestSpellButton", TrainingFrame, nil)
    TestSpellButton:SetSize(137, 13)
    TestSpellButton:SetPoint("CENTER", 0, 92.5)
    TestSpellButton:SetEnabledMouse(true)
    TestSpellButton:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
    TestSpellButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
	
    local TestSpellText = TestSpellButton:CreateFontString("TestSpellText")
    TestSpellText:SetFont("Fonts\\FRIZQT__.TTF", 11)
    TestSpellText:SetSize(137, 5)
    TestSpellText:SetPoint("CENTER", 0, 0)
    TestSpellText:SetText("Holy Bonds")
	
    local FrameUI = AIO:CreateMsg()
    FrameUI:Append(Frame)

    player:SendBroadcastMessage("[DEBUG]: SideBar activated.")
	
    local TrainingFrameUI = AIO:CreateMsg()
    TrainingFrameUI:Append(TrainingFrame)


function SidePanel(event, player)
    -- Send Frame
    Frame:Send(player)
    Frame:Clear()

    -- Send Frame Children
    TrainingFrame:Send(player)
    TrainingFrame:Clear()
end
RegisterPlayerEvent(3, SidePanel)
RegisterPlayerEvent(18, SidePanel)