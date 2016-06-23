#include <macro.h>
/*
	File: fn_clothing_donator_dlc.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Donator Clothing Store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Donator DLC Clothing Store"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_member) > 2) then
		{
			_ret pushBack ["U_I_FullGhillie_ard","Arid",20000];
			_ret pushBack ["U_I_FullGhillie_sard","Semi-Arid",20000];
			_ret pushBack ["U_I_FullGhillie_lsh","Lush",20000];
		};
	};

	//Hats
	case 1:
	{
	
	};

	//Glasses
	case 2:
	{
	};

	//Vest
	case 3:
	{
	};

	//Backpacks
	case 4:
	{
	};
};

_ret;
