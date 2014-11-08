local NPC_ID = 818022
 
function Gossip(event, plr, unit)
    if plr:IsInCombat() then 
        plr:SendBroadcastMessage("You are in combat!")
        plr:GossipComplete()
    else
        plr:GossipMenuAddItem(1, "Take me to ???.", 0, 1)
        plr:GossipMenuAddItem(1, "I have a gold coin I'd like to trade.", 0, 2)
        plr:GossipSendMenu(1, unit)
    end
end

function Gossip_Select(event, player, unit, sender, intid, code)
	if (intid == 1) then --Scar
		if (player:GetItemCount(767)>=1) then
			player:Teleport(1, -1422.96, 2911.49, 137.15, 4.8)
		else
			player:SendBroadcastMessage("You require ???")
		end
	end
		if (intid == 2) then --Scar
		if (player:GetItemCount(45978)>=1) then
			player:RemoveItem(45978, 1)
			player:AddItem(45624, 75)
			player:SendBroadcastMessage("Coin traded.")
		else
			player:SendBroadcastMessage("You have no gold coins.")
		end
	end
end
 
RegisterCreatureGossipEvent(NPC_ID, 1, Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, Gossip_Select)