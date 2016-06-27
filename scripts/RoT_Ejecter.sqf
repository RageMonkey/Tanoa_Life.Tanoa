/*
	File: RoT_Ejecter.sqf
	Author: Spadge
	
	Description:
	Eject a driver from specified vehicles.
*/

while {alive player} do
{
	waitUntil {vehicle player isKindOf "Car"};
	if(driver (vehicle player) == "I_MRAP_03_F" && !(playerSide == independent)) then {player action ["eject",vehicle player];};
	sleep 2.0;
};