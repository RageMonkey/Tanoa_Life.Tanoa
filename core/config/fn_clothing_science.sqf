/*
	File: fn_clothing_science.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: This is an edit of bruces outback shop created by tonic, edited by Johnny Tappia
	Description: Clothing Store for protective equipment for Uranium
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Johnny's Protective Equipment"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
            ["U_C_Scientist","Protective Suit",1000]
		];
	};
	
	//Hats
	case 1:
	{
		[
            ["H_PilotHelmetFighter_B","Gas Mask",1000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
		];
	};
	
	//Vest
	case 3:
	{
		[
            ["V_RebreatherIA","Rebreather",5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[   
		];
	};
};