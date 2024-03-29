/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {250};
	case "I_Truck_02_transport_F": {200};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {200};
	case "I_G_Van_01_transport_F": {200};
	case "C_Van_01_box_F": {250};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Truck_01_box_F": {900}; // Increased from 450
	case "B_Truck_01_transport_F": {650}; // Increased from 325
	case "B_Truck_01_fuel_F": {325};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "B_Heli_Light_01_F": {90};
	case "C_Heli_Light_01_civil_F": {90};					//M900
	case "O_Heli_Light_02_unarmed_F": {210};
	case "B_Heli_Transport_01_F": {190};			//Add GhostHawk
	case "B_Heli_Transport_01_camo_F": {190};			//Add GhostHawk Armed
	case "I_Heli_Transport_02_F": {375};
	case "I_Heli_light_03_unarmed_F": {150};		//Add Hellcat
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "O_Truck_03_transport_F": {650}; // Increased from 285
	case "O_Truck_03_covered_F": {700}; // Increased from 300
	case "O_Truck_03_device_F": {350};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "O_Heli_Transport_04_bench_F": {90};		//Taru Bench
	case "O_Heli_Transport_04_F": {90};				//Taru Lift
	case "B_Heli_Transport_03_unarmed_F": {90};		//Huron Black
	case "B_Heli_Transport_03_black_F": {90};		//Huron Black Armed
	case "Land_Wreck_Traw_F": {10000000};
	case "Land_Wreck_Traw2_F": {10000000};
	case "B_SDV_01_F": {300};						//Sub
	
	
	//Tanoa
	case "C_Offroad_02_unarmed_F": {64};
	case "B_T_LSV_01_armed_F": {64};
	case "B_T_LSV_01_unarmed_F": {64};
	case "O_T_LSV_02_armed_F": {64};
	case "O_T_LSV_02_unarmed_F": {64};
	
	case "C_Plane_Civil_01_F": {300};

	case "B_T_VTOL_01_armed_F": {300};
	case "B_T_VTOL_01_infantry_F": {300};
	case "O_T_VTOL_02_infantry_grey_F": {300};
	case "O_T_VTOL_02_vehicle_grey_F": {300};
			
	
	case "I_C_Boat_Transport_02_F": {320};
	case "C_Scoooter_Transport_01_F": {64};
	
	case "O_T_UAV_04_CAS_F": {300};
	case "B_T_UAV_03_F": {300};
	
	default {-1};
};