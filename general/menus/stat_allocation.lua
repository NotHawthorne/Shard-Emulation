local SA =
{
    Prefix = "SA"
};

pointgain = 6


function init_stats(player)
    stats = {}
    statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM shard_stats WHERE playerguid="..player:GetGUIDLow().."")
    stats["str"] = statquery:GetUInt32(0)
    stats["agi"] = statquery:GetUInt32(1)
    stats["sta"] = statquery:GetUInt32(2)
    stats["inte"] = statquery:GetUInt32(3)
    stats["spi"] = statquery:GetUInt32(4)
end

function stat_allocation (event, player, oldLevel)
    local existing_statpoints = CharDBQuery("SELECT statpoints FROM shard_aa_points WHERE playerguid="..player:GetGUIDLow())
    statpoints = existing_statpoints:GetUInt32(0)+pointgain -- Old points + points/lvl
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've gained "..pointgain.." stat points!")
    init_stats(player)
    SA.RenderMainMenu(player)
end

function SA.RenderMainMenu(player)

        SA.TextBoxes = 
        {
            {"prompt1", "Allocate stat points.", 15, 185, 57.5, 0, 12},
            {"str", "Strength", 17, 120, 37.5, -70, 12},
            {"sta", "Stamina", 17, 120, 17.5, -71.5, 12},
            {"agi", "Agility", 17, 120, -2.5, -77.5, 12},
            {"inte", "Intellect", 17, 120, -22.5, -70, 12},
            {"spi", "Spirit", 17, 120, -42.5, -80.5, 12},
			{"str_value", ""..stats["str"].."", 17, 120, 37.5, 58.25, 12},
			{"sta_value", ""..stats["sta"].."", 17, 120, 17.5, 58.25, 12},
			{"agi_value", ""..stats["agi"].."", 17, 120, -2.5, 58.25, 12},
			{"inte_value", ""..stats["inte"].."", 17, 120, -22.5, 58.25, 12},
			{"spi_value", ""..stats["spi"].."", 17, 120, -42.5, 58.25, 12},
			{"prompt2", "Available stat points: "..statpoints.."", 15, 185, -62.5, 0, 12},
        };

        SA.Buttons = 
        {
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
			if (v[1]=="inc_str") and statpoints > 0 then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints - 1
				increase_str(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="dec_str") and stats["str"] > 0  then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints + 1
				decrease_str(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="inc_sta") and statpoints > 0 then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints - 1
				increase_sta(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="dec_sta") and stats["sta"] > 0  then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints + 1
				decrease_sta(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="inc_inte") and statpoints > 0 then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints - 1
				increase_inte(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="dec_inte") and stats["inte"] > 0  then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints + 1
				decrease_inte(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="inc_agi") and statpoints > 0 then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints - 1
				increase_agi(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="dec_agi") and stats["agi"] > 0  then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints + 1
				decrease_agi(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="inc_spi") and statpoints > 0 then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints - 1
				increase_spi(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			elseif (v[1]=="dec_spi") and stats["spi"] > 0  then
				Frame:Hide(player)
				Button:SetEvent("OnClick", function(self, event, player, Cache)
				statpoints = statpoints + 1
				decrease_spi(player, statpoints)
				SA.RenderMainMenu(player)
				end)
			end
		end
Frame:Send(player)
end

function increase_str(player, statpoints)
    stats["str"] = stats["str"] + 1
    player:AddAura(7464, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    CharDBExecute("UPDATE shard_stats SET str="..stats["str"].." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've increased your Strength by 1.")
end

function decrease_str(player, statpoints)
    stats["str"] = stats["str"] - 1
    player:RemoveAura(7464, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow().."")
	CharDBExecute("UPDATE shard_stats SET str="..stats["str"].." WHERE playerguid="..player:GetGUIDLow().."")
    player:SendBroadcastMessage("You've decreased your Strength by 1.")
    ticker = 0
	if (stats["str"]>0) then
		repeat
			player:AddAura(7464, player)
			ticker = ((ticker)+1)
		until (ticker==stats["str"])
	end
end

function increase_agi(player, statpoints)
    stats["agi"] = stats["agi"] + 1
    player:AddAura(7471, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    CharDBExecute("UPDATE shard_stats SET agi="..stats["agi"].." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've increased your Agility by 1.")
end

function decrease_agi(player, statpoints)
    stats["agi"] = stats["agi"] - 1
    player:RemoveAura(7471, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow().."")
	CharDBExecute("UPDATE shard_stats SET agi="..stats["agi"].." WHERE playerguid="..player:GetGUIDLow().."")
    player:SendBroadcastMessage("You've decreased your Agility by 1.")
    ticker = 0
	if (stats["agi"]>0) then
		repeat
			player:AddAura(7471, player)
			ticker = ((ticker)+1)
		until (ticker==stats["agi"])
	end
end

function increase_sta(player, statpoints)
    stats["sta"] = stats["sta"] + 1
    player:AddAura(7477, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    CharDBExecute("UPDATE shard_stats SET sta="..stats["sta"].." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've increased your Stamina by 1.")
end

function decrease_sta(player, statpoints)
    stats["sta"] = stats["sta"] - 1
    player:RemoveAura(7477, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow().."")
	CharDBExecute("UPDATE shard_stats SET sta="..stats["sta"].." WHERE playerguid="..player:GetGUIDLow().."")
    player:SendBroadcastMessage("You've decreased your Stamina by 1.")
    ticker = 0
	if (stats["sta"]>0) then
		repeat
			player:AddAura(7477, player)
			ticker = ((ticker)+1)
		until (ticker==stats["sta"])
	end
end

function increase_inte(player, statpoints)
    stats["inte"] = stats["inte"] + 1
    player:AddAura(7468, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    CharDBExecute("UPDATE shard_stats SET inte="..stats["inte"].." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've increased your Intellect by 1.")
end

function decrease_inte(player, statpoints)
    stats["inte"] = stats["inte"] - 1
    player:RemoveAura(7468, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow().."")
	CharDBExecute("UPDATE shard_stats SET inte="..stats["inte"].." WHERE playerguid="..player:GetGUIDLow().."")
    player:SendBroadcastMessage("You've decreased your Intellect by 1.")
    ticker = 0
	if (stats["inte"]>0) then
		repeat
			player:AddAura(7468, player)
			ticker = ((ticker)+1)
		until (ticker==stats["inte"])
	end
end

function increase_spi(player, statpoints)
    stats["spi"] = stats["spi"] + 1
    player:AddAura(7474, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow())
    CharDBExecute("UPDATE shard_stats SET spi="..stats["spi"].." WHERE playerguid="..player:GetGUIDLow())
    player:SendBroadcastMessage("You've increased your Spirit by 1.")
end

function decrease_spi(player, statpoints)
    stats["spi"] = stats["spi"] - 1
    player:RemoveAura(7474, player)
    CharDBExecute("UPDATE shard_aa_points SET statpoints="..statpoints.." WHERE playerguid="..player:GetGUIDLow().."")
	CharDBExecute("UPDATE shard_stats SET spi="..stats["spi"].." WHERE playerguid="..player:GetGUIDLow().."")
    player:SendBroadcastMessage("You've decreased your Spirit by 1.")
    ticker = 0
	if (stats["spi"]>0) then
		repeat
			player:AddAura(7468, player)
			ticker = ((ticker)+1)
		until (ticker==stats["spi"])
	end
end

RegisterPlayerEvent(13, stat_allocation)