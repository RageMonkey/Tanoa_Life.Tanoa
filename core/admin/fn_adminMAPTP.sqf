#include <macro.h>

/*
	File: fn_adminMAPTP.sqf
	Author: soh

	Description:
	Teleports the admin to the first clicked map location.
*/
private["_ported"];

if ( life_teleport_admin_lvl > __GETC__(life_adminlevel) ) then { hint "Insufficient Admin Level MAPTP";}

else
{
[[getPlayerUID player,name player, "Map TP",position player,""],"TON_fnc_logInReport",false,false] spawn life_fnc_MP;
closeDialog 0;
sleep 0.25;
closeDialog 0;
hint "Left click on map. DON'T CLICK OVER WATER!";
onMapSingleClick "(vehicle player) setPos _pos; _ported = true; true; onMapSingleClick """";";

if ( !visibleMap ) then { openMap true;};
_ported = false;



waitUntil { (_ported or !visibleMap) };
if ( !visibleMap ) then { hint "Canceled MAPTP";};
};
