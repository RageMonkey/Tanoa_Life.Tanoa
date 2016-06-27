#include <macro.h>
/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item","_allowed","_bad"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?
_allowed = [];
_bad = [];

switch(playerSide) do
{
	case west: {
		_allowed = [
			"arifle_sdar_F",
			"hgun_P07_snds_F",
			"hgun_P07_F",
			"ItemMap",
			"ItemCompass",
			"Binocular",
			"Rangefinder",
			"ItemGPS",
			"muzzle_snds_L",
			"FirstAidKit",
			"Medikit",
			"NVGoggles_OPFOR",
			"16Rnd_9x21_Mag",
			"20Rnd_556x45_UW_mag",
			"Chemlight_red",
			"Chemlight_yellow",
			"Chemlight_green",
			"Chemlight_blue",
			"U_BG_Guerilla2_1",
			"V_Rangemaster_belt",
			"B_Kitbag_cbr",
			"B_AssaultPack_blk",
			"B_Bergen_blk",
			"B_Carryall_cbr",
			"G_Shades_Black",
			"G_Shades_Blue",
			"G_Sport_Blackred",
			"G_Sport_Checkered",
			"G_Sport_Blackyellow",
			"G_Sport_BlackWhite",
			"G_Aviator",
			"G_Squares",
			"G_Lowprofile",
			"G_Combat"];
		
		if(__GETC__(life_coplevel) > 1) then {
			_allowed = _allowed + [
				"U_Competitor",
				"H_MilCap_blue"
			];
		};
		if(__GETC__(life_coplevel) > 2) then {
			_allowed = _allowed + [
				"U_B_Wetsuit",
				"H_HelmetB_plain_blk",
				"V_TacVest_blk_POLICE",
				"V_RebreatherB",
				"SMG_01_F",
				"SMG_02_ACO_F",
				"arifle_MXC_Black_F",
				"arifle_MX_Black_F",
				"arifle_MXM_Black_F",
				"30Rnd_45ACP_Mag_SMG_01",
				"30Rnd_9x21_Mag",
				"30Rnd_65x39_caseless_mag",
				"30Rnd_65x39_caseless_mag_Tracer",
				"MineDetector",
				"acc_flashlight",
				"optic_Holosight",
				"optic_Arco",
				"muzzle_snds_acp",
				"muzzle_snds_H",
				"SmokeShell",
				"HandGrenade_Stone"
			];
		};
		if(__GETC__(life_coplevel) > 3) then {
			_allowed = _allowed + [
				"U_B_SpecopsUniform_sgg",
				"H_Beret_blk_POLICE",
				"H_HelmetB_light_black",
				"V_TacVestIR_blk",
				"B_UAV_01_backpack_F",
				"hgun_ACPC2_F",
				"srifle_GM6_F",
				"arifle_MX_SW_Black_F",
				"arifle_Mk20C_plain_F",
				"srifle_EBR_F",
				"launch_Titan_F",
				"Titan_AA",
				"optic_MRCO",
				"optic_SOS",
				"optic_DMS",
				"acc_pointer_IR",
				"muzzle_snds_H",
				"muzzle_snds_B",
				"muzzle_snds_B",
				"100Rnd_65x39_caseless_mag",
				"5Rnd_127x108_Mag",
				"20Rnd_762x51_Mag",
				"SmokeShell",
				"HandGrenade_Stone"
			];
		};		
		if(__GETC__(life_coplevel) > 4) then {
			_allowed = _allowed + [
				"V_PlateCarrier1_blk",
				"srifle_LRR_LRPS_F",
				"7Rnd_408_Mag"
			];
		};
		
		// Handle items
		if(!(_item in _allowed)) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	}; //Blah
	case civilian: {
		//uniforms
		_bad = ["U_B_SpecopsUniform_sgg","U_Competitor","U_BG_Guerilla2_1","U_IG_Guerilla2_1"];
		//vests
		_bad = _bad + ["V_PlateCarrier1_blk","V_TacVestIR_blk","V_TacVest_blk_POLICE","V_Chestrig_blk"];
		//hats
		_bad = _bad + ["H_HelmetB_light_black","H_Beret_blk_POLICE","H_HelmetB_plain_blk","H_MilCap_blue","H_Cap_blu"];
		//other
		_bad = _bad + ["7Rnd_408_Mag"];
		if(_item in _bad) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
	case independent: {
		_allowed = [
			"U_IG_Guerilla2_1",
			"V_Rangemaster_belt",
			"ItemGPS",
			"Binocular",
			"ToolKit",
			"FirstAidKit",
			"Medikit",
			"NVGoggles",
			"Rangefinder",
			"G_Shades_Black",
			"G_Shades_Blue",
			"G_Sport_Blackred",
			"G_Sport_Checkered",
			"G_Sport_Blackyellow",
			"G_Sport_BlackWhite",
			"G_Aviator",
			"G_Squares",
			"G_Lowprofile",
			"G_Combat",
			"B_Kitbag_cbr",
			"B_AssaultPack_blk",
			"B_FieldPack_oucamo",
			"B_FieldPack_blk",
			"B_Bergen_blk",
			"B_Carryall_cbr",
			"B_Carryall_oucamo"];
		
		if(__GETC__(life_medicLevel > 1)) then {
			_allowed pushBack ["V_Chestrig_blk"];
		};
		if(__GETC__(life_medicLevel > 2)) then {
			_allowed pushBack ["V_TacVestIR_blk"];
		};
		if(__GETC__(life_medicLevel > 3)) then {
			_allowed pushBack ["V_PlateCarrier1_blk"];
		};
		
		if(!(_item in _allowed)) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
};

[] call life_fnc_equipGear;