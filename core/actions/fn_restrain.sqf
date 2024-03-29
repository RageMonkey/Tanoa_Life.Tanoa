/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_restrainer","_player"];
_restrainer = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
[13] call SOCK_fnc_updatePartial; //Set Database Arrest


//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};
		
		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && !([civilian,getPos player,30] call life_fnc_nearUnits) && !([independent,getPos player,30] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrained",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			player setVariable["hostage",false,true];
			detach player;
			titleText[localize "STR_restrainer_ExcessiveRestrain","PLAIN"];
			[12] call SOCK_fnc_updatePartial; //UnSet Database Arrest
		};
	};
};

titleText[format[localize "STR_Cop_Retrained",_restrainer getVariable["realname",name _restrainer]],"PLAIN"];
				
while {player getVariable "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		player setVariable ["hostage",false,true];
		[12] call SOCK_fnc_updatePartial; //UnSet Database Arrest
		detach _player;
	};
	
	if(!alive _restrainer) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
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
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	[12] call SOCK_fnc_updatePartial; //UnSet Database Arrest
	detach player;
}; 