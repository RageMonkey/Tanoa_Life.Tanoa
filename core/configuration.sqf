#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_is_usingRange = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = .5; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_isSuiciding = false;
life_action_gathering = false;
life_request_timer = false;
life_fadeSound = false;
life_drink = 0;
life_handcuffs = ObjNull;
life_handcuffkeys = ObjNull;
life_enslaved = false;
life_lumberjack = false;
life_treelop = 0;
//NLR Timer
life_nlrtimer_stop = false;
life_nlrtimer_running = false;
//
//Insanity handles fallout effects
life_insanity = 0;
//End Insanity

//Persistent Saving
__CONST__(life_save_civ,true); //Save weapons for civs?
__CONST__(life_save_yinv,false); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,false); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,2000000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,1000000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
life_spectator_admin_lvl = 2;
life_teleport_admin_lvl = 3;
life_ESP_admin_lvl = 3;
life_ESP_admin_lvl_Always = 4;
 
admin_esp = false;
admin_outfit = [];
admin_outfit_items = [];
admin_vest = [];
admin_vest_items = [];
admin_headgear = [];
admin_goggles = [];

dead_outfit = [];
dead_outfit_items = [];
dead_vest = [];
dead_vest_items = [];
dead_headgear = [];
dead_goggles = [];
dead_backpack = [];
dead_backpack_items = [];

dead_primaryweapon = [];
dead_primaryweapon_items = [];

dead_secondaryweapon = [];
dead_secondaryweapon_items = [];

dead_handgun = [];
dead_handgun_items = [];

life_player_bases = [];
life_all_bases = [];
life_owned_bases = [];

life_base_flares = true;
life_base_defences = true;

life_cur_bounties = [];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_RoT_money = 0;
__CONST__(life_impound_car,1800);
__CONST__(life_impound_boat,1900);
__CONST__(life_impound_air,2000);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;
life_safe_points = 
[
	["extra_safety",60],
	["extra_safety_1",60],
	["extra_safety_2",40],
	["extra_safety_3",30],
	["extra_safety_4",20],
	["extra_safety_5",30],
	["extra_safety_6",20],
	["extra_safety_7",20],
	["extra_safety_8",90],
	["extra_safety_9",120],
	["extra_safety_10",70],
	["extra_safety_11",65],
	["extra_safety_12",85],
	["extra_safety_13",175],
	["extra_safety_14",40],
	["extra_safety_15",50],
	["extra_safety_16",60],
	["extra_safety_17",20],
	["extra_safety_18",180],
	["extra_safety_19",65],
	["extra_safety_20",30],
	["extra_safety_21",50],
	["extra_safety_22",40],
	["extra_safety_23",40],
	["extra_safety_24",120],
	["extra_safety_25",150],
	["extra_safety_26",60],
	["extra_safety_27",30],
	["extra_safety_28",80],
	["extra_safety_29",80],
	["extra_safety_30",50],
	["extra_safety_31",120],
	["extra_safety_32",50]
];
__CONST__(life_safe_points,life_safe_points);

life_vehicles = [];
bank_robber = [];

