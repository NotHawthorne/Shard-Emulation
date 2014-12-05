local NPC_ID = 81802
 
function Gossip(event, plr, unit)
    if plr:IsInCombat() then 
        plr:SendBroadcastMessage("You are in combat!")
        plr:GossipComplete()
    else
        plr:GossipMenuAddItem(1, "I wish to be trained in the invocation of the Light's wrath. [BECOME LITURGIST]", 0, 1)
		plr:GossipMenuAddItem(1, "I hereby renounce the Light. [UNLEARN LITURGY]", 0, 2)
        plr:GossipSendMenu(1, unit)
    end
end

function Gossip_Select(event, player, unit, sender, intid, code)
	if (intid == 1) then --Learn
        player:SetSkill(789, 1, 99, 99)
        player:SetSkill(790, 1, 99, 99)
    end
    if (intid == 2) then --Unlearn
        player:SetSkill(789, 0, 0, 0)
	end
end
 
RegisterCreatureGossipEvent(NPC_ID, 1, Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, Gossip_Select)