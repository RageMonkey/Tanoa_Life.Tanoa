#include <macro.h>
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_curMag","_handled"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_handled = false;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

if(!isNull _source) then {
	if(_source != _unit) then {
		// Tazer!
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"]) then { 
			_curWep = currentWeapon _source;
			if(_curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
				if(side _source == west && playerSide != west) then {
					private["_distance","_isVehicle","_isQuad"];
					_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
					_isVehicle = if(vehicle player != player) then {true} else {false};
					_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["B_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"]) then {true} else {false}} else {false};
					
					_damage = false;
					_handled = true;
					if(_unit distance _source < _distance) then 
					{
						if(!life_istazed && !(_unit getVariable["restrained",false])) then 
						{
							if(_isVehicle && _isQuad) then 
							{
								player action ["Eject",vehicle player];
								[_unit,_source] spawn life_fnc_tazed;
							}; 
							if(vehicle player == player) then 
							{
								[_unit,_source] spawn life_fnc_tazed;
							};
						};
					};
				};
			};
		};
		
		// Rubber Bullets!
		if(_projectile in ["B_65x39_Caseless"]) then {
			_curMag = currentMagazine _source;
			if(_curMag in ["30Rnd_65x39_caseless_mag_Tracer"]) then {
				if(side _source == west && playerSide != west) then {
					private["_isVehicle","_isQuad"];
					_isVehicle = if(vehicle player != player) then {true} else {false};
					_isQuad = if(_isVehicle) then {if(typeOf(vehicle player) in ["B_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"]) then {true} else {false}} else {false};
					_damage = false;
					_handled = true;
					if(!(_unit getVariable["downed",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_handleDowned;
						};
						if(vehicle player == player) then {
							[_unit,_source] spawn life_fnc_handleDowned;
						};
					};
				};
			};
		};
		
		//Tranq
		if(_projectile in ["B_127x54_Ball"]) then {
			_curWep = currentWeapon _source;
			if(_curWep in ["srifle_DMR_04_Tan_F","srifle_DMR_04_F"]) then {
				if(side _source == civillian && playerSide != civillian) then {
					private["_distance","_isVehicle","_isQuad"];
					_distance = if(_projectile == "B_127x54_Ball") then {200} else {200};
					_isVehicle = if(vehicle player != player) then {true} else {false};
					_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["B_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"]) then {true} else {false}} else {false};
					
					_damage = false;
					_handled = true;
					if(_unit distance _source < _distance) then 
					{
						if(!life_istranq && !(_unit getVariable["restrained",false])) then 
						{
							if(_isVehicle && _isQuad) then 
							{
								player action ["Eject",vehicle player];
								[_unit,_source] spawn life_fnc_tranq;
							}; 
							if(vehicle player == player) then 
							{
								[_unit,_source] spawn life_fnc_tranq;
							};
						};
					};
				};
			};
		};
	};
};

if(!_handled) then {
	if(!isNull _source) then {
		if(_source != _unit) then {
			if(side _source != west && _source != _unit && !local _source) then {
				private ["_dropOut"];
				_dropOut = false;
				
				if ({_unit distance getMarkerPos (_x select 0) < _x select 1} count (__GETC__(life_safe_points)) > 0) then {
					_damage = false;
					//_source setDamage 0.5;
					_gridSpace = mapGridPosition getPos _unit;
					_msg = format["%1 Just tried to kill %2 in a safezone at grid: %3", name _source, name _unit, _gridSpace];
					//[[_msg,name _unit,1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
					//[[1,format["%1 just tried to kill %2 in a safezone, please inform an admin", name _source, name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
					[_unit] spawn life_fnc_knockedDownSafe;
				};
			};
		};
	};
};





[] call life_fnc_hudUpdate;
_damage;
