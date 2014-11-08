local NPC_ID = 6491
 
function Gossip(event, plr, unit)
	 plr:ResurrectPlayer(100, false)
	 plr:Teleport(1, 5237.72, -1220.78, 1376.28, 4)
end
 
RegisterCreatureGossipEvent(NPC_ID, 1, Gossip)