/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_RoT_atm) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && life_RoT_atm > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

life_RoT_money = life_RoT_money + _val;
life_RoT_atm = life_RoT_atm - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;