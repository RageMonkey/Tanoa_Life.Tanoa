/*
	File: fn_getoutofSlavery.sqf
	@Foamy
	www.strainonline.com	
	Description:
	Gets the player out of Slavery.
*/
#include <macro.h>

if(life_inv_cigarette != 10) exitWith {hint "Learn to count! Roll 10 Cigars!"};
if(life_inv_cigarette == 10) then 
{
	[false,"cigarette",10] call life_fnc_handleInv;
	
	
	if(playerSide == west) then 
	{
		player setPos (getMarkerPos "slave_cop_respawn");
	} else {
		player setPos (getMarkerPos "slave_civ_respawn");
	};
	
	slave_task1 setTaskState "You have won your freedom!";
	player removeSimpleTask slave_task1;
	
	//["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
	
	//Slave
	[10] call SOCK_fnc_updatePartial;
};
life_enslaved = false;
player setVariable["enslaved",true,true];
sleep (30 * 60);
player setVariable["enslaved",false,true];
hint "Watch out! You can be enslaved again!";