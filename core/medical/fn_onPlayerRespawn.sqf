/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse","_handle"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;
_unit enableFatigue false;

//Comment this code out if you want them to keep the weapon on the ground.
//private["_containers"];
//_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
//{deleteVehicle _x;} foreach _containers; //Delete the containers.

life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_RoT_money = 0; //Make sure we don't get our cash back.

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["surrender",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["hostage",FALSE,TRUE];
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.

//Kill Confirmed
_unit setVariable["killConfirmed",FALSE,TRUE];

//Missing Organ
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
_unit setVariable["hasOrgan",FALSE,TRUE];
[8] call SOCK_fnc_updatePartial; 

//Slave
_unit setVariable["enslaved",FALSE,TRUE];
life_enslaved = false;
[10] call SOCK_fnc_updatePartial;

life_istazed = false;
life_istranq = false;
//Load our gear as a cop incase something horrible happens
if(playerSide == west) then {
	_handle = [] spawn life_fnc_loadGear;
	waitUntil {scriptDone _handle};
};

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[] call life_fnc_equipGear;
[[_unit,life_sidechat,playerSide,license_civ_rebel],"TON_fnc_managesc",false,false] spawn life_fnc_MP;