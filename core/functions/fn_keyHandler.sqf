#include <macro.h>

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
    {
        if(_shift) then {_handled = true;};
        switch (playerSide) do
        {
            case west:
            {
				if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
				{
					[] call life_fnc_restrainAction;
				};
            };
            //case independent:
            //{
            //if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
            //    {
            //        if([false,"handcuffs",1] call life_fnc_handleInv) then
            //        {
            //            [] call life_fnc_restrainAction;
            //            life_inv_handcuffs = life_inv_handcuffs - 1;
            //            systemChat localize "STR_NOTF_RestrainedPerson";
            //        }else{
            //            systemChat localize "STR_NOTF_NoHandcuffs";
            //        };
            //    };
            //};
            case civilian:
            {				
				if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1 && animationState cursorTarget == "Incapacitated") then
                {
					//Abort if Safe Zone
					if ({player distance getMarkerPos (_x select 0) < _x select 1} count __GETC__(life_safe_points) > 0) exitWith {
						titleText[localize "STR_ISTR_Restrain_Safezone","PLAIN"];
					};	
					
                    if([false,"handcuffs",1] call life_fnc_handleInv) then
                    {
                        [] call life_fnc_restrainAction;
                        life_inv_handcuffs = life_inv_handcuffs - 1;
                        systemChat localize "STR_NOTF_RestrainedPerson";
                    }else{
                        systemChat localize "STR_NOTF_NoHandcuffs";
                    };
                };
				
				
				if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && license_civ_bounty) then
				{
					[] call life_fnc_restrainAction;
				};
								
				
            };
        };
    };

	//Un-Restraining for civs (Shift + N)
	case 49:
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && (cursorTarget getVariable "zipTie") && speed cursorTarget < 1) then
		{
			[] call life_fnc_unzip;
			hint "Unrestraining.";
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] spawn life_fnc_openInventory;
				};
			}
			else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] spawn life_fnc_openInventory;
					};
				}
				else
				{
					private["_shipObj"];
					
					_shipObj = (nearestObjects[player, ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"], 30]) select 0;
					if ((!isNull _shipObj) && (_shipObj getVariable["opened", false])) then
					{
					[_shipObj] spawn life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: 
	{
		//Shift L
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["B_MRAP_01_hmg_F","B_APC_Wheeled_01_cannon_F","I_MRAP_03_hmg_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","C_Heli_Light_01_civil_F","I_Heli_light_03_unarmed_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		//L Only
		if(!_alt && !_ctrlKey && !_shift) then { 
		
			if(!(vehicle player != player)) then {
				[] call life_fnc_radar; 
			} else {
				[] call life_fnc_radarVehicle;
			};
		};
	};

	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	
	//Shift 1 - Surrender // Thanks to Joe from BWG
	case 2:
	{
		if(_shift) then {
			if(vehicle player == player && !(player getVariable["restrained",false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then {
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
		};
		_handled = true
	};
	/*
	// Custom animation: Exercise Kata
	case 3:
	{
		if(_shift) then {
			if(vehicle player == player && !(player getVariable ["restrained",false]) && (animationState player) != "Incapacitated" && !life_istazed) then {
				if (player getVariable ["animating",false]) then {
					player setVariable ["animating", false, true];
				} else {
					["AmovPercMstpSnonWnonDnon_exerciseKata",false] spawn life_fnc_customAnimate;
				};
			};
		};
		_handled = true;
	};
	
	// Custom animation: Bend Knee
	case 4:
	{
		if(_shift) then {
			if(vehicle player == player && !(player getVariable ["restrained",false]) && (animationState player) != "Incapacitated" && !life_istazed) then {
				if (player getVariable ["animating",false]) then {
					player setVariable ["animating", false, true];
				} else {
					["AmovPercMstpSnonWnonDnon_exercisekneeBendA",false] spawn life_fnc_customAnimate;
				};
			};
		};
		_handled = true;
	};
	
	// Custom animation: Pushups
	case 5:
	{
		if(_shift) then {
			if(vehicle player == player && !(player getVariable ["restrained",false]) && (animationState player) != "Incapacitated" && !life_istazed) then {
				if (player getVariable ["animating",false]) then {
					player setVariable ["animating", false, true];
				} else {
					["AmovPercMstpSnonWnonDnon_exercisePushup",false] spawn life_fnc_customAnimate;
				};
			};
		};
		_handled = true;
	};
	
	// Custom animation: Pissing
	case 6:
	{
		if(_shift) then {
			if(vehicle player == player && !(player getVariable ["restrained",false]) && (animationState player) != "Incapacitated" && !life_istazed) then {
				if (player getVariable ["animating",false]) then {
					player setVariable ["animating", false, true];
				} else {
					["Acts_AidlPercMstpSlowWrflDnon_pissing",false] spawn life_fnc_customAnimate;
				};
			};
		};
		_handled = true;
	};
	*/
	//F Key
case 33:
    {    if(_shift) then
            {
                if(playerSide == west && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
                {
                    [] spawn
                    {
                        life_siren2_active = true;
                        sleep 1.2;
                        life_siren2_active = false;
                    };
                    _veh = vehicle player;
                    if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
                    if((_veh getVariable "siren2")) then
                    {
                        titleText ["Yelp Off","PLAIN"];
                        _veh setVariable["siren2",false,true];
                    }
                        else
                    {
                        titleText ["Yelp On","PLAIN"];
                        _veh setVariable["siren2",true,true];
                        [[_veh],"life_fnc_copsiren2",nil,true] spawn life_fnc_MP;
					};
                };
            };

        if (!_shift) then
        {
            if(playerSide == west && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    life_siren_active = true;
                    sleep 4.7;
                    life_siren_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
                if((_veh getVariable "siren")) then
                {
                    titleText ["Sirens Off","PLAIN"];
                    _veh setVariable["siren",false,true];
                }
                    else
                {
                    titleText ["Sirens On","PLAIN"];
                    _veh setVariable["siren",true,true];
                    [[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
                };
            };                                            
        };
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
						[_veh,"house_lock"] call life_fnc_globalSound;
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
						[_veh,"house_unlock"] call life_fnc_globalSound;
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
							
							//M900
							_veh animate ['DoorL_Front_Open', 1];
							_veh animate ['DoorL_Back_Open', 1];
							_veh animate ['DoorR_Front_Open', 1];
							_veh animate ['DoorR_Back_Open', 1];
							//
							
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							
							//M900
							_veh animate ['DoorL_Front_Open', 1];
							_veh animate ['DoorL_Back_Open', 1];
							_veh animate ['DoorR_Front_Open', 1];
							_veh animate ['DoorR_Back_Open', 1];
							//
							
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						};
						systemChat localize "STR_MISC_VehUnlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							
							//M900
							_veh animate ['DoorL_Front_Open', 0];
							_veh animate ['DoorL_Back_Open', 0];
							_veh animate ['DoorR_Front_Open', 0];
							_veh animate ['DoorR_Back_Open', 0];
							//
							
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							
							//M900
							_veh animate ['DoorL_Front_Open', 0];
							_veh animate ['DoorL_Back_Open', 0];
							_veh animate ['DoorR_Front_Open', 0];
							_veh animate ['DoorR_Back_Open', 0];
							//
							
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						};	
						systemChat localize "STR_MISC_VehLock";
					};
					[_veh,"locksound"] call life_fnc_globalSound;
					if(typeOf _veh in (__GETC__(RoT_RestrictedSling))) then {
						_veh enableRopeAttach false;
					} else {
						_veh enableRopeAttach true;
					};
				};
			};
		};
	};
	
	// Inventory open prevent
	case 23: {
		if(!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR alive cursorTarget)) then {
			closeDialog 0;
			closeDialog 0;
		};
	};
	
	//Shift+T = Faded Sound
	case 25:
	{
		if(_shift) then
		{
			[] call life_fnc_fadeSound;
			_handled = true;
		};
	};

	// O, Cop gate opener
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};
	
};

_handled;