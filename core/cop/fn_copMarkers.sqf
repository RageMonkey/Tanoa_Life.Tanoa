/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_ems","_jailed"];
_markers = [];
_cops = [];
_ems = [];
_jailed = [];

sleep 0.5;
if(visibleMap) then {
	{
		if(side _x == west) then {_cops pushBack _x;}
		else { 
			if(side _x == independent) then {_ems pushBack _x;}
			else { 
				if(uniform _x == "U_B_HeliPilotCoveralls") then {_jailed pushBack _x;}; 
			};
		};
	} foreach playableUnits; //Fetch list of cops and people wearing jail uniform
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["[Cop] %1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _cops;
	
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["[EMS] %1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _ems;
	
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["[Jailed] %1", _x getVariable["realname", name _x]];
		
		_markers pushBack [_marker, _x];
		
	} foreach _jailed;
		
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
	_cops = [];
	_ems = [];
	_jailed = [];
};