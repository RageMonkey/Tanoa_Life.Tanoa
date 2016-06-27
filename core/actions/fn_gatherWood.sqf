/*
	fn_gatherWood.sqf
	Author: Fresqo
	description: cuts trees down and gathers the amount of trees fallen
*/

 private["_dmg","_alivetrees","_itemName","_itemWeight","_diff","_itemName","_val","_legalzone"];
 
 if (life_lumberjack) exitWith {};
trees = []; {if (str _x find ": t_" > -1) then
{trees pushBack _x;};} forEach nearestObjects [player, [], 8];
_dmg =[]; {if (damage _x == 0) then {_dmg pushBack _x}} forEach trees;
_alivetrees = count _dmg;
_legalzone = getMarkerPos "lumberfield_1_1"; 

if (_alivetrees == 0) exitWith {hint "There are no trees around that can be cut down!"};
if (_alivetrees > 0) then {

_val = _alivetrees;
_addExpAmount = 5;
_time = 3;
if(vehicle player != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};
 
_diff = ["wood",_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
life_action_gather = true;
life_lumberjack = true;

player say3D "chainsaw"; 
 
for "_i" from 0 to 2 do
{
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep _time;
};
			if(([true,"wood",_diff] call life_fnc_handleInv)) then {
            _itemName = [(["wood",0] call life_fnc_varHandle)] call life_fnc_varToStr;
			{_x setDamage 1;} forEach trees;
            titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};
 
if(player distance _legalzone > 1200) then { 
	life_treelop = round (life_treelop + 1);
		life_treelop = 5;
	};
	
	if (life_treelop == 5) then {
	life_treelop = round (life_treelop + 1);
	[[getPlayerUID player,name player,"700",player],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	hint "You have been added to the wanted list for tree lopping in a non regulated zone!"; };
	
	life_action_inUse = false;
	life_action_gather = false;
	life_lumberjack = false;
};