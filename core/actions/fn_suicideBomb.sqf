/*
	File: fn_suicideBomb.sqf
	
	Description:
	Sets off the suicide bomb with a delay of 10seconds.
*/
private["_test","_i"];

life_isSuiciding = true;

if(vest player != "V_HarnessOGL_brn") exitWith {life_isSuiciding = false;};

_test = for "_i" from 1 to 3 do {"Bo_GBU12_LGB" createVehicle [0,0,9999];};
_test setPos (getPos player);
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

//Remove the vest to prevent multi usage
removeVest player;

life_isSuiciding = false;

[[0,format["%1 has set off their suicide vest.",player getVariable["realname",name player]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;