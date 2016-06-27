#include <macro.h>
/*
	File: fn_addBasetoLocal.sqf
	Author: RageMonkey
	
	Description:
	Update Client with new Base
	
*/

private["_gangId","_markerName","_gangBaseBillBoard","_logo"];

_markerName = _this select 0;
_gangId = _this select 1;
_logo = _this select 2;

life_owned_bases pushback _markerName;

if (_gangId == (group player) getVariable "gang_id") then {
	life_player_bases pushback _markerName;
};

_gangBaseBillBoard = missionNamespace getVariable [_markerName + "_billboard" , objNull];
_gangBaseBillBoard setObjectTexture [0, "textures\civ\gang\" + _logo];

