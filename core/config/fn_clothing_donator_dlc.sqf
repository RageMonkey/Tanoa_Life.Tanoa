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
		_ret pushBack ["U_B_T_Soldier_F",nil,2000];
		_ret pushBack ["U_B_T_Soldier_AR_F",nil,2000];
		_ret pushBack ["U_B_T_Soldier_SL_F",nil,2000];
		_ret pushBack ["U_B_T_Sniper_F",nil,2000];
		_ret pushBack ["U_B_T_FullGhillie_tna_F",nil,2000];
		_ret pushBack ["U_B_CTRG_Soldier_F",nil,2000];
		_ret pushBack ["U_B_CTRG_Soldier_2_F",nil,2000];
		_ret pushBack ["U_B_CTRG_Soldier_3_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Camo_F",nil,2000];
		//_ret pushBack ["U_B_GEN_Soldier_F",nil,2000]; //Save for Cop
		//_ret pushBack ["U_B_GEN_Commander_F",nil,2000]; //Save for Cop
		_ret pushBack ["U_O_T_Soldier_F",nil,2000];
		_ret pushBack ["U_O_T_Officer_F",nil,2000];
		_ret pushBack ["U_O_T_Sniper_F",nil,2000];
		_ret pushBack ["U_O_T_FullGhillie_tna_F",nil,2000];
		_ret pushBack ["U_O_V_Soldier_Viper_F",nil,2000];
		_ret pushBack ["U_O_V_Soldier_Viper_hex_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Para_1_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Para_2_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Para_3_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Para_4_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Para_5_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Bandit_1_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Bandit_2_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Bandit_3_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Bandit_4_F",nil,2000];
		_ret pushBack ["U_I_C_Soldier_Bandit_5_F",nil,2000];
		
		_ret pushBack ["U_C_man_sport_1_F","Green Surfer",2000];
		_ret pushBack ["U_C_man_sport_2_F","Blue Surfer",2000];
		_ret pushBack ["U_C_man_sport_3_F","Red Surfer",2000];
		_ret pushBack ["U_C_Man_casual_1_F","Poloshirt Blue & Cream",2000];
		_ret pushBack ["U_C_Man_casual_2_F","Poloshirt Blue & White",2000];
		_ret pushBack ["U_C_Man_casual_3_F","Poloshirt Green & White",2000];
		_ret pushBack ["U_C_Man_casual_4_F","Blue T & Grey Pants",2000];
		_ret pushBack ["U_C_Man_casual_5_F","Yellow T & Blue Pants",2000];
		_ret pushBack ["U_C_Man_casual_6_F","Orange T & Green Pants",2000];
		//_ret pushBack ["U_B_CTRG_Soldier_urb_1_F",nil,2000]; //Save for Airdrop
		//_ret pushBack ["U_B_CTRG_Soldier_urb_2_F",nil,2000]; //Save for Airdrop
		//_ret pushBack ["U_B_CTRG_Soldier_urb_3_F",nil,2000]; //Save for Airdrop


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
		_ret pushBack ["H_Helmet_Skate",nil,2000];
		//_ret pushBack ["H_HelmetB_TI_tna_F",nil,2000];
		_ret pushBack ["H_HelmetB_tna_F",nil,2000];
		_ret pushBack ["H_HelmetB_Enclass_H_tna_F",nil,2000];
		_ret pushBack ["H_HelmetB_Light_tna_F",nil,2000];
		_ret pushBack ["H_HelmetSpecO_ghex_F",nil,2000];
		_ret pushBack ["H_HelmetLeaderO_ghex_F",nil,2000];
		_ret pushBack ["H_HelmetO_ghex_F",nil,2000];
		_ret pushBack ["H_HelmetCrew_O_ghex_F",nil,2000];
		_ret pushBack ["H_MilCap_tna_F",nil,2000];
		_ret pushBack ["H_MilCap_ghex_F",nil,2000];
		_ret pushBack ["H_Booniehat_tna_F",nil,2000];
		//_ret pushBack ["H_Beret_gen_F",nil,2000];
		//_ret pushBack ["H_MilCap_gen_F",nil,2000];
	};

	//Glasses
	case 2:
	{

	};

	//Vest
	case 3:
	{
		//_ret pushBack ["V_PlateCarrier1_tna_F",nil,2000];
		//_ret pushBack ["V_PlateCarrier2_tna_F",nil,2000];
		//_ret pushBack ["V_PlateCarrierSpec_tna_F",nil,2000];
		//_ret pushBack ["V_PlateCarrierGL_tna_F",nil,2000];
		_ret pushBack ["V_HarnessO_ghex_F",nil,2000];
		_ret pushBack ["V_HarnessOGL_ghex_F",nil,2000];
		_ret pushBack ["V_BandollierB_ghex_F",nil,2000];
		//_ret pushBack ["V_TacVest_gen_F",nil,2000]; //Cop
		//_ret pushBack ["V_PlateCarrier1_rgr_noflag_F",nil,2000];
		//_ret pushBack ["V_PlateCarrier2_rgr_noflag_F",nil,2000];
	
	};

	//Backpacks
	case 4:
	{
		_ret pushBack ["B_ViperLightHarness_khk_F",nil,2000];
		_ret pushBack ["B_ViperLightHarness_blk_F",nil,2000];
		_ret pushBack ["B_ViperLightHarness_hex_F",nil,2000];
		_ret pushBack ["B_ViperLightHarness_oli_F",nil,2000];
		_ret pushBack ["B_ViperLightHarness_ghex_F",nil,2000];
		_ret pushBack ["B_ViperHarness_oli_F",nil,2000];
		_ret pushBack ["B_ViperHarness_khk_F",nil,2000];
		_ret pushBack ["B_ViperHarness_ghex_F",nil,2000];
		_ret pushBack ["B_ViperHarness_blk_F",nil,2000];
		_ret pushBack ["B_FieldPack_ghex_F",nil,2000];
		_ret pushBack ["B_AssaultPack_tna_F",nil,2000];
		_ret pushBack ["B_Carryall_ghex_F",nil,2000];
		_ret pushBack ["B_Bergen_tna_F",nil,2000];
		_ret pushBack ["B_Bergen_hex_F",nil,2000];
		_ret pushBack ["B_Bergen_dgtl_F",nil,2000];
		_ret pushBack ["B_Bergen_mcamo_F",nil,2000];
		_ret pushBack ["B_ViperHarness_hex_F",nil,2000];
 
	};
};

_ret;
