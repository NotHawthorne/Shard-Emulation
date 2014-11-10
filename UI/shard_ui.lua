-- Example by NotHawthorne and Kaev for ShardOfEntropy project
-- Slightly modified for example purposes and overlapping with other examples
-- Notice that the objects are not named
     
local AIO = require("AIO")
     
     
     
--Sidebar
require("AIO")
     
--Global vars
pointgain = 6    --Stat points gained per level
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
            bgFile = "Interface/FrameGeneral/UI-Background-Rock",        --Doesnt exist in mpqs by default. Custom patch.
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
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
     
     
        local InvocationButton = AIO:CreateFrame("Button", "InvocationButton", Frame)
        InvocationButton:SetSize(32, 32)
        InvocationButton:SetPoint("CENTER", 0, -1)
        InvocationButton:SetEnabledMouse(true)
        InvocationButton:SetNormalTexture("Interface/ICONS/Spell_Arcane_Rune")
        InvocationButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
        InvocationButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local InvocationButton_Tooltip_OnEnter = [[
            GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT")
            GameTooltip:SetText("|cffFFFFFFInvocation|r\n'Soon'\n      -Blizzard Entertainment")
            GameTooltip:Show()
        ]]
        InvocationButton:SetScript("OnEnter", AIO:ToFunction(InvocationButton_Tooltip_OnEnter))
        local InvocationButton_Tooltip_OnLeave = [[
            GameTooltip:Hide()
        ]]
        InvocationButton:SetScript("OnLeave", AIO:ToFunction(InvocationButton_Tooltip_OnLeave))
     
        local PvPButton = AIO:CreateFrame("Button", "PvPButton", Frame)
        PvPButton:SetSize(32, 32)
        PvPButton:SetPoint("CENTER", 0, -35)
        PvPButton:SetEnabledMouse(true)
        PvPButton:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_Outland_Dungeon_Hero")
        PvPButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
        PvPButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local PvPButton_Tooltip_OnEnter = [[
            GameTooltip:SetOwner(select(1, ...), "ANCHOR_RIGHT")
            GameTooltip:SetText("|cffFFFFFFPvP Statistics|r\n'Soon'\n      -Blizzard Entertainment")
            GameTooltip:Show()
        ]]
        PvPButton:SetScript("OnEnter", AIO:ToFunction(PvPButton_Tooltip_OnEnter))
        local PvPButton_Tooltip_OnLeave = [[
            GameTooltip:Hide()
        ]]
        PvPButton:SetScript("OnLeave", AIO:ToFunction(PvPButton_Tooltip_OnLeave))
     
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
        TrainingFrame_CategoryText:SetPoint("TOP", -5, 13)
        TrainingFrame_CategoryText:SetText("Focus")
     
        local TrainingFrame_SpellPanel = AIO:CreateFrame("Frame", "TrainingFrame_SpellPanel", TrainingFrame, nil)
        TrainingFrame_SpellPanel:SetSize(150, 250)
        TrainingFrame_SpellPanel:SetPoint("CENTER", -5, -15)
        TrainingFrame_SpellPanel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
       
        local TrainingFrame_SpellNamePanel = AIO:CreateFrame("Frame", "TrainingFrame_SpellNamePanel", TrainingFrame, nil)
        TrainingFrame_SpellNamePanel:SetSize(120, 36)
        TrainingFrame_SpellNamePanel:SetPoint("RIGHT", -50, 90)
        TrainingFrame_SpellNamePanel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
       
        local TrainingFrame_AdvancePanel = AIO:CreateFrame("Frame", "TrainingFrame_AdvancePanel", TrainingFrame, nil)
        TrainingFrame_AdvancePanel:SetSize(70, 36)
        TrainingFrame_AdvancePanel:SetPoint("BOTTOMRIGHT", -100, 10)
        TrainingFrame_AdvancePanel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
       
        local TrainingFrame_RevertPanel = AIO:CreateFrame("Frame", "TrainingFrame_RevertPanel", TrainingFrame, nil)
        TrainingFrame_RevertPanel:SetSize(70, 36)
        TrainingFrame_RevertPanel:SetPoint("BOTTOMRIGHT", -10, 10)
        TrainingFrame_RevertPanel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
       
        local TrainingFrame_PlayerInfoPanel = AIO:CreateFrame("Frame", "TrainingFrame_PlayerInfoPanel", TrainingFrame, nil)
        TrainingFrame_PlayerInfoPanel:SetSize(160, 36)
        TrainingFrame_PlayerInfoPanel:SetPoint("BOTTOMRIGHT", -10, 50)
        TrainingFrame_PlayerInfoPanel:SetBackdrop({
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
        TrainingFrame_SpellText:SetText("Focus Abilities")
     
        local TrainingFrame_DescriptionText = TrainingFrame_SpellPanel:CreateFontString("TrainingFrame_DescriptionText")
        TrainingFrame_DescriptionText:SetFont("Fonts\\FRIZQT__.TTF", 11)
        TrainingFrame_DescriptionText:SetSize(190, 5)
        TrainingFrame_DescriptionText:SetPoint("TOP", 160, 13)
        TrainingFrame_DescriptionText:SetText("Description")
     
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
        local TrainText = TrainingFrame_AdvancePanel:CreateFontString("TrainText")
        TrainText:SetFont("Fonts\\FRIZQT__.TTF", 11)
        TrainText:SetSize(70, 36)
        TrainText:SetPoint("CENTER", 0, 0)
        TrainText:SetText("Increase\nSkill|r")
        TrainText:Hide()
        local UnTrainText = TrainingFrame_RevertPanel:CreateFontString("UnTrainText")
        UnTrainText:SetFont("Fonts\\FRIZQT__.TTF", 11)
        UnTrainText:SetSize(70, 36)
        UnTrainText:SetPoint("CENTER", 0, 0)
        UnTrainText:SetText("Decrease\nSkill|r")
        UnTrainText:Hide()
        local Current_Info1 = TrainingFrame_PlayerInfoPanel:CreateFontString("Current_Info1")
        Current_Info1:SetSize(100, 24)
        Current_Info1:SetPoint("TOPLEFT", 0, 0)
        Current_Info1:SetFont("Fonts\\FRIZQT__.TTF", 9)
        Current_Info1:SetText("Current Skill Level: ")
        local Current_Info2 = TrainingFrame_PlayerInfoPanel:CreateFontString("Current_Info2")
        Current_Info2:SetSize(110, 24)
        Current_Info2:SetPoint("BOTTOMLEFT", 0, 0)
        Current_Info2:SetFont("Fonts\\FRIZQT__.TTF", 9)
        Current_Info2:SetText("Available Skill Points: ")
        Current_Info1:Hide()
        Current_Info2:Hide()
		
        --[[DEFINE SPELL TRAINING FRAMES]]--
        local HolyBonds_Icon = AIO:CreateFrame("Button", "HolyBonds_Icon", TrainingFrame, nil)
        HolyBonds_Icon:SetSize(32, 32)
        HolyBonds_Icon:SetPoint("RIGHT", -14, 90)
        HolyBonds_Icon:SetToplevel(true)
        HolyBonds_Icon:SetClampedToScreen(true)
        HolyBonds_Icon:SetBackdrop({
            bgFile = "Interface/ICONS/Spell_Nature_Slow.png"
        })
        HolyBonds_Desc = HolyBonds_Icon:CreateFontString("HolyBonds_Desc")
        HolyBonds_Desc:SetFont("Fonts\\FRIZQT__.TTF", 11)
        HolyBonds_Desc:SetSize(150, 150)
        HolyBonds_Desc:SetPoint("LEFT", -119, -50)
        HolyBonds_Desc:SetText("|cffFFC125You shackle your target, rendering them unable to act until damaged. Lasts longer and cools down faster based on rank.|r")
           
        HolyBonds_Info = HolyBonds_Icon:CreateFontString("HolyBonds_Info")
        HolyBonds_Info:SetFont("Fonts\\FRIZQT__.TTF", 9)
        HolyBonds_Info:SetSize(150, 150)
        HolyBonds_Info:SetPoint("CENTER", -80, 6)
        HolyBonds_Info:SetText("Requires Liturgy: 25")
           
        HolyBonds_Info2 = HolyBonds_Icon:CreateFontString("HolyBonds_Info2")
        HolyBonds_Info2:SetFont("Fonts\\FRIZQT__.TTF", 9)
        HolyBonds_Info2:SetSize(150, 150)
        HolyBonds_Info2:SetPoint("CENTER", -80, -6)
        HolyBonds_Info2:SetText("Requires Level: 5")
       
        --[[DEFINE SPELL SELECTION BUTTONS]]--
        --Liturgy
        local Liturgy_Icon = AIO:CreateFrame("Button", "Liturgy_Icon", TrainingFrame, nil)
        Liturgy_Icon:SetSize(32, 32)
        Liturgy_Icon:SetPoint("RIGHT", -14, 90)
        Liturgy_Icon:SetToplevel(true)
        Liturgy_Icon:SetClampedToScreen(true)
        Liturgy_Icon:SetBackdrop({
            bgFile = "Interface/ICONS/Spell_Holy_BlessedResillience"
        })
        local Liturgy_Info = Liturgy_Icon:CreateFontString("Liturgy_Info")
        Liturgy_Info:SetFont("Fonts\\FRIZQT__.TTF", 9)
        Liturgy_Info:SetSize(150, 150)
        Liturgy_Info:SetPoint("CENTER", -80, 6)
        Liturgy_Info:SetText("Requires Liturgist")
        local Liturgy_Desc = Liturgy_Icon:CreateFontString("Liturgy_Desc")
        Liturgy_Desc:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Liturgy_Desc:SetSize(150, 150)
        Liturgy_Desc:SetPoint("LEFT", -119, -50)
        Liturgy_Desc:SetText("|cffFFC125A powerful school of light magic, which provides a toolkit to invoke holy vengeance upon your foes for their indiscretions.|r")
        local Liturgy_Info2 = Liturgy_Icon:CreateFontString("Liturgy_Info2")
        Liturgy_Info2:SetFont("Fonts\\FRIZQT__.TTF", 9)
        Liturgy_Info2:SetSize(150, 150)
        Liturgy_Info2:SetPoint("CENTER", -80, -6)
        Liturgy_Info2:SetText("Requires Mage, Healer")
           
        Liturgy_Icon:Hide()
        Liturgy_Info:Hide()
        Liturgy_Desc:Hide()
        Liturgy_Info2:Hide()
           
        --Holy Bonds
        local HolyBonds_Button = AIO:CreateFrame("Button", "HolyBonds_Button", TrainingFrame, nil)
        HolyBonds_Button:SetSize(137, 13)
        HolyBonds_Button:SetPoint("TOP", -5, -50)
        HolyBonds_Button:SetEnabledMouse(true)
        HolyBonds_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        HolyBonds_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        HolyBonds_Button:SetScript("OnMouseUp", AIO:ToFunction([[
            HolyBonds_Icon:Show()
            HolyBonds_Desc:Show()
            HolyBonds_Info:Show()
            HolyBonds_Info2:Show()
            Liturgy_Icon:Hide() Liturgy_Desc:Hide() Liturgy_Info:Hide() Liturgy_Info2:Hide() Liturgy_TrainButton:Hide()  
        ]]))
        local HolyBonds_Text = HolyBonds_Button:CreateFontString("HolyBonds_Text")
        HolyBonds_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        HolyBonds_Text:SetSize(137, 5)
        HolyBonds_Text:SetPoint("CENTER", -5, 0)
        HolyBonds_Text:SetText("Holy Bonds")
          
        HolyBonds_Icon:Hide()
        HolyBonds_Desc:Hide()
        HolyBonds_Text:Hide()
        HolyBonds_Button:Hide()
                   
        --Smite
        local Smite_Button = AIO:CreateFrame("Button", "Smite_Button", TrainingFrame, nil)
        Smite_Button:SetSize(137, 13)
        Smite_Button:SetPoint("TOP", -5, -65)
        Smite_Button:SetEnabledMouse(true)
        Smite_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Smite_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Smite_Text = Smite_Button:CreateFontString("Smite_Text")
        Smite_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Smite_Text:SetSize(137, 5)
        Smite_Text:SetPoint("CENTER", -5, 0)
        Smite_Text:SetText("Smite")
        Smite_Text:Hide()
        Smite_Button:Hide()
           
        --Bloodbolt
        local Bloodbolt_Button = AIO:CreateFrame("Button", "Bloodbolt_Button", TrainingFrame, nil)
        Bloodbolt_Button:SetSize(137, 13)
        Bloodbolt_Button:SetPoint("TOP", -5, -50)
        Bloodbolt_Button:SetEnabledMouse(true)
        Bloodbolt_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Bloodbolt_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Bloodbolt_Text = Bloodbolt_Button:CreateFontString("Bloodbolt_Text")
        Bloodbolt_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Bloodbolt_Text:SetSize(137, 5)
        Bloodbolt_Text:SetPoint("CENTER", -5, 0)
        Bloodbolt_Text:SetText("Bloodbolt")
        Bloodbolt_Text:Hide()
        Bloodbolt_Button:Hide()
           
    --[[DEFINE CATEGORY SELECTION BUTTONS]]--
        --Liturgy
        local Liturgy_Button = AIO:CreateFrame("Button", "Liturgy_Button", TrainingFrame, nil)
        Liturgy_Button:SetSize(137, 13)
        Liturgy_Button:SetPoint("LEFT", 16, 92.5)
        Liturgy_Button:SetEnabledMouse(true)
        Liturgy_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Liturgy_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Liturgy_Text = Liturgy_Button:CreateFontString("Liturgy_Text")
        Liturgy_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Liturgy_Text:SetSize(137, 5)
        Liturgy_Text:SetPoint("CENTER", 0, 0)
        Liturgy_Text:SetText("Liturgy")
        local Liturgy_TrainButton = AIO:CreateFrame("Button", "Liturgy_TrainButton", TrainingFrame, nil)
        Liturgy_TrainButton:SetSize(65, 30)
        Liturgy_TrainButton:SetPoint("BOTTOMRIGHT", -102.5, 13.5)
        Liturgy_TrainButton:SetEnabledMouse(true)
        Liturgy_TrainButton:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Liturgy_TrainButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        Liturgy_TrainButton:Hide()
           
        --Bloodcraft
        local Bloodcraft_Button = AIO:CreateFrame("Button", "Bloodcraft_Button", TrainingFrame, nil)
        Bloodcraft_Button:SetSize(137, 13)
        Bloodcraft_Button:SetPoint("LEFT", 16, 77.5)
        Bloodcraft_Button:SetEnabledMouse(true)
        Bloodcraft_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Bloodcraft_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Bloodcraft_Text = Bloodcraft_Button:CreateFontString("Bloodcraft_Text")
        Bloodcraft_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Bloodcraft_Text:SetSize(137, 5)
        Bloodcraft_Text:SetPoint("CENTER", 0, 0)
        Bloodcraft_Text:SetText("Bloodcraft")
           
        --Beastmastery
        local Beastmastery_Button = AIO:CreateFrame("Button", "Beastmastery_Button", TrainingFrame, nil)
        Beastmastery_Button:SetSize(137, 13)
        Beastmastery_Button:SetPoint("LEFT", 16, 62.5)
        Beastmastery_Button:SetEnabledMouse(true)
        Beastmastery_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Beastmastery_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Beastmastery_Text = Beastmastery_Button:CreateFontString("Beastmastery_Text")
        Beastmastery_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Beastmastery_Text:SetSize(137, 5)
        Beastmastery_Text:SetPoint("CENTER", 0, 0)
        Beastmastery_Text:SetText("Beastmastery")
           
        --Weapon Mastery
        local WeaponMastery_Button = AIO:CreateFrame("Button", "WeaponMastery_Button", TrainingFrame, nil)
        WeaponMastery_Button:SetSize(137, 13)
        WeaponMastery_Button:SetPoint("LEFT", 16, 47.5)
        WeaponMastery_Button:SetEnabledMouse(true)
        WeaponMastery_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        WeaponMastery_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local WeaponMastery_Text = WeaponMastery_Button:CreateFontString("WeaponMastery_Text")
        WeaponMastery_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        WeaponMastery_Text:SetSize(137, 5)
        WeaponMastery_Text:SetPoint("CENTER", 0, 0)
        WeaponMastery_Text:SetText("Weapon Mastery")
           
        --Shamanism
        local Shamanism_Button = AIO:CreateFrame("Button", "Shamanism_Button", TrainingFrame, nil)
        Shamanism_Button:SetSize(137, 13)
        Shamanism_Button:SetPoint("LEFT", 16, 32.5)
        Shamanism_Button:SetEnabledMouse(true)
        Shamanism_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
        Shamanism_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
        local Shamanism_Text = Shamanism_Button:CreateFontString("Shamanism_Text")
        Shamanism_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Shamanism_Text:SetSize(137, 5)
        Shamanism_Text:SetPoint("CENTER", 0, 0)
        Shamanism_Text:SetText("Shamanism")
           
        local HideAll = [[
            TrainText:Hide() UnTrainText:Hide() Current_Info1:Hide() Current_Info2:Hide()
            HolyBonds_Text:Hide() HolyBonds_Button:Hide() HolyBonds_Desc:Hide() HolyBonds_Icon:Hide() HolyBonds_Info:Hide() HolyBonds_Info2:Hide()
            Smite_Text:Hide() Smite_Button:Hide()
            Bloodbolt_Text:Hide() Bloodbolt_Button:Hide()
            Liturgy_Icon:Hide() Liturgy_Desc:Hide() Liturgy_Info:Hide() Liturgy_Info2:Hide() Liturgy_TrainButton:Hide()
        ]]
        local ShowLiturgy = [[
            TrainText:Show() UnTrainText:Show() Current_Info1:Show() Current_Info2:Show()
            HolyBonds_Text:Show() HolyBonds_Button:Show()
            Smite_Text:Show() Smite_Button:Show()
            Liturgy_Icon:Show() Liturgy_Desc:Show() Liturgy_Info:Show() Liturgy_Info2:Show() Liturgy_TrainButton:Show()
        ]]
        local ShowBloodcraft = [[
            Bloodbolt_Text:Show() Bloodbolt_Button:Show()
        ]]
           
        Liturgy_Button:SetScript("OnMouseUp", AIO:ToFunction(""..HideAll..""..ShowLiturgy..""))
        Bloodcraft_Button:SetScript("OnMouseUp", AIO:ToFunction(""..HideAll..""..ShowBloodcraft..""))
        Beastmastery_Button:SetScript("OnMouseUp", AIO:ToFunction(""..HideAll..""))
        WeaponMastery_Button:SetScript("OnMouseUp", AIO:ToFunction(""..HideAll..""))
        Shamanism_Button:SetScript("OnMouseUp", AIO:ToFunction(""..HideAll..""))
     
    --[[STAT ALLOCATION UI]]--
        local StatFrame_CloseButton = AIO:CreateFrame("Button", "StatFrame_CloseButton", StatFrame, "UIPanelCloseButton")
        StatFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
        StatFrame_CloseButton:SetEnabledMouse(true)
        StatFrame_CloseButton:SetSize(27, 27)
       
        local StatFrame_TitleBar = AIO:CreateFrame("Frame", "StatFrame_TitleBar", StatFrame, nil)
        StatFrame_TitleBar:SetSize(135, 25)
        StatFrame_TitleBar:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        StatFrame_TitleBar:SetPoint("TOP", 0, 9)
        local StatFrame_TitleText = StatFrame_TitleBar:CreateFontString("StatFrame_TitleText")
        StatFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
        StatFrame_TitleText:SetSize(190, 5)
        StatFrame_TitleText:SetPoint("CENTER", 0, 0)
        StatFrame_TitleText:SetText("|cffFFC125Stat Allocation|r")
       
        local StatFrame_Panel = AIO:CreateFrame("Frame", "StatFrame_Panel", StatFrame, nil)
        StatFrame_Panel:SetSize(179, 110)
        StatFrame_Panel:SetPoint("LEFT", 10, 69.5)
        StatFrame_Panel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		local StatFrame_PointsPanel = AIO:CreateFrame("Frame", "StatFrame_PointsPanel", StatFrame, nil)
        StatFrame_PointsPanel:SetSize(170, 25)
        StatFrame_PointsPanel:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		StatFrame_PointsPanel:SetPoint("LEFT", 14, 6)
       
        --Stat Names
        local StatNames = AIO:CreateFrame("Button", "StatNames", StatFrame, nil)
        StatNames:SetSize(60, 100)
        StatNames:SetPoint("TOPLEFT", 15, -37.5)
        local Strength_Text = StatNames:CreateFontString("Strength_Text")
        Strength_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Strength_Text:SetSize(137, 5)
        Strength_Text:SetPoint("TOP", 0, 0)
        Strength_Text:SetText("Strength")
        local Stamina_Text = StatNames:CreateFontString("Stamina_Text")
        Stamina_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stamina_Text:SetSize(137, 5)
        Stamina_Text:SetPoint("TOP", -1, -20)
        Stamina_Text:SetText("Stamina")
        local Agility_Text = StatNames:CreateFontString("Agility_Text")
        Agility_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Agility_Text:SetSize(137, 5)
        Agility_Text:SetPoint("TOP", -7, -40)
        Agility_Text:SetText("Agility")
        local Intellect_Text = StatNames:CreateFontString("Intellect_Text")
        Intellect_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Intellect_Text:SetSize(137, 5)
        Intellect_Text:SetPoint("TOP", -2.2, -60)
        Intellect_Text:SetText("Intellect")
        local Spirit_Text = StatNames:CreateFontString("Spirit_Text")
        Spirit_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Spirit_Text:SetSize(137, 5)
        Spirit_Text:SetPoint("TOP", -10.5, -80)
        Spirit_Text:SetText("Spirit")
        local Stat_Text = StatNames:CreateFontString("Stat_Text")
        Stat_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stat_Text:SetSize(137, 5)
        Stat_Text:SetPoint("BOTTOMLEFT", -4, -8.5)
        Stat_Text:SetText("Available Stat Points:")
       
        --FontStrings for stat values
        local Str_Value = StatNames:CreateFontString("Str_Value")
        Str_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Str_Value:SetSize(137, 5)
        Str_Value:SetPoint("TOP", 104.8, 0)
        local Sta_Value = StatNames:CreateFontString("Sta_Value")
        Sta_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Sta_Value:SetSize(137, 5)
        Sta_Value:SetPoint("TOP", 104.8, -20)
        local Agi_Value = StatNames:CreateFontString("Agi_Value")
        Agi_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Agi_Value:SetSize(137, 5)
        Agi_Value:SetPoint("TOP", 104.8, -40)
        local Inte_Value = StatNames:CreateFontString("Inte_Value")
        Inte_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Inte_Value:SetSize(137, 5)
        Inte_Value:SetPoint("TOP", 104.8, -60)
        local Spi_Value = StatNames:CreateFontString("Spi_Value")
        Spi_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Spi_Value:SetSize(137, 5)
        Spi_Value:SetPoint("TOP", 104.8, -80)
		
		local Stat_Value = StatNames:CreateFontString("Stat_Value")
        Stat_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stat_Value:SetSize(50, 5)
        Stat_Value:SetPoint("BOTTOMRIGHT", 115, -8.5)
		
		local stats
		local statquery
		local statpointquery
		local statpoints
     
        function init_stats(player)
            StatFrame:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
            stats = {}
            statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["str"]    = statquery:GetUInt32(0)
            stats["agi"]    = statquery:GetUInt32(1)
            stats["sta"]    = statquery:GetUInt32(2)
            stats["inte"]   = statquery:GetUInt32(3)
            stats["spi"]    = statquery:GetUInt32(4)
            statpoints = statpointquery:GetUInt32(0)
            Str_Value:SetText(""..stats["str"])
            Sta_Value:SetText(""..stats["sta"])
            Agi_Value:SetText(""..stats["agi"])
            Inte_Value:SetText(""..stats["inte"])
            Spi_Value:SetText(""..stats["spi"])
            Stat_Value:SetText(""..statpoints)
            StatFrame:Send(player) -- this sends the changes and clears the msgs
        end
       
	   
	   
        --Allocation Scripts
        function inc_strength(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
				statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
				statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
				stats["str"]   = statquery:GetUInt32(0)
				statpointvalue = statpointquery:GetUInt32(0)
				if (statpointvalue<0) then
					player:SendBroadcastMessage("You don't have enough stat points!")
				else
					StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
					stats["str"] = stats["str"]+1
					Str_Value:SetText(""..stats["str"])
					Stat_Value:SetText(""..(statpointvalue-1))
					CharDBExecute("UPDATE shard_stats SET str="..stats["str"].." WHERE playerguid="..player:GetGUIDLow())
					statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
					stats["str"] = statquery:GetUInt32(0)
					StatFrame:Send(player) -- this sends the changes and clears the msgs
					player:SendBroadcastMessage("You've increased your strength to "..(stats["str"]+1).."!")
					player:AddAura(7464, player)
					CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue-1).." WHERE playerguid="..player:GetGUIDLow().."")
				end
            end
        end
		
        function dec_strength(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["str"]   = statquery:GetUInt32(0)
			if (stats["str"]==0) then
				player:SendBroadcastMessage("This stat is at its minimum value.")
			else
			statpointvalue = statpointquery:GetUInt32(0)
            StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
			local newstr = statquery:GetUInt32(0)-1
            Str_Value:SetText(""..newstr)
			Stat_Value:SetText(""..(statpointvalue+1))
			CharDBExecute("UPDATE shard_stats SET str="..newstr.." WHERE playerguid="..player:GetGUIDLow())
            StatFrame:Send(player) -- this sends the changes and clears the msgs
			player:RemoveAura(7464, player)
            player:SendBroadcastMessage("You've decreased your strength to "..newstr.."!")
			ticker = 0
			if (newstr>=1) then
				repeat
					player:AddAura(7464, player)
					ticker = ((ticker)+1)
				until (ticker==newstr)
			end
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue+1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
			end
        end
		
        function inc_stamina(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["sta"]   = statquery:GetUInt32(2)
			statpointvalue = statpointquery:GetUInt32(0)
            if (statpointvalue<0) then
                player:SendBroadcastMessage("You don't have enough stat points!")
            else
                StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
                stats["sta"] = stats["sta"]+1
                Sta_Value:SetText(""..stats["sta"])
				Stat_Value:SetText(""..(statpointvalue-1))
				CharDBExecute("UPDATE shard_stats SET sta="..stats["sta"].." WHERE playerguid="..player:GetGUIDLow())
                statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
				stats["sta"] = statquery:GetUInt32(2)
                StatFrame:Send(player) -- this sends the changes and clears the msgs
                player:SendBroadcastMessage("You've increased your stamina to "..(stats["sta"]+1).."!")
				player:AddAura(7477, player)
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue-1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
            end
        end
		
        function dec_stamina(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["sta"]   = statquery:GetUInt32(2)
			if (stats["sta"]==0) then
				player:SendBroadcastMessage("This stat is at its minimum value.")
			else
			statpointvalue = statpointquery:GetUInt32(0)
            StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
			local newsta = statquery:GetUInt32(2)-1
            Sta_Value:SetText(""..newsta)
			Stat_Value:SetText(""..(statpointvalue+1))
			CharDBExecute("UPDATE shard_stats SET sta="..newsta.." WHERE playerguid="..player:GetGUIDLow())
            StatFrame:Send(player) -- this sends the changes and clears the msgs
			player:RemoveAura(7477, player)
            player:SendBroadcastMessage("You've decreased your strength to "..newsta.."!")
			ticker = 0
			if (newsta>=1) then
				repeat
					player:AddAura(7477, player)
					ticker = ((ticker)+1)
				until (ticker==newsta)
			end
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue+1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
			end
        end
		
        function inc_agility(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["agi"]   = statquery:GetUInt32(1)
			statpointvalue = statpointquery:GetUInt32(0)
            if (statpointvalue<0) then
                player:SendBroadcastMessage("You don't have enough stat points!")
            else
                StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
                stats["agi"] = stats["agi"]+1
                Agi_Value:SetText(""..stats["agi"])
				Stat_Value:SetText(""..(statpointvalue-1))
				CharDBExecute("UPDATE shard_stats SET agi="..stats["agi"].." WHERE playerguid="..player:GetGUIDLow())
                statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
				stats["agi"] = statquery:GetUInt32(1)
                StatFrame:Send(player) -- this sends the changes and clears the msgs
                player:SendBroadcastMessage("You've increased your agility to "..(stats["agi"]+1).."!")
				player:AddAura(7471, player)
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue-1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
            end
        end
		
        function dec_agility(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["agi"]   = statquery:GetUInt32(1)
			if (stats["agi"]==0) then
				player:SendBroadcastMessage("This stat is at its minimum value.")
			else
			statpointvalue = statpointquery:GetUInt32(0)
            StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
			local newagi = statquery:GetUInt32(1)-1
            Agi_Value:SetText(""..newagi)
			Stat_Value:SetText(""..(statpointvalue+1))
			CharDBExecute("UPDATE shard_stats SET agi="..newagi.." WHERE playerguid="..player:GetGUIDLow())
            StatFrame:Send(player) -- this sends the changes and clears the msgs
			player:RemoveAura(7471, player)
            player:SendBroadcastMessage("You've decreased your strength to "..newagi.."!")
			ticker = 0
			if (newagi>=1) then
				repeat
					player:AddAura(7471, player)
					ticker = ((ticker)+1)
				until (ticker==newagi)
			end
			speed = ((player:GetStat(1)/80))
	
			if (speed>0) then
				ticker6=1
			repeat
				ticker6 = ((ticker6)+0.01)
			until (ticker6>=speed)
			player:SetSpeed(1, ticker6, true)
			end
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue+1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
			end
        end
		
        function inc_intellect(player)
			if player:IsInCombat() then
				player:SendBroadcastMessage("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["inte"]   = statquery:GetUInt32(3)
			statpointvalue = statpointquery:GetUInt32(0)
            if (statpointvalue<0) then
                player:SendBroadcastMessage("You don't have enough stat points!")
            else
                StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
                stats["inte"] = stats["inte"]+1
                Inte_Value:SetText(""..stats["inte"])
				Stat_Value:SetText(""..(statpointvalue-1))
				CharDBExecute("UPDATE shard_stats SET inte="..stats["inte"].." WHERE playerguid="..player:GetGUIDLow())
                statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
				stats["inte"] = statquery:GetUInt32(3)
                StatFrame:Send(player) -- this sends the changes and clears the msgs
                player:SendBroadcastMessage("You've increased your intellect to "..(stats["inte"]+1).."!")
				player:AddAura(7468, player)
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue-1).." WHERE playerguid="..player:GetGUIDLow().."")
            end
			end
        end
		
        function dec_intellect(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["inte"]   = statquery:GetUInt32(3)
			if (stats["inte"]==0) then
				player:SendBroadcastMessage("This stat is at its minimum value.")
			else
			local newvalue = statquery:GetUInt32(3)-1
			statpointvalue = statpointquery:GetUInt32(0)
            StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
            Inte_Value:SetText(""..newvalue)
			Stat_Value:SetText(""..(statpointvalue+1))
			CharDBExecute("UPDATE shard_stats SET inte="..newvalue.." WHERE playerguid="..player:GetGUIDLow())
            StatFrame:Send(player) -- this sends the changes and clears the msgs
			player:RemoveAura(7468, player)
            player:SendBroadcastMessage("You've decreased your intellect to "..newvalue.."!")
			    ticker = 0
			if (newvalue>=1) then
				repeat
					player:AddAura(7468, player)
					ticker = ((ticker)+1)
				until (ticker==newvalue)
			end
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue+1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
			end
        end
		
        function inc_spirit(player)
			if player:IsInCombat() then
				player:SendBroadcastMessage("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["spi"]   = statquery:GetUInt32(4)
			statpointvalue = statpointquery:GetUInt32(0)
            if (statpointvalue<0) then
                player:SendBroadcastMessage("You don't have enough stat points!")
            else
                StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
                stats["spi"] = stats["spi"]+1
                Spi_Value:SetText(""..stats["spi"])
				Stat_Value:SetText(""..(statpointvalue-1))
				CharDBExecute("UPDATE shard_stats SET spi="..stats["spi"].." WHERE playerguid="..player:GetGUIDLow())
                statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
				stats["spi"] = statquery:GetUInt32(4)
                StatFrame:Send(player) -- this sends the changes and clears the msgs
                player:SendBroadcastMessage("You've increased your spirit to "..(stats["spi"]+1).."!")
				player:AddAura(7474, player)
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue-1).." WHERE playerguid="..player:GetGUIDLow().."")
            end
			end
        end
		
        function dec_spirit(player)
			if player:IsInCombat() then
				player:SendBroadcastMessasge("You cannot allocate stat points while in combat.")
			else
            statquery      = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
            statpointquery = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
            stats["spi"]   = statquery:GetUInt32(4)
			if (stats["spi"]==0) then
				player:SendBroadcastMessage("This stat is at its minimum value.")
			else
			local newvalue = statquery:GetUInt32(4)-1
			statpointvalue = statpointquery:GetUInt32(0)
            StatNames:Clear() -- Clear all stat frame and its childrens msgs just to be sure se only send what we mean
            Spi_Value:SetText(""..newvalue)
			Stat_Value:SetText(""..(statpointvalue+1))
			CharDBExecute("UPDATE shard_stats SET spi="..newvalue.." WHERE playerguid="..player:GetGUIDLow())
            StatFrame:Send(player) -- this sends the changes and clears the msgs
            player:SendBroadcastMessage("You've decreased your spirit to "..newvalue.."!")
			player:RemoveAura(7474, player)
			    ticker = 0
			if (newvalue>=1) then
				repeat
					player:AddAura(7474, player)
					ticker = ((ticker)+1)
				until (ticker==newvalue)
			end
			CharDBExecute("UPDATE shard_aa_points SET statpoints="..(statpointvalue+1).." WHERE playerguid="..player:GetGUIDLow().."")
			end
			end
        end
       
        --Allocation Buttons
        local Inc_Str = AIO:CreateFrame("Button", "Inc_Str", StatFrame, nil)
        Inc_Str:SetSize(20, 20)
        Inc_Str:SetPoint("TOPRIGHT", -20, -30)
        Inc_Str:SetEnabledMouse(true)
        Inc_Str:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Str:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Str:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Str:SetScript("OnMouseUp", inc_strength)
       
        local Dec_Str = AIO:CreateFrame("Button", "Dec_Str", StatFrame, nil)
        Dec_Str:SetSize(20, 20)
        Dec_Str:SetPoint("TOPRIGHT", -60, -30)
        Dec_Str:SetEnabledMouse(true)
        Dec_Str:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Str:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Str:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Str:SetScript("OnMouseUp", dec_strength)
       
        local Inc_Sta = AIO:CreateFrame("Button", "Inc_Sta", StatFrame, nil)
        Inc_Sta:SetSize(20, 20)
        Inc_Sta:SetPoint("TOPRIGHT", -20, -50)
        Inc_Sta:SetEnabledMouse(true)
        Inc_Sta:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Sta:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Sta:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Sta:SetScript("OnMouseUp", inc_stamina)
       
        local Dec_Sta = AIO:CreateFrame("Button", "Dec_Sta", StatFrame, nil)
        Dec_Sta:SetSize(20, 20)
        Dec_Sta:SetPoint("TOPRIGHT", -60, -50)
        Dec_Sta:SetEnabledMouse(true)
        Dec_Sta:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Sta:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Sta:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Sta:SetScript("OnMouseUp", dec_stamina)
       
        local Inc_Agi = AIO:CreateFrame("Button", "Inc_Agi", StatFrame, nil)
        Inc_Agi:SetSize(20, 20)
        Inc_Agi:SetPoint("TOPRIGHT", -20, -70)
        Inc_Agi:SetEnabledMouse(true)
        Inc_Agi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Agi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Agi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Agi:SetScript("OnMouseUp", inc_agility)
       
        local Dec_Agi = AIO:CreateFrame("Button", "Dec_Agi", StatFrame, nil)
        Dec_Agi:SetSize(20, 20)
        Dec_Agi:SetPoint("TOPRIGHT", -60, -70)
        Dec_Agi:SetEnabledMouse(true)
        Dec_Agi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Agi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Agi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Agi:SetScript("OnMouseUp", dec_agility)
       
        local Inc_Inte = AIO:CreateFrame("Button", "Inc_Inte", StatFrame, nil)
        Inc_Inte:SetSize(20, 20)
        Inc_Inte:SetPoint("TOPRIGHT", -20, -90)
        Inc_Inte:SetEnabledMouse(true)
        Inc_Inte:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Inte:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Inte:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Inte:SetScript("OnMouseUp", inc_intellect)
       
        local Dec_Inte = AIO:CreateFrame("Button", "Dec_Inte", StatFrame, nil)
        Dec_Inte:SetSize(20, 20)
        Dec_Inte:SetPoint("TOPRIGHT", -60, -90)
        Dec_Inte:SetEnabledMouse(true)
        Dec_Inte:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Inte:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Inte:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Inte:SetScript("OnMouseUp", dec_intellect)
       
        local Inc_Spi = AIO:CreateFrame("Button", "Inc_Spi", StatFrame, nil)
        Inc_Spi:SetSize(20, 20)
        Inc_Spi:SetPoint("TOPRIGHT", -20, -110)
        Inc_Spi:SetEnabledMouse(true)
        Inc_Spi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Spi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Spi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Spi:SetScript("OnMouseUp", inc_spirit)
       
        local Dec_Spi = AIO:CreateFrame("Button", "Dec_Spi", StatFrame, nil)
        Dec_Spi:SetSize(20, 20)
        Dec_Spi:SetPoint("TOPRIGHT", -60, -110)
        Dec_Spi:SetEnabledMouse(true)
        Dec_Spi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Spi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Spi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Spi:SetScript("OnMouseUp", dec_spirit)
     
AIO:AddInitMsg(Frame)
AIO:AddInitMsg(TrainingFrame)
AIO:AddInitMsg(StatFrame)
AIO:AddPostInitFunc(init_stats)
	
RegisterPlayerEvent(3, init_stats)