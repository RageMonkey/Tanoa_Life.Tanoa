/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_RoT_money < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];

if((player getVariable ["missingOrgan",FALSE]) && side player != civilian) then { 
	player setVariable["missingOrgan",FALSE,TRUE]; // Give Back Organs
	hint format["That will be $50,000 for the organ transplant"];
	life_RoT_money = life_RoT_money - 50000; 
	[8] call SOCK_fnc_updatePartial;
} else {
	life_RoT_money = life_RoT_money - 100;
};
[6] call SOCK_fnc_updatePartial;
player setdamage 0;




