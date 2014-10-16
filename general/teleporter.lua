local NPC_ID = 818020
 
function Gossip(event, plr, unit)
    if plr:IsInCombat() then 
        plr:SendBroadcastMessage("You are in combat!")
        plr:GossipComplete()
    else
        plr:GossipMenuAddItem(1, "Take me to Snowdrift Peak.", 0, 1)
		plr:GossipMenuAddItem(1, "Take me to Bandle City.", 0, 2)
		plr:GossipMenuAddItem(1, "Take me to Lakeshire.", 0, 3)
        plr:GossipSendMenu(1, unit)
    end
	if (plr:GetClass()==1) then
		plr:LearnSpell(818019)
		plr:LearnSpell(818020)
		plr:LearnSpell(818050)
		plr:SendBroadcastMessage("Custom Barbarian spells learned!")
	end
end

function Gossip_Select(event, player, unit, sender, intid, code)
	if (intid == 1) then --Scar
        player:Teleport(1, 5237.72, -1220.78, 1376.28, 4)
    end
    if (intid == 2) then --Scar
        player:Teleport(1, 7638, -4016, 704.17, 0.48)
	end
    if (intid == 3) then --Scar
        player:Teleport(0, -9233.42, -2047.31, 77.49, 3.9)
	end
end
 
RegisterCreatureGossipEvent(NPC_ID, 1, Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, Gossip_Select)