/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	//SDV
	case "B_SDV_01_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0,0.7,1,0.2)","civ","#(argb,8,8,3)color(1,1,1,0.2)"]
		];
	};
	
	//Taru Lift
	case "O_Heli_Transport_04_F":
	{
		_ret =
		[
			[objNull,"reb"],
			[objNull,"donate"],	
			["#(argb,8,8,3)color(0,0.7,1,0.2)","civ","#(argb,8,8,3)color(1,1,1,0.2)"],
			["#(argb,8,8,3)color(0,0.7,1,0.2)","donate","#(argb,8,8,3)color(1,1,1,0.2)"]
		];
	};

	case "O_MRAP_02_F":
	{
		_ret =
		[
			[null,"civ"],
			["textures\civ\vehicles\ifrit_side_green.jpg","donate","textures\civ\vehicles\ifrit_back_green.jpg"],	
			["#(argb,8,8,3)color(0.518,0.519,0.455,0.2)","donate","#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"]
		];
	};	
	
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			[null,"donate"],
			["#(argb,8,8,3)color(0.518,0.519,0.455,0.2)","donate","#(argb,8,8,3)color(0.518,0.519,0.455,0.2)","#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","donate"],
			[_path + "hatchback_01_ext_sport02_co.paa","donate"],
			[_path + "hatchback_01_ext_sport03_co.paa","donate"],
			[_path + "hatchback_01_ext_sport04_co.paa","donate"],
			[_path + "hatchback_01_ext_sport05_co.paa","donate"],
			[_path + "hatchback_01_ext_sport06_co.paa","donate"],
			["textures\cop\vehicles\sports_official.jpg","cop"],
			["textures\med\vehicles\EMS_hatchback.jpg","med"],
			["textures\civ\vehicles\sports_green.jpg","donate"],
			["textures\civ\vehicles\sports_blue.jpg","donate"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["textures\cop\vehicles\offroad_official.jpg","cop"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\cop\vehicles\suv_official.jpg","cop"],
			["textures\med\vehicles\EMS_SUV.jpg","med"],
			["textures\civ\vehicles\suv_red.jpg","civ"],
			["textures\civ\vehicles\suv_blue.jpg","civ"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\med\vehicles\EMS_ambulance_front.jpg","med","textures\med\vehicles\EMS_ambulance_back.jpg"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["textures\cop\vehicles\hummingbird_official.jpg","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\med\vehicles\EMS_M900.jpg","med"] // Applying M900 skin to Hummingbird
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\med\vehicles\EMS_Heli.jpg","med"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\cop\vehicles\hunter_blue_body.jpg","cop","textures\cop\vehicles\hunter_blue_back.jpg"],
			["textures\cop\vehicles\hunter_blue_body.jpg","cop","textures\cop\vehicles\hunter_blue_back.jpg"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["textures\cop\vehicles\hellcat_official.jpg"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\cop\vehicles\hunter_blue_body.jpg","cop","textures\cop\vehicles\hunter_blue_back.jpg"],
			["textures\cop\vehicles\hunter_blue_body.jpg","cop","textures\cop\vehicles\hunter_blue_back.jpg"]
		];
	};
	
	case "B_Truck_01_fuel_F":
	{
		_ret =
		[
			["textures\civ\vehicles\hemtt_fuel_1_base.jpg","civ","textures\civ\vehicles\hemtt_fuel_2_primer.jpg","textures\civ\vehicles\hemtt_fuel_3_finish.jpg"]
		];
	};
	
	case "B_Heli_Transport_01_F":
	{
		_ret =
		[
			["textures\cop\vehicles\ghosthawk_swat_front.jpg","cop","textures\cop\vehicles\ghosthawk_swat_back.jpg"],
			["textures\cop\vehicles\ghosthawk_swat_front.jpg","cop","textures\cop\vehicles\ghosthawk_swat_back.jpg"]
		];
	};
	
	case "B_Heli_Transport_01_camo_F":
	{
		_ret =
		[
			["textures\cop\vehicles\ghosthawk_swat_front_black.jpg","cop","textures\cop\vehicles\ghosthawk_swat_back_black.jpg"],
			["textures\cop\vehicles\ghosthawk_swat_front_black.jpg","cop","textures\cop\vehicles\ghosthawk_swat_back_black.jpg"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret =
		[
			["textures\med\vehicles\EMS_STRIDER.jpg","med"]
		];
	};
	
	case "B_Heli_Transport_03_black_F":
	{
		_ret =
		[
			["textures\cop\vehicles\ghosthawk_swat_front_black.jpg","cop","textures\cop\vehicles\ghosthawk_swat_front_black.jpg"]
		];
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret =
		[
			["textures\cop\vehicles\ghosthawk_swat_front_black.jpg","cop","#(argb,8,8,3)color(0.5,0.5,0.8,0.02)"]
		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = [
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","xxx"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","donate"],
			["textures\cop\vehicles\hummingbird_official.jpg","cop"],
			["textures\med\vehicles\EMS_M900.jpg","med"]
		];
	};
};

_ret;