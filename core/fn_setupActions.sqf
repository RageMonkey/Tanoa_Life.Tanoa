#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//SVest.
		life_actions = life_actions + [player addAction["Activate Suicide Vest",life_fnc_suicideBomb,"",0,false,false,"",'
		vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !life_isSuiciding && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		// take them organs
		life_actions = life_actions + [player addAction["Use Scalpel to Harvest Organs",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
	
		// Sell PLayer into Slavery
		life_actions = life_actions + [player addAction["Sell Hostage",life_fnc_sellHostage,"",0,false,false,"",'  !isNull cursorTarget && isPlayer cursorTarget && (side cursorTarget != independent) && (cursorTarget getVariable ["restrained",FALSE]) && alive cursorTarget && (player distance cursorTarget < 3.5) && ((player distance (getMarkerPos "slave_trader_marker") < 10)) && !(cursorTarget getVariable ["escorting",FALSE]) ']];
		
		//Punch Balls
		life_actions = life_actions + [player addAction["Punch Balls",life_fnc_punchBallsAction,"",0,false,false,"",'
        !isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]']];
		
		//LumberJack		
		life_actions = life_actions + [player addAction["<t color='#fdff01'>Use Chainsaw</t>",life_fnc_gatherWood,"",0,false,false,"",' trees = []; {if (str _x find ": t_" > -1) then{trees pushBack _x;};} forEach nearestObjects [player, [], 8]; _dmg =[]; {if (damage _x == 0) then {_dmg pushBack _x}} forEach trees; _alivetrees = count _dmg; (_alivetrees > 0) && vehicle player == player && playerSide == civilian && !life_lumberjack && (life_inv_chainsaw > 0)']];
	};

	
	case west:
	{
		//BD MK1
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Anti-Air 'Fuel Killer'</t>",life_fnc_fireBirdDown,"BDMK1",1,false,true,"",'(!(isNull (vehicle player))) && (vehicle player) isKindOf "Air" ']];
		
		//Confirm Kill
		life_actions = life_actions + [player addAction["Confirm Kill",life_fnc_confirmKill,"",0,false,false,"",'__GETC__(life_coplevel) >= 2 && !alive cursorTarget && (player distance cursorTarget < 3.5) && cursorTarget isKindOf "Man" && !(cursorTarget getVariable["killConfirmed",FALSE])']];
	
		//Deploy Barrier
		life_actions = life_actions + [player addAction["Deploy Barrier",life_fnc_trafficItemHandler,["barrier","deploy"],0,false,false,"",'vehicle player == player && __GETC__(life_coplevel) >= 2 && life_inv_barrier > 0']];
		
		//Deploy Cone
		life_actions = life_actions + [player addAction["Deploy Cone",life_fnc_trafficItemHandler,["cone","deploy"],0,false,false,"",'vehicle player == player && __GETC__(life_coplevel) >= 2 && life_inv_cone > 0']];
	
		//Deploy Spike Strip
		life_actions = life_actions + [player addAction["Deploy Spike Strip",life_fnc_trafficItemHandler,["spikeStrip","deploy"],0,false,false,"",'isNull life_spikestrip && vehicle player == player && __GETC__(life_coplevel) >= 1 && life_inv_spikeStrip > 0']];
	
		//PickUp Barrier
		life_actions = life_actions + [player addAction["Pick Up Barrier",life_fnc_trafficItemHandler,["barrier","pickup"],0,false,false,"",'vehicle player == player && (typeof cursorTarget) == "RoadBarrier_F" && player distance cursorTarget < 3.5 && (life_carryWeight + (["cone"] call life_fnc_itemWeight)) <= life_maxWeight']];
	
		//PickUp Cone
		life_actions = life_actions + [player addAction["Pick Up Cone",life_fnc_trafficItemHandler,["cone","pickup"],0,false,false,"",'vehicle player == player && (typeof cursorTarget) == "RoadCone_F" && player distance cursorTarget < 3.5 && (life_carryWeight + (["cone"] call life_fnc_itemWeight)) <= life_maxWeight']];
		
	};
};