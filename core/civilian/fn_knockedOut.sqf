/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
if(!isNil "godmode" && godmode == 1) exitWith {};
titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 15;

//If a player is a hostage then dont queue animation or it will interupt restrain
if (!(player getVariable["hostage",false])) then
{
	player playMoveNow "amovppnemstpsraswrfldnon";
};

detach player;
deleteVehicle _obj;

//Removed Ability to Shift G people to get out of restraints as it was interrupting the Shift G Civ Restrain
//if(player getVariable["restrained",FALSE]) then {
//	[player] call life_fnc_unrestrain;
//	player setVariable["ziptied",FALSE,TRUE];
//};
player setVariable["robbed",FALSE,TRUE];