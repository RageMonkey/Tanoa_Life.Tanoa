#include <macro.h>
/*
	File: fn_skyDive.sqf
	Author: blaster
	Edited by Demigod
	Concepts pulled from: Mokomoko http://www.altisliferpg.com/topic/1938-document-server-commands/
	
	
	Description:
	Sky diving, with a random coloured smoke that deploys once chute is pulled.
*/
private ["_num","_color","_action","_price"];
if(playerSide != civilian) exitWith {hint "You must be off duty to Skydive.";};
_price = 5000;
if(life_RoT_money < _price) exitWith {hint "You don't have enough money!";};

_action = [
	"WARNING -Skydiving will delete your backpack, continue?",
	"WARNING",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(_action) then {

life_RoT_money = life_RoT_money - _price;

player say3D "SkyDiving";

"colorCorrections" ppEffectEnable true; 
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,0], [1,1,1,1]]; 
"colorCorrections" ppEffectCommit 1;

sleep 5;
player addBackpack "B_Parachute"; 
player setPos [getPos player select 0, getPos player select 1, 1000]; //1000 m. up
sleep 3;
"colorCorrections" ppEffectEnable false; 

waitUntil {(vehicle player != player)};	


	_num = floor(random 7);
	
_color = switch (_num) do {
	case 0: {"SmokeShell";};
	case 1: {"SmokeShellGreen";};
	case 2: {"SmokeShellRed";};
	case 3: {"SmokeShellBlue";};
	case 4: {"SmokeShellOrange";};
	case 5: {"SmokeShellYellow";};
	case 6: {"SmokeShellPurple";};
};

_smoke = _color createVehicle position player;
_smoke attachTo [vehicle player, [0,-0.1,1.5]]; 
		
} else {
			hint"Thanks for nothing, move along";
};