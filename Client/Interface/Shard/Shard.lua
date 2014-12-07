Shard_ClassData	= {}
Shard_SpellData = {}
Shard_CharData	= {}
requests		= 0

function Shard_RecieveData(SentData, Identifier)
	if (SentData~=nil) and (type(SentData)=="table") then
		if (Identifier==1) then
			Shard_ClassData = SentData
		elseif (Identifier==2) then
			Shard_SpellData = SentData
		elseif (Identifier==3) then
			Shard_CharData  = SentData
		end
	else
		print("[Shard]: Unexpected data from server.")
	end
end

function Shard_RequestData(Identifier)
	if (Identifier==1) then			--RELOAD LOGIN INFO
		Shard_ClassData	= {}
		Shard_SpellData = {}
		Shard_CharData	= {}
		msg = AIO:CreateMsg()
		msg:AddBlock("RequestData", Identifier)
		msg:Send()
		requests = requests+1
	end
end

local frame = CreateFrame("FRAME", "ServerFrame")
frame:RegisterEvent("PLAYER_LOGIN")
local function eventHandler(self, event, ...)
	Shard_RequestData(1+requests)
end
frame:SetScript("OnEvent", eventHandler)

--[[TOOLTIP MODIFICATION]]
GameTooltip:HookScript("OnTooltipSetUnit", function(self)	--Display Class Names
	local name, unit = GameTooltip:GetUnit()
	if (unit~=nil) then
	    local healthbar = CreateFrame("StatusBar", nil, GameTooltip);
	    healthbar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	    healthbar:GetStatusBarTexture():SetHorizTile(false)
	    healthbar:SetMinMaxValues(0, 100)
	    healthbar:SetWidth(205)
	    healthbar:SetHeight(7)
	    healthbar:SetPoint("CENTER",GameTooltip,"BOTTOM", 0, -5)
	    healthbar:SetStatusBarColor(0,1,0)
	    healthbar:Hide()
		local guid = (tonumber(UnitGUID(unit)))
		local race, raceEn = UnitRace(unit)
		local class = Shard_CharData[guid]
		if (UnitHealthMax(unit)~=nil) and (class~=nil) then
			local healthpct = UnitHealth(unit)/UnitHealthMax(unit)
			healthbar:SetValue(healthpct)
	 		GameTooltip:SetText(name, 1,1,1,1);
			GameTooltip:AddLine("Level "..UnitLevel(unit).." "..race.." "..Shard_ClassData[class][2].." (Player)", 1,1,1,1);
            healthbar:Show()
		end
	end
	self:Show()
end)
GameTooltip:HookScript("OnTooltipSetSpell", function(self)	--Set Spell Tooltips
	if (GameTooltip:GetSpell()~=nil) then
		local spellName, spellRank, spellID = GameTooltip:GetSpell()	
    	for k, v in pairs(Shard_SpellData) do
    		if (spellID==v[1]) then
    			if (type==1) then
					GameTooltip:SetText(v[4])
				end
			end
    	end
    end
    self:Show()
end)