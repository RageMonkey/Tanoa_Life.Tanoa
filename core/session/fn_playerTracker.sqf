#include <macro.h>
waitUntil {!(isNull (findDisplay 46))};
/*
	Author: RageMonkey
	
	Description:
	Tracking
*/

[] spawn {
	sleep 5;
	while {true} do
	{	
		private["_playerID","_timePlayed","_side","_cashflow","_balance","_openingBalance","_closingBalance"];
		
		sleep 900;
		_balance = life_RoT_money + life_RoT_atm;
		_playerID = getPlayerUID player;
		_side = side player;
		_cashflow = _balance - life_log_cashflow;
		_timePlayed = 0.25;
		_openingBalance = life_log_opening;
		_closingBalance = _balance;
		
		life_log_cashflow = _balance;
		[[_playerID,_timePlayed,_side,_cashflow,_openingBalance,_closingBalance],"TON_fnc_logInPlayerTracker",false,false] spawn life_fnc_MP;
	}; 
};