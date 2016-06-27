/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
player say3D "Patdown";
_players = _unit nearEntities ["Man", 5]; //Count how players within 5m of _unit (target for search)
{
	if (isPlayer _x) then { //Makes sure they're players and not NPC's
		_unit say3D "Patdown"; //Play the sound "on" the _unit
	};
} forEach _players; //for everyone within the radius
				
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[[player],"life_fnc_searchClient",_unit,false] spawn life_fnc_MP;
life_action_inUse = true;