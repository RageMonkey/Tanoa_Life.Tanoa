/*
	File: fn_addKeys
	Author: Dexter
	Link: http://www.altisliferpg.com/topic/4055-tutorial-adding-keys-back-to-the-player/
 
	Description:
	Adds keys back to the player after relogging/death/disconnect
*/
 
private["_allVeh","_pUID"];
 
sleep 5;
 
_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
_name = name player;
 
{
	_owners = _x getVariable ["vehicle_info_owners",[]];
	_index = [_name,_owners] call TON_fnc_index;
	if(!(_index == -1)) then {
		life_vehicles set[count life_vehicles, _x];
	};	
} foreach _allVeh;

