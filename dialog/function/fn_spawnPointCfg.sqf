/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_return = [];

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		if ("cop_spawn_1" IN life_spawn_points) then {_return pushBack ["cop_spawn_1","GeorgeTown HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];};
		if ("cop_spawn_2" IN life_spawn_points) then {_return pushBack ["cop_spawn_2","LinjnHaven Police HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];};
		if ("cop_spawn_3" IN life_spawn_points) then {_return pushBack ["cop_spawn_3","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];};
		//if ("cop_spawn_4" IN life_spawn_points) then {_return pushBack ["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];};
	};
	
	case civilian:
	{
		if ("civ_spawn_1" IN life_spawn_points) then {_return pushBack ["civ_spawn_1","GeorgeTown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];};
		if ("civ_spawn_2" IN life_spawn_points) then {_return pushBack ["civ_spawn_2","Tuvanaka","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];};
		if ("civ_spawn_3" IN life_spawn_points) then {_return pushBack ["civ_spawn_3","LinjnHaven","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];};
		
			
		if (license_civ_rebel) then
		{
			_return pushBack ["civ_spawn_5","Rebel Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
		
		if(count life_gangData != 0) then {
			{			
				_gangMarker = _x;
				_return pushBack [_gangMarker,"Gang Base","\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"];
			} foreach life_player_bases;
		};
	};
	
	case independent: {
		if ("medic_spawn_2" IN life_spawn_points) then {_return pushBack ["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];};
		if ("medic_spawn_1" IN life_spawn_points) then {_return pushBack ["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];};
		if ("medic_spawn_3" IN life_spawn_points) then {_return pushBack ["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];};
	};
};

_return;