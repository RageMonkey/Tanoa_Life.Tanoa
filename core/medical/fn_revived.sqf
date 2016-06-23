/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(life_RoT_atm > (call life_revive_fee)) then {
	life_RoT_atm = life_RoT_atm - (call life_revive_fee);
} else {
	life_RoT_atm = 0;
};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[[player,0,"textures\med\clothing\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
life_corpse setVariable["realname",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
deleteVehicle life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["realname",profileName,TRUE];
life_istazed = false;
life_istranq = false;
//player setVariable["restrained",nil,TRUE];
//player setVariable["Escorting",nil,TRUE];
//player setVariable["transporting",nil,TRUE];
//player setVariable["surrender",nil,TRUE];

//Kill Confirmed
player setVariable["killConfirmed",nil,true];

player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",false,true];
player setVariable["hostage",false,true];
player setVariable["surrender",false,TRUE];


[] call life_fnc_hudUpdate; //Request update of hud.

[] call life_fnc_equipGear;

	if(playerSide == civilian) then {
		//Give Gear Back after Revive
		player addGoggles dead_goggles;
		player addHeadGear dead_headgear;
		//player forceAddUniform dead_outfit;
		player addVest dead_vest;
		player addBackpack dead_backpack;
		
		//Force a number of key items onto player
		if(!("ItemMap" in (assignedItems player))) then { player addItem "ItemMap"; player assignItem "ItemMap";};
		if(!("ItemCompass" in (assignedItems player))) then { player addItem "ItemCompass"; player assignItem "ItemCompass";};
		if(!("ItemWatch" in (assignedItems player))) then { player addItem "ItemWatch"; player assignItem "ItemWatch";};
		if(!("ItemGPS" in (assignedItems player))) then { player addItem "ItemGPS"; player assignItem "ItemGPS";};
		if(!("NVGoggles" in (assignedItems player))) then { player addItem "NVGoggles"; player assignItem "NVGoggles";};
		
		//Give previous items
		{player addItemToVest _x} foreach dead_vest_items;
		{player addItemToUniform _x} foreach dead_outfit_items;
		{player addItemToBackpack _x} foreach dead_backpack_items;
		
		//Give previous Primary Weapon & Items
		player addWeapon dead_primaryweapon;
		{player addPrimaryWeaponItem  _x} foreach dead_primaryweapon_items;
			
		//Secondary weapons isn't pistols by the looks of it maybe launcher?
		//player addWeapon dead_secondaryweapon;
		//{player addSecondaryWeaponItem  _x} foreach dead_secondaryweapon_items;
		
		//Give previous Handgun & Items
		player addWeapon dead_handgun;
		{player addHandgunItem  _x} foreach dead_handgun_items;

					
		[] call life_fnc_equipGear;
		[] call SOCK_fnc_updateRequest;
	};
	
	//NLR Timer
	life_nlrtimer_stop = true;
	//
	