/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_Competitor";
[] call life_fnc_equipGear;
player addBackpack "B_FieldPack_blk";
player addVest "V_Rangemaster_belt";
player addItem "MediKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

/*
if((__GETC__(life_medicLevel)) > 0) then
{
	player addItem "Medikit";
}; 

//if((__GETC__(life_member)) > 0)  then
//{
	player addItem "ToolKit";
//};
*/

[] call life_fnc_saveGear;