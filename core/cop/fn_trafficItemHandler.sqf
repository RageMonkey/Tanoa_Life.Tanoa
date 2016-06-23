/*

	Author: RageMonkey
	
	Description:
	Deploy & Pickup Traffic Items


*/

private["_arguments","_item","_type","_action","_inventoryAction","_handlerToHandle"];

_arguments = _this select 3;
_item = _arguments select 0;
_action = _arguments select 1;
_handlerToHandle = false;
_inventoryAction = -1;
if (_action == "pickup") then {
	_inventoryAction = 1;
} else {
	_inventoryAction = -1;
};

switch(true) do
{
	case (_item == "barrier"): {
		_type = "RoadBarrier_F";
		life_carryWeight = life_carryWeight + (([_item] call life_fnc_itemWeight) * _inventoryAction);
		life_inv_barrier = life_inv_barrier + _inventoryAction;
		_handlerToHandle = true;
	};
	case (_item == "cone"): {
		_type = "RoadCone_F";
		life_carryWeight = life_carryWeight + (([_item] call life_fnc_itemWeight) * _inventoryAction);
		life_inv_cone = life_inv_cone + _inventoryAction;
		_handlerToHandle = true;
	};
	case (_item == "spikeStrip"): {
		_type = "Land_Razorwire_F";
		[] spawn life_fnc_spikeStrip;
		life_carryWeight = life_carryWeight + (([_item] call life_fnc_itemWeight) * _inventoryAction);
		life_inv_spikeStrip = life_inv_spikeStrip + _inventoryAction;
		_handlerToHandle = false;
	};
};

if (_action == "deploy" && _handlerToHandle) then {
	_pos = position player;
	_trafficItem = _type createVehicle ([0,0,0]);
	_dir = getDir player;
	_trafficItem setpos _pos;
	_trafficItem setDir _dir;
};

if (_action == "pickup" && _handlerToHandle) then {
	_list = position player nearObjects [_type,3.5];
	_trafficItem = (_list select 0);
	deleteVehicle _trafficItem;
};