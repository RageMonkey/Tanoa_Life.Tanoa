/*
	File: fn_startRangeGame.sqf
	Author: RageMonkey
	Based on scripts by SPC.MOOSE
	
	Description:
	Range Game Start
*/ 
 
 
private["_range","_mode","_sleepTimer","_obj","_inc","_count","_many","_targets","_rnumber","_rtarget","_timerModifer"];

if(playerSide == civilian && !license_civ_rifle) exitWith {hint "You must have a Rifle license to use the range!";};

life_is_usingRange = true;

_obj = [];
_obj = _this select 3; 

_range = [_obj,0,"",[""]] call BIS_fnc_param;
_mode = [_obj,1,"",[""]] call BIS_fnc_param;

_timerModifer = 0;
switch (_range) do
{
	case "pistol": {_targets = life_trn_h; _timerModifer = 4;};
	case "rifle": {_targets = life_trn_r;}; 
	case "sniper": {_targets = life_trn_s;}; 
};

_sleepTimer = 1;
switch (_mode) do
{
	case "easy": {_sleepTimer = 10 - _timerModifer;}; 
	case "medium": {_sleepTimer = 8 - _timerModifer;}; 
	case "hard": {_sleepTimer = 6 - _timerModifer;}; 
};
		
[player,"beepstart"] call life_fnc_globalSound;
 
_inc     = 0;
_count   = 0;

_many    =  count _targets;
nopop=true;
{_x  animate["terc",1]} forEach _targets;

hint "Setting up the Range";
sleep 2;
hint "Standby";
sleep 2;
hint "Begin";

while {_inc<20} do 
{
_rnumber = floor(random _many);
_rtarget = _targets select _rnumber;
_rtarget animate["terc", 0];
sleep _sleepTimer;
if (_rtarget animationPhase "terc" > 0.1) then
{
	_count = _count+1;
};
   hint format ["Targets :%1 Hit :%2",_inc+1,_count];
_rtarget animate["terc", 1];
_inc = _inc + 1;
};
sleep 8;
hint "Session Complete";
[[0,format[localize "STR_TRN_Range",player getVariable["realname",name player],[_count] call life_fnc_numberText, _range, _mode]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

life_is_usingRange = false;