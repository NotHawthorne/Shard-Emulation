local gameobject_ID = 0

function OnUse (pUnit, Event, pMisc)
	Event:AddItem(818013, 1)
	pMisc:Despawn(0)
	Event:SendBroadcastMessage("You pick up the blade, and a surge of power courses through you as you place it into your pack.")
end

--RegisterGameObjectGossipEvent (gameobject_ID, 1, OnUse)