#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Tanoa Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["ItemMap",nil,5],
						["ItemCompass",nil,5],
						["Binocular",nil,150],
						["Rangefinder",nil,7000],
						["ItemGPS",nil,100],
						["ToolKit",nil,50],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles_OPFOR",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["Rangefinder",nil,7000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not a Senior Constable!"};
			default
			{
				["Senior Constable Shop",
					[
						["arifle_SPAR_01_blk_F",nil,60000],						
						["hgun_P07_F",nil,7500],
						["SMG_01_F","Vermin",35000],
						["SMG_02_ACO_F",nil,30000],
						["arifle_MXC_Black_F",nil,50000],
						["arifle_MX_Black_F",nil,60000],
						["arifle_MXM_Black_F",nil,70000],
						["arifle_MX_GL_Black_F",nil,80000],
						["30Rnd_556x45_Stanag",nil,100],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_65x39_caseless_mag",nil,130],
						//["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullets",100],
						["B_UavTerminal",nil,5000],
						["acc_flashlight",nil,750],
						["optic_Aco",nill,1200],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["muzzle_snds_acp",nil,2750],
						["muzzle_snds_L",nil,650],
						["muzzle_snds_H",nil,3750],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1000],
						["1Rnd_SmokeYellow_Grenade_shell","Tear Gas Shell",3000],
						["bipod_01_F_blk",nil,10000]
					]
				];
			};
		};
	};
	
	case "cop_leadconst":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not a Leading Senior Constable!"};
			default
			{
				["Leading Senior Constable Shop",
					[
						["arifle_SPAR_01_GL_blk_F",nil,60000],
						["arifle_SPAR_02_blk_F",nil,100000],
						["SMG_01_F","Vermin",35000],
						["SMG_02_ACO_F",nil,30000],
						["arifle_MXC_Black_F",nil,50000],
						["arifle_MX_Black_F",nil,60000],
						["arifle_MXM_Black_F",nil,70000],
						["arifle_MX_GL_Black_F",nil,80000],
						["arifle_MX_SW_Black_F",nil,80000],
						["30Rnd_556x45_Stanag",nil,100],
						["150Rnd_556x45_Drum_Mag_F",nil,600],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_65x39_caseless_mag",nil,130],
						//["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullets",100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["B_UavTerminal",nil,5000],
						["acc_flashlight",nil,750],
						["optic_Aco",nill,1200],
						["optic_MRCO",nil,5000],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["muzzle_snds_65_TI_blk_F",nil,2150],
						["muzzle_snds_acp",nil,2750],
						["muzzle_snds_H",nil,3750],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["1Rnd_SmokeYellow_Grenade_shell","Tear Gas Shell",3000],
						["bipod_01_F_blk",nil,10000]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 4): {"You are not a Sergeant!"};
			default
			{
				["Tanoa Sergeant Shop",
					[
						["hgun_ACPC2_F",nil,17500],
						["arifle_MX_SW_Black_F",nil,80000],
						["arifle_Mk20C_plain_F",nil,15000],
						["srifle_GM6_F",nil,150000],
						["srifle_EBR_F",nil,50000],
						["optic_MRCO",nil,5000],
						["optic_Arco",nil,2500],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,7500],
						["optic_AMS",nil,10000],
						["Rangefinder",nil,7000],
						["acc_pointer_IR",nil,2500],
						["muzzle_snds_H",nil,2750],
						["bipod_01_F_blk",nil,10000],
						["9Rnd_45ACP_Mag",nil,60],
						["30Rnd_9x21_Mag",nil,60],
						//["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullets",100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["20Rnd_762x51_Mag",nil,300],
						//["16Rnd_9x21_Mag",nil,25],
						["30Rnd_556x45_Stanag",nil,100],
						["5Rnd_127x108_Mag",nil,400],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1000],
						["1Rnd_SmokeYellow_Grenade_shell","Tear Gas Shell",3000],
						["B_UavTerminal",nil,10000]
					]
				];
			};
		};
	};
	
	case "cop_snrsergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not at Senior Sergeant!"};
			default
			{
				["Tanoa Senior Sergeant Shop",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["hgun_ACPC2_F",nil,17500],
						["srifle_GM6_F",nil,150000],
						["arifle_MX_SW_Black_F",nil,80000],
						["arifle_Mk20C_plain_F",nil,15000],
						["srifle_DMR_03_F",nil,60000],
						["launch_Titan_F",nil,200000],
						["Titan_AA",nil,20000],
						["optic_MRCO",nil,5000],
						["optic_Arco",nil,2500],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,7500],
						["optic_AMS",nil,10000],
						["Rangefinder",nil,7000],
						["acc_pointer_IR",nil,2500],
						["muzzle_snds_H",nil,2750],
						["muzzle_snds_B",nil,4000],
						["bipod_01_F_blk",nil,10000],
						["9Rnd_45ACP_Mag",nil,60],
						["30Rnd_9x21_Mag",nil,60],
						//["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullets",100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["5Rnd_127x108_Mag",nil,400],
						//["16Rnd_9x21_Mag",nil,25],
						["20Rnd_762x51_Mag",nil,300],
						["30Rnd_556x45_Stanag",nil,100],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1000],
						["1Rnd_SmokeYellow_Grenade_shell","Tear Gas Shell",3000],
						["B_UavTerminal",nil,10000]
					]
				];
			};
		};
	};
	
	case "cop_captain":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 6): {"You are not at Captain!"};
			default
			{
				["Tanoa Captain Shop",
					[
						["hgun_ACPC2_F",nil,17500],
						["srifle_GM6_F",nil,150000],
						["arifle_MX_SW_Black_F",nil,80000],
						["arifle_Mk20C_plain_F",nil,15000],
						["srifle_EBR_F",nil,50000],
						["srifle_DMR_03_F",nil,60000],
						["launch_Titan_F",nil,200000],
						["Titan_AA",nil,20000],
						["optic_MRCO",nil,5000],
						["optic_Arco",nil,2500],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,7500],
						["optic_AMS",nil,10000],
						["Rangefinder",nil,7000],
						["acc_pointer_IR",nil,2500],
						["muzzle_snds_H",nil,2750],
						["muzzle_snds_B",nil,4000],
						["bipod_01_F_blk",nil,10000],
						["9Rnd_45ACP_Mag",nil,60],
						["30Rnd_9x21_Mag",nil,60],
						//["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullets",100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["5Rnd_127x108_Mag",nil,400],
						//["16Rnd_9x21_Mag",nil,25],
						["20Rnd_762x51_Mag",nil,300],
						["30Rnd_556x45_Stanag",nil,100],
						["SmokeShell",nil,100],
						["HandGrenade_Stone","Flashbang",1000],
						["1Rnd_SmokeYellow_Grenade_shell","Tear Gas Shell",3000],
						["B_UavTerminal",nil,10000],
						["srifle_LRR_F",nil,70000],
						["optic_LRPS",nil,10000],
						["7Rnd_408_Mag",nil,1000]
					]
				];
			};
		};
	};
	
	case "copdonator":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Cop Store",
					[
						["B_UavTerminal",nil,10000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_AKS_F",nil,60000],
						["arifle_TRG20_F","TRG Carbine",25000],
						["arifle_TRG21_F",nil,27500],
						["arifle_Katiba_F",nil,30000],
						["arifle_Katiba_C_F","Katiba Carbine",30000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_545x39_Mag_F",nil,200],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x54_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],
						["SmokeShell",nil,100]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["SMG_05_F",nil,30000],
						["hgun_Pistol_01_F",nil,7000],
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["10Rnd_9x21_Mag",nil,100]
					]
				];
			};
		};
	};
	
	case "rifle":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rifle): {"You don't have a Rifle license!"};
			case (__GETC__(life_member) < 3): {
				["Billy Joe's Rifles",
					[
						["arifle_TRG20_F","TRG Carbine",25000],
						["arifle_TRG21_F",nil,27500],
						["arifle_Katiba_F",nil,30000],
						["arifle_Katiba_C_F","Katiba Carbine",30000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,7500],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275]
					]
				];
			};
			case (__GETC__(life_member) >= 3): {
				["Billy Joe's Rifles",
					[
						["srifle_DMR_07_ghex_F",nil,30000],
						["srifle_DMR_07_hex_F",nil,30000],
						["arifle_TRG20_F","TRG Carbine",25000],
						["arifle_TRG21_F",nil,27500],
						["arifle_Katiba_F",nil,30000],
						["arifle_Katiba_C_F","Katiba Carbine",30000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,7500],
						["20Rnd_650x39_Cased_Mag_F",nil,7500],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						
						["SMG_01_F","Vermin",35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["SMG_02_F",nil,40000],
						["arifle_MK20_F",nil,20000],
						["arifle_MK20C_F","MK20 Carbine",15000],
						["arifle_MXM_F",nil,50000],
						["acc_pointer_IR",nil,500],
						["optic_ACO_grn_smg",nil,250],
						["optic_MRCO",nil,5000],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,10000],
						["optic_MRD",nil,3500],
						["optic_Yorris",nil,2500],
						["Rangefinder",nil,7000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,25],
						["6Rnd_45ACP_Cylinder",nil,40],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_556x45_Stanag",nil,100]
					]
				];
				
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
						
					]
				];
			};
		};
	};
	
	case "donator_dlc":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (__GETC__(life_member) == 0): {"You are not a ROT Member, join our website!"};
			case (__GETC__(life_member) == 3):
			{
				["RoT Member DLC Shop Tier 3",
					[
							//These not used yet
						//["arifle_CTARS_blk_F",nil,400],
						//["arifle_CTAR_blk_F",nil,400],
						//["arifle_CTAR_GL_blk_F",nil,400],
						//["10Rnd_50BW_Mag_F",nil,400],
						//["arifle_ARX_blk_F",nil,60000], //has 50 cal 
						//["arifle_ARX_ghex_F",nil,60000], //has 50 cal 
						//["arifle_ARX_hex_F",nil,60000], //has 50 cal 
						
						
						
						["arifle_MK20_F",nil,20000],
 						["arifle_MK20C_F","MK20 Carbine",15000],
						["arifle_MX_SW_F",nil,100000],
						["arifle_MXM_F",nil,50000],
						
						
						
						["arifle_AK12_F",nil,160000],
						["arifle_AK12_GL_F",nil,170000],
						["arifle_AKM_F",nil,140000],
						["arifle_AKM_FL_F",nil,150000],
						["arifle_AKS_F",nil,120000],
						["arifle_MX_GL_khk_F",nil,100000],
						["arifle_MX_khk_F",nil,100000],
						["arifle_MX_SW_khk_F",nil,200000],
						["arifle_MXC_khk_F",nil,100000],
						["arifle_MXM_khk_F",nil,100000],					


						

						
						//["arifle_SPAR_01_khk_F",nil,400], //L2 Cop has this
						//["arifle_SPAR_01_snd_F",nil,400], //L2 Cop has this
						//["arifle_SPAR_01_GL_khk_F",nil,400], //L3 Cop has this
						//["arifle_SPAR_01_GL_snd_F",nil,400], //L3 Cop has this
						
						//["arifle_SPAR_02_khk_F",nil,400], //L3 Cop has this
						//["arifle_SPAR_02_snd_F",nil,400], //L3 Cop has this
						
						//["arifle_SPAR_03_khk_F",nil,400], //L4 Cop has this
						//["arifle_SPAR_03_snd_F",nil,400], //L4 Cop has this
						
						["launch_RPG7_F",nil,300000],
						
						//["LMG_03_F",nil,400], //LMG
						
						
						
						//["srifle_DMR_07_blk_F",nil,400], // No black for rebs
						["srifle_DMR_07_ghex_F",nil,110000],
						["srifle_DMR_07_hex_F",nil,110000],
						["srifle_GM6_ghex_F",nil,350000],
						//["srifle_LRR_tna_F",nil,400],
						
						//["hgun_P07_khk_F",nil,800],
						["hgun_Pistol_01_F",nil,9000],
						
						
						//["muzzle_snds_58_wdm_F",nil,400],
						//["muzzle_snds_B_snd_F",nil,400],
						//["muzzle_snds_B_khk_F",nil,400],
						//["muzzle_snds_H_MG_khk_F",nil,400],
						//["muzzle_snds_H_MG_blk_F",nil,400],
						//["muzzle_snds_65_TI_ghex_F",nil,400],
						//["muzzle_snds_65_TI_hex_F",nil,400],
						
						
						["10Rnd_9x21_Mag",nil,100],
						["30Rnd_545x39_Mag_F",nil,400],
						//["7Rnd_408_Mag",nil,400],
						["30Rnd_580x42_Mag_F",nil,400],
						
						//["30Rnd_65x39_caseless_green",nil,400],
						//["30Rnd_65x39_caseless_green_mag_Tracer",nil,400],
						["30Rnd_762x39_Mag_F",nil,400],
						//["30Rnd_762x39_Mag_Green_F",nil,400],
						//["30Rnd_762x39_Mag_Tracer_Green_F",nil,400],
						//["30Rnd_580x42_Mag_Tracer_F",nil,400],
						["20Rnd_650x39_Cased_Mag_F",nil,7500],
						//["5Rnd_127x108_Mag",nil,400],
						//["30Rnd_9x21_Mag_SMG_02",nil,400],
						//["30Rnd_9x21_Mag_SMG_02_Tracer_Red",nil,400],
						//["16Rnd_9x21_Mag",nil,400],
						["RPG7_F",nil,100000],
						
									
						//MK14
						["srifle_DMR_06_camo_F",nil,120000],
						["srifle_DMR_06_olive_F",nil,120000],
						//["20Rnd_762x51_Mag",nil,400],
						
						//MK-1 EMR
						["srifle_DMR_03_tan_F",nil,110000],
						["srifle_DMR_03_woodland_F",nil,110000],
						["20Rnd_762x51_Mag",nil,400],
						
						//AMS Scope
						["optic_AMS_khk",nil,15000],	//Green
						["optic_AMS_snd",nil,15000],	//Tan
						
						//Khalia Scope
						["optic_KHS_hex",nil,12000],	//Hex
						["optic_KHS_old",nil,12000],	//Black old (no laser thing)
						["optic_KHS_tan",nil,12000],	//Tan
						
						//Bipods
						["bipod_02_F_hex",nil,15000],
						["bipod_02_F_tan",nil,15000],
						["bipod_03_F_oli",nil,15000]
						
					]
				];
			};
		};
	};
	
	case "donator":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (__GETC__(life_member) == 0): {"You are not a ROT Member, join our website!"};
			case (__GETC__(life_member) == 1):
			{
				["RoT Member Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["optic_ACO_grn_smg",nil,750],
						["acc_pointer_IR",nil,2500],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};

			case (__GETC__(life_member) == 2):
			{
				["RoT Member Shop Tier 2",
					[
						["hgun_Rook40_F",nil,600],
						["hgun_PDW2000_F",nil,5000],
						["SMG_01_F","Vermin",35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["SMG_02_F",nil,50000],
						["arifle_MK20_F",nil,30000],
 						["arifle_MK20C_F","MK20 Carbine",25000],
						["optic_ACO_grn_smg",nil,500],
						["acc_pointer_IR",nil,1000],
						["srifle_GM6_camo_F",nil,300000],
						["optic_SOS",nil,6000],
						["NVGoggles",nil,2000],
						["ToolKit",nil,20],
						["itemgps",nil,50],
						["FirstAidKit",nil,20],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,25],
						["30Rnd_556x45_Stanag",nil,125],
						["5Rnd_127x108_Mag",nil,400]
					]
				];
			};

			case (__GETC__(life_member) >= 3):
			{
				["RoT Member Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,4000],
						["hgun_pistol_heavy_01_F",nil,5850],
						["hgun_Pistol_heavy_02_F",nil,6000],
						["SMG_01_F","Vermin",35000],
						["30Rnd_45ACP_Mag_SMG_01",nil,100],
						["SMG_02_F",nil,40000],
						["arifle_MK20_F",nil,20000],
 						["arifle_MK20C_F","MK20 Carbine",15000],
						["arifle_MX_SW_F",nil,200000],
						["arifle_MXM_F",nil,100000],
						["srifle_GM6_camo_F",nil,350000],
						["srifle_EBR_F",nil,50000],
						
						["launch_RPG32_F",nil,300000],
						["RPG32_F",nil,100000],
						//["launch_Titan_short_F",nil,500000],
						//["Titan_AT",nil,300000],
						["launch_Titan_F",nil,600000],
						["Titan_AA",nil,400000],
						["acc_pointer_IR",nil,500],
						["optic_ACO_grn_smg",nil,250],
						["optic_MRCO",nil,5000],
						["optic_SOS",nil,4000],
						["optic_DMS",nil,10000],
 						["optic_MRD",nil,3500],
						["optic_Yorris",nil,2500],
						["Rangefinder",nil,7000],
						["NVGoggles",nil,2000],
						["ToolKit",nil,20],
						["itemgps",nil,50],
						["FirstAidKit",nil,20],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,25],
						["6Rnd_45ACP_Cylinder",nil,40],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_65x39_caseless_mag",nil,100],
						["100Rnd_65x39_caseless_mag",nil,500],
						["20Rnd_762x51_Mag",nil,300],
						["30Rnd_556x45_Stanag",nil,100],
						["5Rnd_127x108_Mag",nil,200]

					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Tanoa General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,50],
				["ItemCompass",nil,50],
				["ItemWatch",nil,50],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	case "bounty":
	{

		["Bounty Hunter Weapon Store",
			[
				["srifle_DMR_04_F",nil,25000],
				["srifle_DMR_04_Tan_F",nil,25000],
				["10Rnd_127x54_Mag",nil,500],
				["optic_MRCO",nil,5000],
				["FirstAidKit",nil,50]
			]
		];
	};
};
