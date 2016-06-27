/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["hostage",FALSE,TRUE];
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Kill Confirmed
_unit spawn
{
	[[player], "life_fnc_onPlayerConfirmedKilled", _unit, false] spawn life_fnc_MP;
};

//Missing Organs
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
_unit setVariable["hasOrgan",FALSE,TRUE]; 
[8] call SOCK_fnc_updatePartial;

//Slave
_unit setVariable["enslaved",FALSE,TRUE];
life_enslaved = false;
[10] call SOCK_fnc_updatePartial;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

	//Remove all Gear while dead (Combat Logging) 
	if(playerSide == civilian) then {
		
		//Capture what they are wearing so we can restore it later
		dead_outfit = uniform player;
		dead_outfit_items = uniformItems player;
		dead_vest = vest player;
		dead_vest_items = vestItems player;
		dead_headgear = headGear player;
		dead_goggles = goggles player;
		dead_backpack = backpack player;
		dead_backpack_items = backpackItems player;
		
		dead_primaryweapon = primaryWeapon player;
		dead_primaryweapon_items = primaryWeaponItems player;

		dead_secondaryweapon = secondaryWeapon player;
		dead_secondaryweapon_items = secondaryWeaponItems player;

		dead_handgun = handgunWeapon player;
		dead_handgun_items = handgunItems player;
		
		//Remove Everything
		removeHeadGear player;
		removeUniform player;
		removeVest player;
		removeGoggles player;
		removeBackpack player;
		
		player removeWeapon (primaryWeapon player);
		player removeWeapon (handGunWeapon player);
		
		player forceAddUniform dead_outfit; //Add uniform back on
		
		[] call SOCK_fnc_updateRequest;
	};
	
	
	
//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this || life_request_timer};
	
	if (life_request_timer) then {
		_maxTime = time + (life_respawn_timer * 300); // 300 * 0.5 == 150 == 2.5min
		waitUntil {
			_Timer ctrlSetText format["Respawn Available in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
			round(_maxTime - time) <= 0 || isNull _this
		};
	};
	life_request_timer = false; //resets increased respawn timer
	
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//NLR Timer
if(life_nlrtimer_running) then
{
life_nlrtimer_stop = true;
waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;
//


//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	} else {
		if(vehicle _killer isKindOf "Air") then {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			//Get rid of this if you don't want automatic vehicle license removal.
			if(!local _killer) then {
				[[4],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
			};
		} else {
			if(vehicle _killer isKindOf "Ship") then {
				[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				//Get rid of this if you don't want automatic vehicle license removal.
				if(!local _killer) then {
					[[5],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
				};
			} else {
				[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				if(!local _killer) then {
					[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
				};
			};
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_RoT_money > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_RoT_money] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_RoT_money = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_RoT_money = 0;

player enableFatigue false;

[] call life_fnc_equipGear;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide,license_civ_rebel],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
if(playerSide != west) then {
	[3] call SOCK_fnc_updatePartial;
};