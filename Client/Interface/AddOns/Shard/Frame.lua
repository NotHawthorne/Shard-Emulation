-- Author      : NotHawthorne
-- Create Date : 12/5/2014 7:44:33 AM
local m2 = CreateFrame("PlayerModel", "TestaniModel2",UIParent)

m2:SetScript("OnEvent", function (s,e,...)
	if(e=="PLAYER_LOGIN") then
    	DisplayModel()
	end 
end)

local function DisplayModel()
    m2:SetSize(256,256)
    m2:SetPoint("CENTER",256,0)
    m2:SetDisplayInfo(16587)
    m2:Show()
    print("Yep")
end