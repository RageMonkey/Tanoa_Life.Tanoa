/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_civ"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

//Monitor excessive restraint
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (3 * 60)};
		
		if(!(player getVariable["zipTie",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["zipTie",FALSE]) && vehicle player == player) exitWith {
			player setVariable["zipTie",FALSE,TRUE];
			titleText["You have been released automatically for excessive restraint time","PLAIN"];
		};
	};
};

titleText[format["You have been ziptied by %1",name _civ],"PLAIN"];
				
while {player getVariable "zipTie"} do
{
	if(vehicle player == player) then {
 		player playMove "AmovPercMstpSnonWnonDnon_Ease";
 	};
 	
	//player playMove "AmovPercMstpSnonWnonDnon_Ease";
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "zipTie") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["zipTie",false,true];
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	//titleText["You have been released, press V to get out of ziptie.","PLAIN"];
	titleText["You have been released.","PLAIN"];
};