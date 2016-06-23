#include <macro.h>
/*
	File: fn_godmode.sqf
	Author: Not Sure on original
	
	Description:
	God Mode for Admins
	
	Edited by: Blindy
*/

if (life_teleport_admin_lvl > __GETC__(life_adminlevel)) exitWith{
	hint "Insufficient Admin Level God Mode";};

if (isNil "godmode") then
{
	godmode = 0;
};

if (godmode == 0) then
{
	godmode = 1;
    cutText ["God mode activated.", "PLAIN"];
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	admin_outfit = uniform player;
	admin_outfit_items = uniformItems player;
	admin_vest = vest player;
	admin_vest_items = vestItems player;
	admin_headgear = headGear player;
	admin_goggles = goggles player;
	removeHeadGear player;
	removeUniform player;
	removeVest player;
	removeGoggles player;
	if(!("ItemMap" in (assignedItems player))) then { player addItem "ItemMap"; };
	player addGoggles "NVGoggles_OPFOR";
	player addHeadGear "H_CrewHelmetHeli_B";
	player forceAddUniform "U_O_Protagonist_VR";
	[[getPlayerUID player,name player, "God mode activated",position player,""],"TON_fnc_logInReport",false,false] spawn life_fnc_MP;
}

else
{
	if (admin_esp) then 
	{
		call life_fnc_playermarkers;
	};
	
	godmode = 0;
    cutText ["God mode Deactivated.", "PLAIN"];
	player allowDamage true;
	
	player addEventHandler ["handleDamage", {_this call life_fnc_handleDamage;}];
	player removeAllEventHandlers "handleDamage";
	removeHeadGear player;
	removeUniform player;
	removeVest player;
	removeGoggles player;
	player addGoggles admin_goggles;
	player addHeadGear admin_headgear;
	player forceAddUniform admin_outfit;
	{player addItemToUniform _x} foreach admin_outfit_items;
	player addVest admin_vest;
	{player addItemToVest _x} foreach admin_vest_items;
	[] call life_fnc_equipGear;
	[[getPlayerUID player,name player, "God mode deactivated",position player,""],"TON_fnc_logInReport",false,false] spawn life_fnc_MP;
};

