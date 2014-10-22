   print("[ElunaGate]: Alternate Advancement loaded!")
--[[GLOBAL VARIABLE DECLARATION]]
    local AA = {
            Prefix = "AA"
    };
--[[DYNAMIC VARIABLE DECLARATION]]

sel_array={
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0
		  }

cat=0

    -- [[OnChat Trigger]]
function AA.OnGossip(event, Player, unit)
	local playerguid = Player:GetGUIDLow()
	local query1 = WorldDBQuery("SELECT guild FROM ownership")
	local query2 = CharDBQuery("SELECT guildid FROM guild_member WHERE guid="..Player:GetGUIDLow().."")
	query3 = CharDBQuery("SELECT points FROM shard_aa_points WHERE playerguid="..Player:GetGUIDLow().."")
	if (query3==nil) then
		CharDBExecute("INSERT INTO shard_aa_points (playerguid,points) VALUES ("..Player:GetGUIDLow()..",0)")
		Player:SendBroadcastMessage("Successfully created shard_aa_points entry for player GUID "..Player:GetGUIDLow().."!")
		query3 = CharDBQuery("SELECT points FROM shard_aa_points WHERE playerguid="..Player:GetGUIDLow().."")
	end
	points = query3:GetUInt32(0)
	if (query1==nil) then
		Player:SendBroadcastMessage("You must be in a guild to access the Alternate Advancement trainer!")
	else
		if (tonumber(query1:GetString(0)) == tonumber(query2:GetString(0))) then
			AA.RenderMainMenu(Player)
		else
			Player:SendBroadcastMessage("Your guild does not own Tanuka'le Village!")
		end
	end
end
	