switch (playerSide) do
{
	case west: 
	{
		life_RoT_atm = 300000; //Starting Bank Money
		life_paycheck = 4000; //Paycheck Amount
	};
	case civilian: 
	{
		life_RoT_atm = 300000; //Starting Bank Money
		life_paycheck = 3000; //Paycheck Amount
	};
	
	case independent: {
		life_RoT_atm = 300000;
		life_paycheck = 5000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_antiairfuel",
	"life_inv_antiairfuelammo",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_zipties",
	"life_inv_kidney",
	"life_inv_scalpel",
	"life_inv_moonshine",
	"life_inv_wine",
	"life_inv_grapes",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_handcuffs",
	"life_inv_handcuffkeys",
	"life_inv_tobacco",
	"life_inv_cigarette",
	"life_inv_uwsl",
	"life_inv_cone",
	"life_inv_barrier",
	"life_inv_wood",
	"life_inv_timber",
	"life_inv_chainsaw",
    "life_inv_uranium",
    "life_inv_uraniumr",
    "life_inv_prayer",
    "life_inv_bdiamond",
    "life_inv_bdiamondc",
    "life_inv_pills",
    "life_inv_chemicals",
    "life_inv_panadol",
    "life_inv_ecstasy",
	"life_inv_paracetamol",
	"life_inv_petrol",
	"life_inv_petrolp",
	"life_inv_alienhead"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_grapes","civ"],
	["license_civ_moonshine","civ"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_cigarette","civ"],
	["license_civ_shipwreck","civ"],
	["license_civ_bounty","civ"],
	["license_civ_lumber","civ"],
	["license_civ_treelopping","civ"],
	["license_civ_rifle","civ"],
    ["license_civ_uranium","civ"],
    ["license_civ_bdiamond","civ"],
	["license_civ_ecstasy","civ"],
	["license_civ_panadol","civ"],
	["license_civ_petrol","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",3300],["cocaine",3000],["cocainep",5000],["marijuana",2000],["cannabis",3000],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["zipties",1000],["goldbar",5000],["kidney",5000],["moonshine",9000],["bottledshine",11000],["handcuffs",200],["handcuffkeys",100],["biamond","3000"],["biamondc","4000"],["uranium","3000"],["uraniumr","4000"]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",2000],
	["turtle",8000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2450],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",3000],
	["iron_r",1100],
	["copper_r",800],
	["salt_r",1000],
	["glass",1350],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1300],
	["goldbar",95000],
	["antiairfuel",10000],
	["antiairfuelammo",2000],
	["blastingcharge",20000],
	["boltcutter",3000],
	["defusekit",1000],
	["zipties",100],
	["kidney",30000],
	["scalpel",2000],
	["wine",800],
	["grapes",70],
	["bottledshine",7000], 
	["bottledwhiskey",3000], 
	["bottledbeer",3000], 
	["moonshine",7000], 
	["whiskey",5000], 
	["beerp",4500], 
	["rye",2000], 
	["hops",1800], 
	["yeast",2000], 
	["bottles",75],
	["handcuffs",200],
	["handcuffkeys",100],
	["tobacco",1000],
	["cigarette",2000],
	["uwsl",5000],
	["cone",100],
	["barrier",150],
	["timber",6000],
    ["uranium",100],
    ["uraniumr",6000],
    ["prayer",5000],
    ["bdiamond",2000],
    ["bdiamondc",5000],
	["panadol",1800],
	["chemicals",1000],
	["pills",225],
	["ecstasy",4000],
	["paracetamol",250],
	["petrol",1500],
	["petrolp",4500],
	["alienhead",1000000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",1000],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["antiairfuel",30000],
	["antiairfuelammo",8000],
	["zipties",100],
	["kidney",50000],
	["scalpel",3000],
	["wine",900],
	["grapes",95],
	["bottledshine",10000], 
	["bottledwhiskey",6000], 
	["bottledbeer",5000], 
	["moonshine",7500], 
	["whiskey",5500], 
	["beerp",5000], 
	["bottles",100],
	["handcuffs",500],
	["handcuffkeys",300],
	["uwsl",10000],
	["cone",1500],
	["barrier",2000],
	["chainsaw",10000],
    ["uranium",2000],
    ["uraniumr",12000],
    ["prayer",10000],
    ["bdiamond",5500],
    ["bdiamondc",6500],
	["panadol",2500],
	["chemicals",2500],
	["pills",250],
	["ecstasy",6000],
	["paracetamol",375],
	["petrol",3000],
	["petrolp",7000],
	["cocainep",10000],
	["heroinp",7000],
	["marijuana",5000],
	["alienhead",1500000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",45],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",450],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_SOS",0],
	["Rangefinder",1000],
	["optic_Aco",850],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",500],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",0],
	["srifle_GM6_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0],
	["5Rnd_127x108_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",10000],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],			//Mohawk
	["I_Heli_light_03_unarmed_F",80000],
	["B_Heli_Transport_01_F",80000],
	["B_Heli_Transport_01_camo_F",85000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",45000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500],
	["B_MRAP_01_hmg_F",50000],
	["O_Heli_Transport_04_bench_F",100000],		//Taru Bench
	["O_Heli_Transport_04_F",100000],			//Taru Lift
	["B_Heli_Transport_03_unarmed_F",100000],	//Huron Black
	["C_Heli_Light_01_civil_F",45000]			//M900
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],						//Mohawk
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["I_Heli_light_03_unarmed_F",80000],
	["B_Heli_Transport_01_F",90000],
	["B_Heli_Transport_01_camo_F",90000],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",10000],
	["B_MRAP_01_hmg_F",10000],
	["O_Heli_Transport_04_bench_F",125000],		//Taru Bench
	["O_Heli_Transport_04_F",125000],			//Taru Lift
	["B_Heli_Transport_03_unarmed_F",125000],	//Huron Black
	["C_Heli_Light_01_civil_F",57000]			//M900
];
__CONST__(life_garage_sell,life_garage_sell);

RoT_RestrictedSling = [
	"I_Truck_02_transport_F",
	"I_Truck_02_covered_F",
	"B_Truck_01_transport_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_box_F",
	"O_Truck_03_device_F"
];
__CONST__(RoT_RestrictedSling,RoT_RestrictedSling);