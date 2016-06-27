/*
	File: fn_startRangeGame.sqf
	Author: RageMonkey
	Based on scripts by SPC.MOOSE
	
	Description:
	Range Game Reset
*/ 
 
private["_range","_fronts"];

if(playerSide == civilian && !license_civ_rifle) exitWith {hint "You must have a Rifle license to use the range!";};

_range = [_this,3,"",[""]] call BIS_fnc_param;

switch (_range) do
{
	case "rifle": {_fronts = life_trn_r;}; 
	case "sniper": {_fronts = life_trn_s;}; 
	case "pistol": {_fronts = life_trn_h;}; 
};

{_x  animate["terc",0]} forEach _fronts;