RegisterCreatureGossipEvent(818023, 1, AA.OnGossip)
     
    -- [[ MAIN MENU ]]
    function AA.RenderMainMenu(Player)
             AA.MainButtons = {
                    "Weaponmastery",
                    "Defense",
                    "Berserking",
					"Companionship",
					"Sharpshooting",
					"Shamanism",
					"Magicka",
					"Righteousness",
					"Blighting",
					"Stealth",
            };
            local YOffset = 320
            local Frame = CreateFrame(AA.Prefix.."MainFrame")
           
            Frame:SetText("Alternate Advancement")
            Frame:SetCantMove(false)
            Frame:SetHeight(250)
            Frame:SetWidth(200)
           
            for k, v in pairs(AA.MainButtons) do
                    local Button = Frame:CreateButton(AA.Prefix..v)
                    Button:SetText(v)
                    Button:SetHeight(17)                   
                    Button:SetWidth(140)
                    Button:SetYOffset(YOffset-237)
                    Button:SetXOffset(2)
                   
                    Button:SetEvent("OnClick", function(self, event, Player)
									if (v=="Weaponmastery") then
										cat = 1
									end
									if (v=="Defense") then
										cat = 2
									end
									if (v=="Berserking") then
										cat = 3
									end
									if (v=="Companionship") then
										cat = 4
									end
									if (v=="Sharpshooting") then
										cat = 5
									end
									if (v=="Shamanism") then
										cat = 6
									end
									if (v=="Magicka") then
										cat = 7
									end
									if (v=="Righteousness") then
										cat = 8
									end
									if (v=="Blighting") then
										cat = 9
									end
									if (v=="Stealth") then
										cat = 10
									end
									categoryquery = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().." AND category="..cat.." GROUP BY selection ORDER BY selection ASC")
									if (categoryquery~=nil) then
									sel_ticker=0
										repeat
											--Player:SendBroadcastMessage(""..categoryquery:GetUInt32(0).."")
											sel_ticker=(sel_ticker+1)
											sel_array[(sel_ticker)]=categoryquery:GetUInt32(0)
										until not categoryquery:NextRow()
									catergoryquery = nil
									else
										sel = 0
										repeat
											sel = sel+1
											CharDBExecute("INSERT INTO shard_aa_allocation (playerguid, category, selection) VALUES ("..Player:GetGUIDLow()..","..cat..","..sel..")")
										until sel==6
										Player:SendBroadcastMessage("Created database framework!")
									end
                                    Frame:Hide(Player)
                                    AA.RenderSubMenu(Player, v)
                            end
                    )
                    YOffset = YOffset - 20
            end
           
            Frame:Send(Player)
    end
	
    -- [[ SKILL MENU ]]
    function AA.RenderSkillMenu(Player)
             AA.MainButtons = {
                    "+",
                    "-",
            };
            local YOffset = 320
            local Frame = CreateFrame(AA.Prefix.."SubFrame")
           
            Frame:SetText("Skill Description")
            Frame:SetCantMove(false)
            Frame:SetHeight(250)
            Frame:SetWidth(190)
           
            for k, v in pairs(AA.MainButtons) do
                    local Button = Frame:CreateButton(AA.Prefix..v)
                    Button:SetText(v)
                    Button:SetHeight(17)                   
                    Button:SetWidth(140)
                    Button:SetYOffset(YOffset-237)
                    Button:SetXOffset(2)
                   
                    Button:SetEvent("OnClick", function(self, event, Player)
                                    AA.RenderSubMenu(Player, v)
                                    Frame:Hide(Player)
                            end
                    )
                   
                    YOffset = YOffset - 20
            end
           
            Frame:Send(Player)
    end
     
    function AA.RenderSubMenu(Player, Type)
	playerid = Player:GetGUIDLow()
            AA.Weaponmastery = {
                    Height = 190,
                    Width = 220,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
						{"inc_daggerspec", ">>", 17, 25, 56, 85},
						{"dec_daggerspec", "<<", 17, 25, 56, 30},
						{"inc_precision", ">>", 17, 25, 36, 85},
						{"dec_precision", "<<", 17, 25, 36, 30},
						{"inc_1h_spec", ">>", 17, 25, 16, 85},
						{"dec_1h_spec", "<<", 17, 25, 16, 30},
						{"inc_2h_spec", ">>", 17, 25, -4, 85},
						{"dec_2h_spec", "<<", 17, 25, -4, 30},
						{"inc_dw_spec", ">>", 17, 25, -24, 85},
						{"dec_dw_spec", "<<", 17, 25, -24, 30},
						{"inc_sword_spec", ">>", 17, 25, -44, 85},
						{"dec_sword_spec", "<<", 17, 25, -44, 30},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -67, 0, 12},
                            {"dagger_spec", "Dagger/Fist Spec", 17, 120, 56, -43, 12},
                            {"precision", "Precision", 17, 120, 36, -67, 12},
                            {"1h_spec", "1H Wep Spec", 17, 120, 16, -54, 12},
                            {"2h_spec", "2H Wep Spec", 17, 120, -4, -53, 12},
                            {"dw_spec", "Dual Wield Spec", 17, 120, -24, -46, 12},
                            {"sword_spec", "Sword Spec", 17, 120, -44, -59, 12},
							{"dagger_spec_value", ""..(tonumber(sel_array[1])).."/5", 17, 120, 56, 58.25, 12},
							{"precision_value", ""..(tonumber(sel_array[2])).."/3", 17, 120, 36, 58.25, 12},
							{"1h_spec_value", ""..(tonumber(sel_array[3])).."/5", 17, 120, 16, 58.25, 12},
							{"2h_spec_value", ""..(tonumber(sel_array[4])).."/3", 17, 120, -4, 58.25, 12},
							{"dw_spec_value", ""..(tonumber(sel_array[5])).."/5", 17, 120, -24, 58.25, 12},
							{"sword_spec_value", ""..(tonumber(sel_array[6])).."/5", 17, 120, -44, 58.25, 12},
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
            AA.Defense = {
                    Height = 190,
                    Width = 220,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
						{"inc_bladed_armor", ">>", 17, 25, 56, 85},
						{"dec_bladed_armor", "<<", 17, 25, 56, 30},
						{"inc_stoicism", ">>", 17, 25, 36, 85},
						{"dec_stoicism", "<<", 17, 25, 36, 30},
						{"inc_toughness", ">>", 17, 25, 16, 85},
						{"dec_toughness", "<<", 17, 25, 16, 30},
						{"inc_e4e", ">>", 17, 25, -4, 85},
						{"dec_e4e", "<<", 17, 25, -4, 30},
						{"inc_spell_deflection", ">>", 17, 25, -24, 85},
						{"dec_spell_deflection", "<<", 17, 25, -24, 30},
						{"inc_damage_shield", ">>", 17, 25, -44, 85},
						{"dec_damage_shield", "<<", 17, 25, -44, 30},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -67, 0, 12},
                            {"bladed_armor", "Bladed Armor", 17, 120, 56, -54, 12},
                            {"stoicism", "Stoicism", 17, 120, 36, -69.5, 12},
                            {"toughness", "Toughness", 17, 120, 16, -63, 12},
                            {"e4e", "Eye for an Eye", 17, 120, -4, -54, 12},
                            {"spell_deflection", "Spell Deflection", 17, 120, -24, -49, 12},
                            {"damage_shield", "Damage Shield", 17, 120, -44, -52, 12},
							{"bladed_armor_value", ""..(tonumber(sel_array[1])).."/2", 17, 120, 56, 58.25, 12},
							{"acclimation_value", ""..(tonumber(sel_array[2])).."/3", 17, 120, 36, 58.25, 12},
							{"toughness_value", ""..(tonumber(sel_array[3])).."/5", 17, 120, 16, 58.25, 12},
							{"e4e_value", ""..(tonumber(sel_array[4])).."/2", 17, 120, -4, 58.25, 12},
							{"spell_deflect_value", ""..(tonumber(sel_array[5])).."/3", 17, 120, -24, 58.25, 12},
							{"damage_shield_value", ""..(tonumber(sel_array[6])).."/2", 17, 120, -44, 58.25, 12},
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
            AA.Berserking = {
                    Height = 190,
                    Width = 220,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
						{"inc_flurry", ">>", 17, 25, 56, 85},
						{"dec_flurry", "<<", 17, 25, 56, 30},
						{"inc_vitality", ">>", 17, 25, 36, 85},
						{"dec_vitality", "<<", 17, 25, 36, 30},
						{"inc_vigor", ">>", 17, 25, 16, 85},
						{"dec_vigor", "<<", 17, 25, 16, 30},
						{"inc_combat_potency", ">>", 17, 25, -4, 85},
						{"dec_combat_potency", "<<", 17, 25, -4, 30},
						{"inc_focused_attacks", ">>", 17, 25, -24, 85},
						{"dec_focused_attacks", "<<", 17, 25, -24, 30},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -67, 0, 12},
                            {"flurry", "Flurry", 17, 120, 56, -43, 12},
                            {"vitality", "Vitality", 17, 120, 36, -67, 12},
                            {"vigor", "Vigor", 17, 120, 16, -54, 12},
                            {"combat_potency", "Combat Potency", 17, 120, -4, -53, 12},
                            {"focused_attacks", "Focused Attacks", 17, 120, -24, -46, 12},
							{"flurry_value", ""..(tonumber(sel_array[1])).."/5", 17, 120, 56, 58.25, 12},
							{"vitality_value", ""..(tonumber(sel_array[2])).."/3", 17, 120, 36, 58.25, 12},
							{"vigor_value", ""..(tonumber(sel_array[3])).."/5", 17, 120, 16, 58.25, 12},
							{"combat_potency_value", ""..(tonumber(sel_array[4])).."/3", 17, 120, -4, 58.25, 12},
							{"focused_attacks_value", ""..(tonumber(sel_array[5])).."/5", 17, 120, -24, 58.25, 12},
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			AA.Companionship = {
                    Height = 190,
                    Width = 220,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
						{"inc_ferocity", ">>", 17, 25, 56, 85},
						{"dec_ferocity", "<<", 17, 25, 56, 30},
						{"inc_frenzy", ">>", 17, 25, 36, 85},
						{"dec_frenzy", "<<", 17, 25, 36, 30},
						{"inc_kindred_spirits", ">>", 17, 25, 16, 85},
						{"dec_kindred_spirits", "<<", 17, 25, 16, 30},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -67, 0, 12},
                            {"ferocity", "Ferocity", 17, 120, 56, -43, 12},
                            {"frenzy", "Frenzy", 17, 120, 36, -67, 12},
                            {"kindred_spirits", "Kindred Spirits", 17, 120, 16, -54, 12},
							{"ferocity_value", ""..(tonumber(sel_array[1])).."/5", 17, 120, 56, 58.25, 12},
							{"frenzy_value", ""..(tonumber(sel_array[2])).."/3", 17, 120, 36, 58.25, 12},
							{"kindred_spirits_value", ""..(tonumber(sel_array[3])).."/5", 17, 120, 16, 58.25, 12},
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Sharpshooting = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"lethal_shots", "Lethal Shots", 17, 120, 83, 0},
                            {"master_tactician", "Master Tactician", 17, 120, 63, 0},
                            {"wild_quiver", "Wild Quiver", 17, 120, 43, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Shamanism = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"natures_grace", "Nature's Grace", 17, 120, 83, 0},
                            {"astral_shift", "Astral Shift", 17, 120, 63, 0},
                            {"call_of_thunder", "Call of Thunder", 17, 120, 43, 0},
                            {"elemental_devastation", "Devastation", 17, 120, 23, 0},
                            {"lightning_overload", "Lightning Overload", 17, 120, 3, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Magicka = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"arcane_fortitude", "Arcane Fortitude", 17, 120, 83, 0},
                            {"fire_power", "Fire Power", 17, 120, 63, 0},
                            {"ice_shards", "Ice Shards", 17, 120, 43, 0},
                            {"mind_mastery", "Mind Mastery", 17, 120, 23, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Righteousness = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"pure_of_heart", "Pure of Heart", 17, 120, 83, 0},
                            {"healing_focus", "Healing Focus", 17, 120, 63, 0},
                            {"test_of_faith", "Test of Faith", 17, 120, 43, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Blighting = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"demonic_power", "Demonic Power", 17, 120, 83, 0},
                            {"demonic_pact", "Demonic Pact", 17, 120, 63, 0},
                            {"unholy_power", "Unholy Power", 17, 120, 43, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
			
			AA.Stealth = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"camouflage", "Camouflage", 17, 120, 83, 0},
                            {"master_of_subtlety", "Master of Subtlety", 17, 120, 63, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
           
			AA.Camouflage = {
                    Height = 250,
                    Width = 190,
                    Buttons = {
                     -- {"ButtonName", "ButtonText", Height, Width, YOffset, XOffset}
                            {"werks", "werks", 17, 120, 83, 0},
                    },
                    EditBoxes = {
                     -- {"EditBoxName", "HoverText", Height, Width, YOffset, XOffset}
                            --{"wexvalue", "Input Wex Essences to dedicate to your spell here.", 15, 100, 20, 3},
                    },
                    TextBoxes = {
                     -- {"TextBoxName", "Text", Height, Width, YOffset, XOffset, TextHeight}
							{"testing", "Available AA Points: "..points.."", 15, 185, -100, 0, 12}
                    },
                    StatusLinks = {
                     -- {"EditBoxName", "ButtonName"}
                    };
            }
		   
            if AA[Type] == nil then
                    Player:SendBroadcastMessage("The "..Type.." button has not yet been coded!")
                    return
            else
                    -- [[ RENDER WINDOW ]]
                    local Frame = CreateFrame(AA.Prefix..Type.."SelectFrame")
                   
                    Frame:SetText(Type)
                    Frame:SetCantMove(false)
                    Frame:SetHeight(AA[Type]["Height"])
                    Frame:SetWidth(AA[Type]["Width"])
                   
                    -- [[ RENDER BUTTONS ]]
                    for k, v in pairs(AA[Type]["Buttons"]) do
                            if Button then
                                    print("True")
                            end
                            local Button = Frame:CreateButton(AA.Prefix..Type..v[1])
                           
                            Button:SetText(v[2])
                            Button:SetHeight(v[3])
                            Button:SetWidth(v[4])
                            Button:SetYOffset(v[5])
                            Button:SetXOffset(v[6])
                           
                            -- [[ HANDLE ONCLICK EVENT ]]
                            Button:SetEvent("OnClick", function(self, event, Player, Cache)
                                    AA.HandleOnClick(Player, Type, Frame, v[1], Cache, Button)
                            end)
                    end
                   
                    -- [[ RENDER TEXT BOXES ]]
                    for k, v in pairs(AA[Type]["TextBoxes"]) do
                            local TextBox = Frame:CreateTextBox(AA.Prefix..Type..v[1])
                           
                            TextBox:SetText(v[2])
                            TextBox:SetHeight(v[3])
                            TextBox:SetWidth(v[4])
                            TextBox:SetYOffset(v[5])
                            TextBox:SetXOffset(v[6])
                            TextBox:SetTextHeight(v[7])
                    end
                   
                    -- [[ RENDER EDIT BOXES ]]
                    for k, v in pairs(AA[Type]["EditBoxes"]) do
                            local EditBox = Frame:CreateEditBox(AA.Prefix..Type..v[1])
                           
                            EditBox:SetTooltip(v[2])
                            EditBox:SetHeight(v[3])
                            EditBox:SetWidth(v[4])
                            EditBox:SetYOffset(v[5])
                            EditBox:SetXOffset(v[6])
                   
                            -- [[ CREATE STATUSLINK ]]
                            for key, link in pairs(AA[Type]["StatusLinks"]) do
                                    if(v[1] == link[1]) then
                                            EditBox:SetStatusLink(AA.Prefix..Type..link[2])
                                    end
                            end
                    end
                   
                    Frame:Send(Player)
            end
    end
     
    function AA.HandleOnClick(Player, Type, Frame, Button, Cache)
            if(Type == "Weaponmastery") then
                    if(Button == "inc_daggerspec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[1])+1
						if (newvalue<=5) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=1")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dagger Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(13706, Player)
							elseif (newvalue==2) then
								Player:AddAura(13804, Player)
							elseif (newvalue==3) then
								Player:AddAura(13805, Player)
							elseif (newvalue==4) then
								Player:AddAura(13806, Player)
							elseif (newvalue==5) then
								Player:AddAura(13807, Player)
							end
							sel_array[1]=(sel_array[1])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_daggerspec") then
						local newvalue = (sel_array[1])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=1")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dagger Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(13706, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(13804, Player)
								Player:AddAura(13706, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(13805, Player)
								Player:AddAura(13804, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(13806, Player)
								Player:AddAura(13805, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(13807, Player)
								Player:AddAura(13806, Player)
							end
							sel_array[1]=(sel_array[1])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_precision") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[2])+1
						if (newvalue<=3) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=2")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Precision has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(29590, Player)
							elseif (newvalue==2) then
								Player:AddAura(29591, Player)
							elseif (newvalue==3) then
								Player:AddAura(29592, Player)
							end
							sel_array[2]=(sel_array[2])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_precision") then
						local newvalue = (sel_array[2])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=2")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Precision has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(29590, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(29591, Player)
								Player:AddAura(29590, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(29592, Player)
								Player:AddAura(29591, Player)
							end
							sel_array[2]=(sel_array[2])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_1h_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[3])+1
						if (newvalue<=5) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=3")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of One-Handed Weapon Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(16538, Player)
							elseif (newvalue==2) then
								Player:AddAura(16539, Player)
							elseif (newvalue==3) then
								Player:AddAura(16540, Player)
							elseif (newvalue==4) then
								Player:AddAura(16541, Player)
							elseif (newvalue==5) then
								Player:AddAura(16542, Player)
							end
							sel_array[3]=(sel_array[3])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_1h_spec") then
						local newvalue = (sel_array[3])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=3")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of One-Handed Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(16538, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(16539, Player)
								Player:AddAura(16538, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(16540, Player)
								Player:AddAura(16539, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(16541, Player)
								Player:AddAura(16540, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(16542, Player)
								Player:AddAura(16541, Player)
							end
							sel_array[3]=(sel_array[3])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_2h_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[4])+1
						if (newvalue<=3) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=4")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Two-Handed Weapon Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(20111, Player)
							elseif (newvalue==2) then
								Player:AddAura(20112, Player)
							elseif (newvalue==3) then
								Player:AddAura(20113, Player)
							end
							sel_array[4]=(sel_array[4])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_2h_spec") then
						local newvalue = (sel_array[4])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=4")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Two-Handed Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(20111, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(20112, Player)
								Player:AddAura(20111, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(20113, Player)
								Player:AddAura(20112, Player)
							end
							sel_array[4]=(sel_array[4])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_dw_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[5])+1
							if (newvalue<=5) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=5")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Dual Wield Specialization has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(13715, Player)
								elseif (newvalue==2) then
									Player:AddAura(13848, Player)
								elseif (newvalue==3) then
									Player:AddAura(13849, Player)
								elseif (newvalue==4) then
									Player:AddAura(13851, Player)
								elseif (newvalue==5) then
									Player:AddAura(13852, Player)
							end
							sel_array[5]=(sel_array[5])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
					elseif(Button == "dec_dw_spec") then
						local newvalue = (sel_array[5])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=5")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dual Wield Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(13715, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(13848, Player)
								Player:AddAura(13715, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(13849, Player)
								Player:AddAura(13848, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(13851, Player)
								Player:AddAura(13849, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(13852, Player)
								Player:AddAura(13851, Player)
							end
							sel_array[5]=(sel_array[5])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_sword_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[6])+1
							if (newvalue<=5) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=6")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Sword Specialization has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(12281, Player)
								elseif (newvalue==2) then
									Player:AddAura(12812, Player)
								elseif (newvalue==3) then
									Player:AddAura(12813, Player)
								elseif (newvalue==4) then
									Player:AddAura(12814, Player)
								elseif (newvalue==5) then
									Player:AddAura(12815, Player)
							end
							sel_array[6]=(sel_array[6])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_sword_spec") then
						local newvalue = (sel_array[6])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=6")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(12281, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(12812, Player)
								Player:AddAura(12281, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(12813, Player)
								Player:AddAura(12812, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(12814, Player)
								Player:AddAura(12813, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(12815, Player)
								Player:AddAura(12814, Player)
							end
							sel_array[6]=(sel_array[6])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					end
                end
			if(Type == "Defense") then
				if(Button == "inc_bladed_armor") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[1])+1
							if (newvalue<=2) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=1")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Bladed Armor has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(48978, Player)
								elseif (newvalue==2) then
									Player:AddAura(49390, Player)
								end
								sel_array[1]=(sel_array[1])+1
								points=(points)-1
								Frame:Hide(Player)
								AA.RenderSubMenu(Player, Type)
							else
								Player:SendBroadcastMessage("This skill is at its maximum value!")
							end
						end
					end
				    elseif(Button == "dec_bladed_armor") then
						local newvalue = (sel_array[1])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=1")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Bladed Armor has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(48978, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(49390, Player)
								Player:AddAura(48978, Player)
							end
							sel_array[1]=(sel_array[1])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					end
					if(Button == "inc_stoicism") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[2])+1
							if (newvalue<=3) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=2")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Stoicism has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(31844, Player)
								elseif (newvalue==2) then
									Player:AddAura(31845, Player)
								elseif (newvalue==3) then
									Player:AddAura(53519, Player)
								end
								sel_array[2]=(sel_array[2])+1
								points=(points)-1
								Frame:Hide(Player)
								AA.RenderSubMenu(Player, Type)
							else
								Player:SendBroadcastMessage("This skill is at its maximum value!")
							end
						end
					end
				    elseif(Button == "dec_stoicism") then
						local newvalue = (sel_array[2])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=2")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Stoicism has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(31844, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(31845, Player)
								Player:AddAura(31844, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(53519, Player)
								Player:AddAura(31845, Player)
							end
							sel_array[2]=(sel_array[2])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					end
					if(Button == "inc_toughness") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[3])+1
							if (newvalue<=5) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=3")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Toughness has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(16252, Player)
								elseif (newvalue==2) then
									Player:AddAura(16306, Player)
								elseif (newvalue==3) then
									Player:AddAura(16307, Player)
								elseif (newvalue==4) then
									Player:AddAura(16308, Player)
								elseif (newvalue==5) then
									Player:AddAura(16309, Player)
								end
								sel_array[3]=(sel_array[3])+1
								points=(points)-1
								Frame:Hide(Player)
								AA.RenderSubMenu(Player, Type)
							else
								Player:SendBroadcastMessage("This skill is at its maximum value!")
							end
						end
					end
				    elseif(Button == "dec_toughness") then
						local newvalue = (sel_array[3])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=3")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Toughness has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(16252, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(16306, Player)
								Player:AddAura(16252, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(16307, Player)
								Player:AddAura(16306, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(16308, Player)
								Player:AddAura(16307, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(16309, Player)
								Player:AddAura(16308, Player)
							end
							sel_array[3]=(sel_array[3])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					elseif(Button == "inc_e4e") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[4])+1
							if (newvalue<=2) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=4")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Eye for an Eye has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(9799, Player)
								elseif (newvalue==2) then
									Player:AddAura(25988, Player)
								end
								sel_array[4]=(sel_array[4])+1
								points=(points)-1
								Frame:Hide(Player)
								AA.RenderSubMenu(Player, Type)
							else
								Player:SendBroadcastMessage("This skill is at its maximum value!")
							end
						end
					end
				    elseif(Button == "dec_e4e") then
						local newvalue = (sel_array[4])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=5")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Eye for an Eye has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(9799, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(25988, Player)
								Player:AddAura(9799, Player)
							end
							sel_array[4]=(sel_array[4])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					elseif(Button == "inc_spell_deflection") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[5])+1
							if (newvalue<=3) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=5")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Spell Deflection has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(49145, Player)
								elseif (newvalue==2) then
									Player:AddAura(49495, Player)
								elseif (newvalue==3) then
									Player:AddAura(49497, Player)
								end
								sel_array[5]=(sel_array[5])+1
								points=(points)-1
								Frame:Hide(Player)
								AA.RenderSubMenu(Player, Type)
							else
								Player:SendBroadcastMessage("This skill is at its maximum value!")
							end
						end
					end
				    elseif(Button == "dec_spell_deflection") then
						local newvalue = (sel_array[5])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=2 AND selection=5")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Spell Deflection has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(49145, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(49495, Player)
								Player:AddAura(49145, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(49497, Player)
								Player:AddAura(49495, Player)
							end
							sel_array[5]=(sel_array[5])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					end
				end
            if(Type == "Berserking") then
                    if(Button == "inc_daggerspec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[1])+1
						if (newvalue<=5) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=1")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dagger Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(13706, Player)
							elseif (newvalue==2) then
								Player:AddAura(13804, Player)
							elseif (newvalue==3) then
								Player:AddAura(13805, Player)
							elseif (newvalue==4) then
								Player:AddAura(13806, Player)
							elseif (newvalue==5) then
								Player:AddAura(13807, Player)
							end
							sel_array[1]=(sel_array[1])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_daggerspec") then
						local newvalue = (sel_array[1])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=1")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dagger Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(13706, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(13804, Player)
								Player:AddAura(13706, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(13805, Player)
								Player:AddAura(13804, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(13806, Player)
								Player:AddAura(13805, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(13807, Player)
								Player:AddAura(13806, Player)
							end
							sel_array[1]=(sel_array[1])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_precision") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[2])+1
						if (newvalue<=3) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=2")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Precision has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(29590, Player)
							elseif (newvalue==2) then
								Player:AddAura(29591, Player)
							elseif (newvalue==3) then
								Player:AddAura(29592, Player)
							end
							sel_array[2]=(sel_array[2])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_precision") then
						local newvalue = (sel_array[2])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=2")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Precision has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(29590, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(29591, Player)
								Player:AddAura(29590, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(29592, Player)
								Player:AddAura(29591, Player)
							end
							sel_array[2]=(sel_array[2])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_1h_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[3])+1
						if (newvalue<=5) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=3")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of One-Handed Weapon Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(16538, Player)
							elseif (newvalue==2) then
								Player:AddAura(16539, Player)
							elseif (newvalue==3) then
								Player:AddAura(16540, Player)
							elseif (newvalue==4) then
								Player:AddAura(16541, Player)
							elseif (newvalue==5) then
								Player:AddAura(16542, Player)
							end
							sel_array[3]=(sel_array[3])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_1h_spec") then
						local newvalue = (sel_array[3])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=3")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of One-Handed Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(16538, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(16539, Player)
								Player:AddAura(16538, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(16540, Player)
								Player:AddAura(16539, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(16541, Player)
								Player:AddAura(16540, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(16542, Player)
								Player:AddAura(16541, Player)
							end
							sel_array[3]=(sel_array[3])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_2h_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
						Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
						local newvalue = (sel_array[4])+1
						if (newvalue<=3) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=4")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Two-Handed Weapon Specialization has been increased to "..newvalue..".")
							if (newvalue==1) then
								Player:AddAura(20111, Player)
							elseif (newvalue==2) then
								Player:AddAura(20112, Player)
							elseif (newvalue==3) then
								Player:AddAura(20113, Player)
							end
							sel_array[4]=(sel_array[4])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_2h_spec") then
						local newvalue = (sel_array[4])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=4")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Two-Handed Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(20111, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(20112, Player)
								Player:AddAura(20111, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(20113, Player)
								Player:AddAura(20112, Player)
							end
							sel_array[4]=(sel_array[4])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_dw_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[5])+1
							if (newvalue<=5) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=5")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Dual Wield Specialization has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(13715, Player)
								elseif (newvalue==2) then
									Player:AddAura(13848, Player)
								elseif (newvalue==3) then
									Player:AddAura(13849, Player)
								elseif (newvalue==4) then
									Player:AddAura(13851, Player)
								elseif (newvalue==5) then
									Player:AddAura(13852, Player)
							end
							sel_array[5]=(sel_array[5])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
					elseif(Button == "dec_dw_spec") then
						local newvalue = (sel_array[5])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=5")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Dual Wield Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(13715, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(13848, Player)
								Player:AddAura(13715, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(13849, Player)
								Player:AddAura(13848, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(13851, Player)
								Player:AddAura(13849, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(13852, Player)
								Player:AddAura(13851, Player)
							end
							sel_array[5]=(sel_array[5])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
                    elseif(Button == "inc_sword_spec") then
						local maxpointsdb = CharDBQuery("SELECT points FROM shard_aa_allocation WHERE playerguid="..Player:GetGUIDLow().."")
						spentpoints = 0
						repeat
							local pointrow = maxpointsdb:GetUInt32(0)
							spentpoints = (spentpoints+pointrow)
						until not maxpointsdb:NextRow()
						if (spentpoints>=45) then
							Player:SendBroadcastMessage("You already have 45 Alternate Advancement points allocated!")
						else
						if (points<=0) then
							Player:SendBroadcastMessage("You have no Alternate Advancement points!")
						else
							local newvalue = (sel_array[6])+1
							if (newvalue<=5) then
								CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=6")
								CharDBExecute("UPDATE shard_aa_points SET points="..((points)-1).." WHERE playerguid="..Player:GetGUIDLow().."")
								Player:SendBroadcastMessage("Your rank of Sword Specialization has been increased to "..newvalue..".")
								if (newvalue==1) then
									Player:AddAura(12281, Player)
								elseif (newvalue==2) then
									Player:AddAura(12812, Player)
								elseif (newvalue==3) then
									Player:AddAura(12813, Player)
								elseif (newvalue==4) then
									Player:AddAura(12814, Player)
								elseif (newvalue==5) then
									Player:AddAura(12815, Player)
							end
							sel_array[6]=(sel_array[6])+1
							points=(points)-1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill is at its maximum value!")
						end
					end
					end
                    elseif(Button == "dec_sword_spec") then
						local newvalue = (sel_array[6])-1
						if (newvalue>=0) then
							CharDBExecute("UPDATE shard_aa_allocation SET points="..newvalue.." WHERE playerguid="..Player:GetGUIDLow().." AND category=1 AND selection=6")
							CharDBExecute("UPDATE shard_aa_points SET points="..((points)+1).." WHERE playerguid="..Player:GetGUIDLow().."")
							Player:SendBroadcastMessage("Your rank of Sword Specialization has been decreased to "..newvalue..".")
							if (newvalue==0) then
								Player:RemoveAura(12281, Player)
							elseif (newvalue==1) then
								Player:RemoveAura(12812, Player)
								Player:AddAura(12281, Player)
							elseif (newvalue==2) then
								Player:RemoveAura(12813, Player)
								Player:AddAura(12812, Player)
							elseif (newvalue==3) then
								Player:RemoveAura(12814, Player)
								Player:AddAura(12813, Player)
							elseif (newvalue==4) then
								Player:RemoveAura(12815, Player)
								Player:AddAura(12814, Player)
							end
							sel_array[6]=(sel_array[6])-1
							points=(points)+1
							Frame:Hide(Player)
							AA.RenderSubMenu(Player, Type)
						else
							Player:SendBroadcastMessage("This skill as its minimum value!")
						end
					end
                end
            if(Button == "BackButton") then
                    AA.RenderMainMenu(Player)
                    Frame:Hide(Player)
            end
end

