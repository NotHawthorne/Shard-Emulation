local SA = {
    Prefix = "SA"
};
pointgain = 6 -- SET NUMBER OF POINTS GAINED PER LEVEL
function stat_allocation (Event, Player, oldLevel)
		stat_array={
			0,
			0,
			0,
			0,
			0,
			0
		}
	if (oldLevel<(Player:GetLevel())) then
		existing_statpoints = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..Player:GetGUIDLow().."")
		points = ((existing_statpoints:GetUInt32(0))+pointgain)
		CharDBExecute("UPDATE shard_aa_points SET statpoints="..points.." WHERE playerguid="..Player:GetGUIDLow().."")
		Player:SendBroadcastMessage("You've gained "..pointgain.." stat points!")
		statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..Player:GetGUIDLow().."")
		stat_ticker = 0
		repeat
			stat_ticker = (stat_ticker+1)
			stat_array[(stat_ticker)] = (statquery:GetUInt32((stat_ticker)-1))
		until (stat_ticker==5)
		stat_ticker = 0
	else
		Player:SendBroadcastMessage("H...How did you de-level!?")
	end
	initial = 1
	update = 1
	SA.RenderMainMenu(Player)
end
-- [[ MAIN MENU ]]
function SA.RenderMainMenu(Player)
		statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..Player:GetGUIDLow().."")
		statpoints = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..Player:GetGUIDLow().."")
		base_statdb = WorldDBQuery("SELECT str, agi, sta, inte, spi FROM player_levelstats WHERE race="..Player:GetRace().."")
		if (statpoints==nil) then 
			Player:SendBroadcastMessage("[DEBUG]:No database framework! Creating...")
			CharDBExecute("INSERT INTO shard_aa_points (playerguid) VALUES ("..Player:GetGUIDLow()..")")
			statpoints = CharDBQuery("SELECT points FROM shard_aa_points WHERE playerguid="..Player:GetGUIDLow().."")
			if (statpoints==nil) then 
				Player:SendBroadcastMessage("[DEBUG]:Database framework creation failed.")
			else
				Player:SendBroadcastMessage("[DEBUG]:Database framework creation succeeded!")
			end
		end
		stat_ticker = 0
		repeat
			stat_ticker = (stat_ticker+1)
			stat_array[(stat_ticker)] = (statquery:GetUInt32((stat_ticker)-1))
		until (stat_ticker==5)
		if (initial==1) then
			str_newvalue = statquery:GetUInt32(0)
		end
		if (update==1) then
			stat_array[1] = str_newvalue
		end
        SA.TextBoxes = {
            {"prompt1", "Allocate stat points.", 15, 185, 57.5, 0, 12},
            {"str", "Strength", 17, 120, 37.5, -70, 12},
            {"agi", "Dexterity", 17, 120, 17.5, -69, 12},
            {"sta", "Stamina", 17, 120, -2.5, -71.5, 12},
            {"inte", "Intelligence", 17, 120, -22.5, -61.5, 12},
            {"spi", "Wisdom", 17, 120, -42.5, -71.5, 12},
			{"str_value", ""..(tonumber(stat_array[1])).."", 17, 120, 37.5, 58.25, 12},
			{"agi_value", ""..(tonumber(stat_array[2])).."", 17, 120, 17.5, 58.25, 12},
			{"sta_value", ""..(tonumber(stat_array[3])).."", 17, 120, -2.5, 58.25, 12},
			{"inte_value", ""..(tonumber(stat_array[4])).."", 17, 120, -22.5, 58.25, 12},
			{"spi_value", ""..(tonumber(stat_array[5])).."", 17, 120, -42.5, 58.25, 12},
			{"prompt2", "Available stat points: "..points.."", 15, 185, -62.5, 0, 12},
        };
		SA.Buttons = {
			{"inc_str", ">>", 17, 25, 37.5, 85},
			{"dec_str", "<<", 17, 25, 37.5, 30},
			{"inc_sta", ">>", 17, 25, 17.5, 85},
			{"dec_sta", "<<", 17, 25, 17.5, 30},
			{"inc_agi", ">>", 17, 25, -2.5, 85},
			{"dec_agi", "<<", 17, 25, -2.5, 30},
			{"inc_inte", ">>", 17, 25, -22.5, 85},
			{"dec_inte", "<<", 17, 25, -22.5, 30},
			{"inc_spi", ">>", 17, 25, -42.5, 85},
			{"dec_spi", "<<", 17, 25, -42.5, 30},
		};
        local YOffset = 320
        local Frame = CreateFrame(SA.Prefix.."MainFrame")
       
        Frame:SetText("Stat Allocation")
        Frame:SetCantMove(false)
        Frame:SetHeight(190)
        Frame:SetWidth(220)
		
         -- [[ RENDER TEXT BOXES ]]
        for k, v in pairs(SA.TextBoxes) do
            local TextBox = Frame:CreateTextBox(SA.Prefix..v[1])
            TextBox:SetText(v[2])
            TextBox:SetHeight(v[3])
            TextBox:SetWidth(v[4])
            TextBox:SetYOffset(v[5])
            TextBox:SetXOffset(v[6])
            TextBox:SetTextHeight(v[7])
        end
        -- [[ RENDER BUTTONS ]]
        for k, v in pairs(SA.Buttons) do
            if Button then
                print("True")
            end
            local Button = Frame:CreateButton(SA.Prefix..v[1])
                           
            Button:SetText(v[2])
            Button:SetHeight(v[3])
            Button:SetWidth(v[4])
            Button:SetYOffset(v[5])
            Button:SetXOffset(v[6])
                           
            -- [[ HANDLE ONCLICK EVENT ]]
			if (v[1]=="inc_str") then
				Frame:Hide(Player)
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddAura(7464, Player)
				str_newvalue = (stat_array[1])+1
				stat_array[1] = str_newvalue
				points = points-1
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..points.." WHERE playerguid="..Player:GetGUIDLow().."")
				CharDBExecute("UPDATE shard_stats SET str="..str_newvalue.." WHERE playerguid="..Player:GetGUIDLow().."")
				SA.RenderMainMenu(Player)
				Player:SendBroadcastMessage("You've increased your Strength by 1.")
				initial = 0
				end)
			elseif (v[1]=="dec_str") then
				Frame:Hide(Player)
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:RemoveAura(7464, Player)
				str_newvalue = (stat_array[1])-1
				stat_array[1] = str_newvalue
				points = points+1
				CharDBExecute("UPDATE shard_aa_points SET statpoints="..points.." WHERE playerguid="..Player:GetGUIDLow().."")
				CharDBExecute("UPDATE shard_stats SET str="..str_newvalue.." WHERE playerguid="..Player:GetGUIDLow().."")
				statdb = CharDBQuery("SELECT str FROM shard_stats WHERE playerguid="..Player:GetGUIDLow().."")
				allocated_str = statdb:GetUInt32(0)
				local ticker = 0
				if (initial==1) then
					if (allocated_str>0) then
						repeat
							Player:AddAura(7464, Player)
							ticker = ticker+1
						until (ticker==(allocated_str-1))
					end
				else
					if (allocated_str>0) then
						repeat
							Player:AddAura(7464, Player)
							ticker = ticker+1
						until (ticker==allocated_str)
					end
				end
				initial = 0
				SA.RenderMainMenu(Player)
				Player:SendBroadcastMessage("You've decreased your Strength by 1.")
				end)
			elseif (v[1]=="daggers") then
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddItem(2092, 2)
				Frame:Hide(Player)
				Player:SendBroadcastMessage("You obtained two Worn Daggers.")
				end)
			elseif (v[1]=="staff") then
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddItem(35, 1)
				Frame:Hide(Player)
				Player:SendBroadcastMessage("You obtained a Bent Staff.")
				end)
			elseif (v[1]=="bow") then
				Button:SetEvent("OnClick", function(self, event, Player, Cache)
				Player:AddItem(2504, 1)
				Player:AddItem(2512, 200)
				Frame:Hide(Player)
				Player:SendBroadcastMessage("You obtained a Worn Shortbow and some arrows.")
				end)
			end
		end
Frame:Send(Player)
end

RegisterPlayerEvent(13, stat_allocation)