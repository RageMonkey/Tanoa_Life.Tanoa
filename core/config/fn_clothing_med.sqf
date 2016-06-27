#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Hospital Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack["U_Competitor","EMS Uniform",25];
		
		// Level 2+
		if(__GETC__(life_medicLevel) > 1) then {
		
		};
		
		// Level 3+
		if(__GETC__(life_medicLevel) > 2) then {
		
		};
		
		// Level 4+
		if(__GETC__(life_medicLevel) > 3) then {
		
		};
	};
	
	//Hats
	case 1:
	{
		
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		
		// Level 2+
		//if(__GETC__(life_medicLevel) > 1) then {
			_ret pushBack ["V_Chestrig_blk",nil,800];
		//};
		
		// Level 3+
		if(__GETC__(life_medicLevel) > 2) then {
			_ret pushBack ["V_TacVestIR_blk",nil,800];
		};
		
		// Level 4+
		if(__GETC__(life_medicLevel) > 3) then {
			_ret pushBack ["V_PlateCarrier1_blk",nil,800];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Kitbag_cbr",nil,800];
		_ret pushBack ["B_AssaultPack_blk",nil,700];
		_ret pushBack ["B_FieldPack_oucamo",nil,1500];
		_ret pushBack ["B_FieldPack_blk",nil,1500];
		_ret pushBack ["B_Bergen_blk",nil,2500];
		_ret pushBack ["B_Carryall_cbr",nil,3500];
		_ret pushBack ["B_Carryall_oucamo",nil,3000];
		
		// Level 2+
		if(__GETC__(life_medicLevel) > 1) then {
		};
		
		// Level 3+
		if(__GETC__(life_medicLevel) > 2) then {
		};
		
		// Level 4+
		if(__GETC__(life_medicLevel) > 3) then {
		
		};
	};
};

_ret;