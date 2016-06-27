#include <macro.h>
/*
	File: fn_clothing_bounty.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bounty Clothing Store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bounty Hunter Store"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{

		_ret pushBack ["U_OG_Guerrilla_6_1","Bounty Hunter",20000];

	};

	//Hats
	case 1:
	{
		_ret pushBack ["H_Watchcap_cbr",nil,200];
		_ret pushBack ["H_Watchcap_blk",nil,300];
		_ret pushBack ["H_Watchcap_khk",nil,200];
		_ret pushBack ["H_Watchcap_camo",nil,200];
		_ret pushBack ["H_Watchcap_sgg",nil,150];

	};

	//Glasses
	case 2:
	{
		_ret pushBack ["G_Squares_Tinted",nil,200];
		_ret pushBack ["G_Goggles_VR",nil,300];
		_ret pushBack ["G_Tactical_Clear",nil,200];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_BandollierB_blk",nil,1500];
		_ret pushBack ["V_BandollierB_rgr",nil,5500];
		_ret pushBack ["V_BandollierB_cbr",nil,2500];
		_ret pushBack ["V_BandollierB_khk",nil,3500];

	};

	//Backpacks
	case 4:
	{
		_ret pushBack ["B_AssaultPack_blk",nil,1000];
		_ret pushBack ["B_AssaultPack_cbr",nil,1500];
		_ret pushBack ["B_AssaultPack_sgg",nil,1500];

	};
};

_ret;
