#include <macro.h>
/*
	File: fn_clothing_don.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Donator Clothing Store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Donator Clothing Store"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_I_HeliPilotCoveralls",nil,1250];
		_ret pushBack ["U_I_pilotCoveralls",nil,1500];
		if(__GETC__(life_member) > 1) then
		{
			_ret pushBack ["U_NikosBody","Hustler Outfit",3000];
			_ret pushBack ["U_O_Wetsuit","Wetsuit CSAT",1500];
			_ret pushBack ["U_I_CombatUniform",nil,5000];
			_ret pushBack ["U_I_CombatUniform_tshirt",nil,6000];
			_ret pushBack ["U_I_OfficerUniform",nil,7500];
			_ret pushBack ["U_O_CombatUniform_oucamo",nil,7000];
			_ret pushBack ["U_O_CombatUniform_ocamo",nil,6000];
			_ret pushBack ["U_O_OfficerUniform_ocamo",nil,7500];
			_ret pushBack ["U_I_GhillieSuit",nil,10000];
			_ret pushBack ["U_NikosAgedBody","Lawyer",20000];
			_ret pushBack ["U_C_Journalist","Journalist",20000];
		};
	};

	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_headphones",nil,200];
		_ret pushBack ["H_Booniehat_khk",nil,300];
		if(__GETC__(life_member) > 1) then
		{
			_ret pushBack ["H_Booniehat_dgtl",nil,200];
			_ret pushBack ["H_Booniehat_mcamo",nil,200];
			_ret pushBack ["H_Cap_blk_ION",nil,150];
			_ret pushBack ["H_Cap_blk_Raven",nil,150];
			_ret pushBack ["H_Cap_press",nil,150];
			_ret pushBack ["H_MilCap_ocamo",nil,250];
			_ret pushBack ["H_Shemag_olive_hs",nil,1250];
			_ret pushBack ["H_ShemagOpen_tan",nil,1250];
			_ret pushBack ["H_Watchcap_blk",nil,1500];
			_ret pushBack ["H_HelmetCrew_O",nil,1500];
			_ret pushBack ["H_CrewHelmetHeli_I",nil,1750];
			_ret pushBack ["H_PilotHelmetHeli_I",nil,2250];
			_ret pushBack ["H_PilotHelmetFighter_I",nil,2500];
			_ret pushBack ["H_HelmetIA",nil,3000];
			_ret pushBack ["H_HelmetLeaderO_ocamo",nil,3000];
			_ret pushBack ["H_HelmetLeaderO_oucamo",nil,3250];
			_ret pushBack ["H_HelmetO_oucamo",nil,3500];
			_ret pushBack ["H_HelmetSpecO_blk",nil,4000];
			_ret pushBack ["H_HelmetSpecO_ocamo",nil,4000];
		};
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
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Diving",nil,500],
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,1500];
		_ret pushBack ["V_HarnessO_brn",nil,5500];
		if(__GETC__(life_member) > 1) then
		{
			_ret pushBack ["V_Press_F",nil,2500];
			_ret pushBack ["V_RebreatherIR",nil,3500];
			_ret pushBack ["V_BandollierB_blk",nil,3500];
			_ret pushBack ["V_BandollierB_khk",nil,3500];
			_ret pushBack ["V_TacVest_oli",nil,4500];
			_ret pushBack ["V_I_G_resistanceLeader_F",nil,5000];
			_ret pushBack ["V_HarnessO_gry",nil,5500];
			_ret pushBack ["V_HarnessOSpec_brn",nil,6000];
			_ret pushBack ["V_HarnessOSpec_gry",nil,6000];
		};
	};

	//Backpacks
	case 4:
	{
		_ret pushBack ["B_AssaultPack_blk",nil,1000];
		_ret pushBack ["B_FieldPack_ocamo",nil,1500];
		if(__GETC__(life_member) > 1) then
		{
			_ret pushBack ["B_FieldPack_oucamo",nil,1500];
			_ret pushBack ["B_FieldPack_blk",nil,1500];
			_ret pushBack ["B_TacticalPack_oli",nil,2000];
			_ret pushBack ["B_Bergen_blk",nil,2000];
			_ret pushBack ["B_Kitbag_sgg",nil,2500];
			_ret pushBack ["B_Kitbag_cbr",nil,2500];
			_ret pushBack ["B_Carryall_ocamo",nil,3000];
			_ret pushBack ["B_Carryall_oucamo",nil,3000];
		};
	};
};

_ret;
