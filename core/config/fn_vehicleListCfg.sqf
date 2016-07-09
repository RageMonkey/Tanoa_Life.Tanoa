#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	
	case "med_shop":
	{
		_return pushBack ["C_SUV_01_F",20000];
		
		// Level 2+
		//if(__GETC__(life_medicLevel) > 1) then {
			_return pushBack["C_Van_01_box_F",40000];
			
			if(__GETC__(life_member) > 2) then
			{
				_return pushBack ["C_Hatchback_01_sport_F",100000];
			};
		//};
		
		// Level 3+
		if(__GETC__(life_medicLevel) > 2) then {
			
		};
		
		// Level 4+
		if(__GETC__(life_medicLevel) > 3) then {
			//_return pushBack ["I_MRAP_03_F",30000];
		};
	};
	
	case "med_air_hs": {
		_return pushBack ["B_Heli_Light_01_F",50000];
		// Level 2+
		//if(__GETC__(life_medicLevel) > 1) then {
			_return pushBack ["O_Heli_Light_02_unarmed_F",75000];
			if(__GETC__(life_member) > 2) then {
				_return pushBack ["C_Heli_Light_01_civil_F",50000];
			};
		//};
		
		// Level 3+
		if(__GETC__(life_medicLevel) > 2) then {
		
		};
		
		// Level 4+
		if(__GETC__(life_medicLevel) > 3) then {
		
		};
	};
	
	case "civ_car":
	{
		_return = 
		[
			["C_Offroad_02_unarmed_F",50000],
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000],
			["C_Hatchback_01_sport_F",100000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["O_Truck_03_device_F",450000],
			["C_Van_01_Fuel_F",7500],
			["B_Truck_01_fuel_F",150000],
			["B_Truck_01_box_F",250000]
		];	
	};
	
	case "reb_car":
	{
		_return pushBack ["B_Quadbike_01_F",2500];
		_return pushBack ["B_G_Offroad_01_F",15000];
		_return pushBack ["O_MRAP_02_F",150000];
		_return pushBack ["B_Heli_Light_01_F",325000];
		
		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",1000000]; //Taru Bench
			_return pushBack ["O_Heli_Transport_04_F",1200000]; //Taru Lift
		};
	};
	
	case "cop_car":
	{
		//Level 0 & 1 (Constable & Pubslot)
		_return pushBack ["C_Offroad_01_F",5000];
		_return pushBack ["C_SUV_01_F",20000];
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",100000];
			_return pushBack ["O_T_LSV_02_unarmed_F",75000];
		};
		
		//Level 3 (Leading Senior Constable)
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_MRAP_01_F",75000];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["O_T_LSV_02_armed_F",125000];
		};
		
		//Level 5 (Senior Sergeant)
		
		//Level 6 (Captain)
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["B_MRAP_01_hmg_F",750000];
		};
		
		
		
		
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",600000],
			["I_Heli_Transport_02_F",1000000], 		//Mohawk
			["C_Heli_Light_01_civil_F",375000],		//M900
			["O_Heli_Transport_04_F",1200000],		//Taru Lift Salvage
			["B_Heli_Light_01_F",200000]
		];
	};
	
	case "cop_air":
	{
		//Level 0 (Pubslot)
		_return pushBack ["C_Heli_Light_01_civil_F",75000];
		
		//Level 1 (Constable)
		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["B_Heli_Light_01_F",100000];
		};
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",300000];
		};
		
		//Level 3 (Leading Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["O_T_VTOL_02_infantry_F",400000];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",400000];
		};
		
		//Level 5 (Senior Sergeant)
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_camo_F",500000];
		};
		
		//Level 6 (Captain)
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["B_Heli_Transport_03_black_F",600000];
		};
	};
	
	case "cop_airhq":
	{
		//Level 0 (Pubslot)
		_return pushBack ["C_Heli_Light_01_civil_F",75000];
		
		//Level 1 (Constable)
		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["B_Heli_Light_01_F",100000];
		};
		
		//Level 2 (Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",300000];
		};
		
		//Level 3 (Leading Senior Constable)
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["O_T_VTOL_02_infantry_grey_F",400000];
			_return pushBack ["O_T_VTOL_02_vehicle_grey_F",400000];
		};
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",400000];
		};
		
		//Level 5 (Senior Sergeant)
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_camo_F",500000];
		};
		
		//Level 6 (Captain)
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["B_Heli_Transport_03_black_F",600000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Scoooter_Transport_01_F",25000],
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",120000],
			["C_Boat_Transport_02_F"]
		];
	};

	case "cop_ship":
	{
		_return pushBack ["B_Boat_Transport_01_F",3000];
		_return pushBack ["C_Boat_Civil_01_police_F",20000];
		_return pushBack ["B_SDV_01_F",100000];
		_return pushBack ["I_C_Boat_Transport_02_F"];
		
		//Level 4 (Sergeant)
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["B_Boat_Armed_01_minigun_F",75000];
		};
	};
	
	case "donator_1":
	{
		//_return pushBack ["B_T_VTOL_01_armed_F",1500000];
		//_return pushBack ["B_T_UAV_03_F",1000];
		//_return pushBack ["O_T_UAV_04_CAS_F",1000];
		
		
		if(__GETC__(life_member) > 2) then
		{
			_return pushBack ["C_Offroad_02_unarmed_F",50000];
			_return pushBack ["B_T_LSV_01_unarmed_F",75000];
			_return pushBack ["B_T_LSV_01_armed_F",500000];
			_return pushBack ["C_Plane_Civil_01_F",1500000];
			_return pushBack ["C_Plane_Civil_01_racing_F",1500000];
			_return pushBack ["I_C_Plane_Civil_01_F",1500000];
			_return pushBack ["B_T_VTOL_01_vehicle_F",1500000];
			_return pushBack ["B_T_VTOL_01_infantry_F",1500000];
			_return pushBack ["O_MRAP_02_F",150000];					//Ifrit
			_return pushBack ["C_Hatchback_01_sport_F",100000];
			_return pushBack ["I_Heli_Transport_02_F",1000000];			//Mohawk
			_return pushBack ["O_Heli_Transport_04_bench_F",1000000];	//Taru Bench
			_return pushBack ["O_Heli_Transport_04_F",1200000];			//Taru Lift
			_return pushBack ["C_Heli_Light_01_civil_F",375000];		//M900
			
		};
		
		
		
		if(__GETC__(life_member) > 0) then
		{
			//_return pushBack ["B_Quadbike_01_F",1000];
			//_return pushBack ["C_Offroad_01_F",3750];
			//_return pushBack ["C_SUV_01_F",20000];
		};

		if(__GETC__(life_member) > 1) then
		{
			_return pushBack ["C_Van_01_Fuel_F",7500];
			_return pushBack ["B_Truck_01_fuel_F",150000];
			_return pushBack ["B_Truck_01_box_F",250000];
			_return pushBack ["B_Heli_Light_01_F",200000];
			_return pushBack ["O_Heli_Light_02_unarmed_F",600000];
		};
		

	};
};

_return;
