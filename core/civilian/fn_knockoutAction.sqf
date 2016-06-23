#include <macro.h>
/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;


//Abort if Safe Zone
if ({player distance getMarkerPos (_x select 0) < _x select 1} count __GETC__(life_safe_points) > 0) exitWith {
	titleText[localize "STR_ISTR_Knockout_Safezone","PLAIN"];
};

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
sleep 0.08;
[[_target,profileName],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;

sleep 3;
life_knockout = false;