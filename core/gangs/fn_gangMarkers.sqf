#include <macro.h>
/*
	File: fn_gangMarkers.sqf
	Author: Siro @ LinkD.Gaming
	Edited by: Spadge
*/
private["_markers","_gangMembers"];
_markers = [];
_gangMembers = [];
_ems = [];

sleep 0.5;
if(visibleMap) then {
	_gangMembers = units grpPlayer;
	{
		if(side _x == independent) then {_ems pushBack _x;}
	} foreach playableUnits; //Fetch list of cops and people wearing jail uniform
	
	{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format["%1", name _x];

	_markers pushBack [_marker, _x];

	} foreach _gangMembers;
	
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["[EMS] %1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _ems;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
				_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_gangMembers = [];
	_ems = [];
};