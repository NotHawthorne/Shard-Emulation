--[[
		The purpose of this script is to attempt to increase ease of UI 
	navigation,  and create  some  sort  of  explanation behind certain 
	undocumented GATE functions. Consider this a  framework  for future
	GATE based user interface elements.
	
	~NotHawthorne
]]--

local Liturgy = {Prefix = "Liturgy"};		 --Prefix. Important... I think?

function liturgy_menu (event, player, spell) --Temporary trigger for testing
	if (spell:GetEntry()==818012) then
		 Liturgy.RenderMainMenu(player)
	end
end

function Liturgy.RenderMainMenu(player)
--[[
	 _______________________________________
	|  ~Variable~	|	 ~Explanation~	    |
	|_______________|_______________________|
	| frame_name	| "Title of the window" |____
	| frame_height	| Height of frame in pixels. |
	| frame_width	| Width of frame in pixels.  |_____________________
	| frame_texture	| "Path to the background texture for your frame." |
	| locked_frame	| Set to 'false' if you want your window draggable.|
	| "			 "	| Set to 'true' to make the window unmoveable._____|
	| menu_height	| Height of dropdown box. |
	| menu_width	| Width of dropdown box	  |____________________________________________________________
	| DropDownItems | {"Name Displayed", "Selection(ordered number)"}, 'Selection' being used for reference.|
	|_______________|_______________________________________________________________________________________|
	 
]]--
	local frame_name = "Skill Advancement"
	local frame_height = 300
	local frame_width = 300
	local frame_texture = "Interface/AchievementFrame/UI-Achievement-Parchment-Horizontal-Desaturated"
	local locked_frame = false
		
	local menu_height = 40
	local menu_width = 100

    Liturgy.DropDownItems = 
    {
		{"Holy Bonds", "Selection1"},
		{"Smite", "Selection2"}
    }
	--[[Frame Rendering]]--
    local YOffset = 320
    local Frame = CreateFrame(Liturgy.Prefix.."MainFrame")
    Frame:SetText(frame_name)
    Frame:SetCantMove(locked_frame)
    Frame:SetHeight(frame_height)
    Frame:SetWidth(frame_width)
	Frame:SetTexture(frame_texture)

	--[[DropDownMenu and DropDownItem Rendering]]--
    local menu = Frame:CreateDropDownMenu("Choose Skill")
	menu:SetHeight(menu_height)
	menu:SetWidth(menu_width)
    for k, v in pairs(Liturgy.DropDownItems) do
		menu:SetDropDownItem(v[1])
		player:SendBroadcastMessage("Loaded "..v[1].."")
	end
Frame:Send(player)
end

RegisterPlayerEvent(5, liturgy_menu)