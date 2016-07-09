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
ctrlSetText[3103,"Tanoa Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		//Level 0 (Pubslot)
		_ret pushBack["U_BG_Guerilla2_1","Cadet Uniform",25];
		
		//Level 1 (Constable)
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack ["U_Competitor","Highway Patrol Uniform",25];
		};
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["U_B_Wetsuit",nil,2000];
		};
		
		//Level 3 (Leading Senior Constable)
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["U_Rangemaster","Leading Senior Constable Uniform",250];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret pushBack ["U_B_SpecopsUniform_sgg","SWAT Uniform",550];
		};
		
		//Level 5 (Senior Sergeant)
		
		//Level 6 (Captain)

	};
	
	//Hats
	case 1:
	{
		//Level 0 (Pubslot)
		_ret pushBack["H_Cap_blu","Cadet Cap",100];
		
		//Level 1 (Constable)
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack["H_Cap_police","Police Cap",100];
		};
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["H_HelmetB_plain_blk","Tactical Helmet",75];
			_ret pushBack["H_MilCap_blue","Police Cap",100];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret pushBack ["H_Beret_blk_POLICE","Police Beret",100];
			
		};
		
		//Level 5 (Senior Sergeant)
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["H_HelmetB_light_black","RageMonkey's Hat",120];
		};
		
		//Level 6 (Captain)
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
			["G_Combat",nil,55],
			["G_Diving",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		//Level 0 (Pubslot)
		//Level 1 (Constable)
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,1500];
			_ret pushBack ["V_RebreatherB",nil,5000];
		};
		
		//Level 3 (Leading Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			//_ret pushBack ["V_TacVest_gen_F",nil,2000];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret pushBack["V_TacVestIR_blk",nil,7000];
		};
		
		//Level 5 (Senior Sergeant)
		
		//Level 6 (Captain)
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack["V_PlateCarrier1_blk",nil,10000];
		};
		
		//_ret pushBack["V_PlateCarrierSpec_blk",nil,10000];
		//_ret pushBack["V_PlateCarrierGL_blk",nil,10000];

	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Kitbag_cbr",nil,800];
		_ret pushBack ["B_AssaultPack_blk",nil,700];
		_ret pushBack ["B_Bergen_blk",nil,2500];
		_ret pushBack ["B_Carryall_cbr",nil,3500];

		if((__GETC__(life_member) > 2) && (__GETC__(life_coplevel) > 1)) then
		{
			_ret pushBack["B_UAV_01_backpack_F",nil,20000];
		};
	};
};

_ret;