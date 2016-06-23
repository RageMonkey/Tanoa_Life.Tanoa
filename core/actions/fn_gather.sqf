/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_text","_noEscKey"];
if(life_action_inUse) exitWith { };
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","oil_2","rock_1","grape_1","rye_1","hops_1","yeast_1","slave_trader_pick_area","fallout_zone_1","bdiamond_1","oil_rig_1","oil_rig_2"];
_zone = "";

gather_var = true; 

{
	if(player distance (getMarkerPos _x) < 40) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";

	gather_var = false;
	life_action_inUse = false;
};

_noEscKey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {  gather_var = false }"];

titleText["Gathering...","PLAIN",2];

life_action_inUse = true;
while {gather_var} do {
	{
		if(player distance (getMarkerPos _x) < 40) exitWith {_zone = _x;};
	} foreach _resourceZones;

	if(_zone == "") exitWith {
		hint localize "STR_NOTF_notNearResource";

		gather_var = false;
	};
	//Get the resource that will be gathered from the zone name...
	switch(true) do {
		case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
		case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
		case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
		case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
		case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
		case (_zone in ["lead_1"] && life_inv_pickaxe > 0): {_gather = "copperore"; _val = 1;};
		case (_zone in ["iron_1"] && life_inv_pickaxe > 0): {_gather = "ironore"; _val = 1;};
		case (_zone in ["salt_1"] && life_inv_pickaxe > 0): {_gather = "salt"; _val = 1;};
		case (_zone in ["sand_1"] && life_inv_pickaxe > 0): {_gather = "sand"; _val = 1;};
		case (_zone in ["diamond_1"] && life_inv_pickaxe > 0): {_gather = "diamond"; _val = 1;};
		case (_zone in ["oil_1","oil_2"] && life_inv_pickaxe > 0): {_gather = "oilu"; _val = 1;};
		case (_zone in ["rock_1"] && life_inv_pickaxe > 0): {_gather = "rock"; _val = 1;};
		case (_zone in ["grape_1"]): {_gather = "grapes"; _val = 1;};
		case (_zone in ["rye_1"]): {_gather = "rye"; _val = 2;};
		case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 2;};
		case (_zone in ["hops_1"]): {_gather = "hops"; _val = 2;};
		case (_zone in ["slave_trader_pick_area"]): {_gather = "tobacco"; _val = 2;};
		case (_zone in ["fallout_zone_1"] && life_inv_pickaxe > 0): {_gather = "uranium"; _val = 1;};
		case (_zone in ["bdiamond_1"] && life_inv_pickaxe > 0): {_gather = "bdiamond"; _val = 1;};
		case (_zone in ["oil_rig_1","oil_rig_2"]): {_gather = "petrol"; _val = 1;};
		default {""};
	};
	//gather check??
	if(vehicle player != player) exitWith {
		/*hint localize "STR_NOTF_GatherVeh";*/
		gather_var = false;
	};
	
	//Exit if Cop is gathering anything other than tobacco
	if(playerSide == west  && _gather != "tobacco") exitWith { };	

	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_diff == 0) exitWith {
		hint localize "STR_NOTF_InvFull";
		gather_var = false;
	};
	
	disableUserInput true;
	life_action_inUse = true;
	for "_i" from 0 to 1 do
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep 2.5;
	};
	disableUserInput false;
	
	if(([true,_gather,_diff] call life_fnc_handleInv)) then
	{
		_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
	};
};
life_action_inUse = false;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _noEscKey];