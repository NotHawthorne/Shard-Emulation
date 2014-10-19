local FL = {
    Prefix = "FL"
};
function first_login (Event, Player)
	FL.RenderMainMenu(Player)
end
-- [[ MAIN MENU ]]
function FL.RenderMainMenu(Player)
        FL.TextBoxes = {
            {"prompt1", "Please select your starting", 15, 185, 61, 0, 12},
            {"prompt2", "weapon.", 15, 185, 48, 0, 12},
        };
		FL.Buttons = {
			{"2h_sword", "Greatsword", 17, 125, 24, 0},
			{"1h_sword", "Mace and Shield", 17, 125, 4, 0},
			{"daggers", "Daggers", 17, 125, -16, 0},
			{"staff", "Staff", 17, 125, -36, 0},
			{"bow", "Bow", 17, 125,-56, 0},
		};
        local YOffset = 320
        local Frame = CreateFrame(FL.Prefix.."MainFrame")
       
        Frame:SetText("Welcome to Shard!")
        Frame:SetCantMove(false)
        Frame:SetHeight(200)
        Frame:SetWidth(200)
		
         -- [[ RENDER TEXT BOXES ]]
        for k, v in pairs(FL.TextBoxes) do
            local TextBox = Frame:CreateTextBox(FL.Prefix..v[1])
            TextBox:SetText(v[2])
            TextBox:SetHeight(v[3])
            TextBox:SetWidth(v[4])
            TextBox:SetYOffset(v[5])
            TextBox:SetXOffset(v[6])
            TextBox:SetTextHeight(v[7])
        end
        -- [[ RENDER BUTTONS ]]
        for k, v in pairs(FL.Buttons) do
            if Button then
                print("True")
            end
            local Button = Frame:CreateButton(FL.Prefix..v[1])
                           
            Button:SetText(v[2])
            Button:SetHeight(v[3])
            Button:SetWidth(v[4])
            Button:SetYOffset(v[5])
            Button:SetXOffset(v[6])
                           
            -- [[ HANDLE ONCLICK EVENT ]]
			if (v[1]=="2h_sword") then
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddItem(49778, 1)
				Frame:Hide(Player)
				Player:SendBroadcastMessage("You obtained a Worn Greatsword.")
				end)
			elseif (v[1]=="1h_sword") then
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddItem(36, 1)
				Player:AddItem(2210, 1)
				Frame:Hide(Player)
				Player:SendBroadcastMessage("You obtained a Worn Mace and Battered Buckler.")
				end)
            Button:SetEvent("OnClick", function(self, event, Player, Cache)
                Player:SendBroadcastMessage("test")
            end)
        end
	end
Frame:Send(Player)
end

RegisterPlayerEvent(18, first_login)