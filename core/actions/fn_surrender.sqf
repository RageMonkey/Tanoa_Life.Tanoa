/*Credits to Joe from BWG

This actually puts the hands on their head instead of behind their back
On Shift-H and Shift-H will make them put their hands behind their back
before allowing player movement.  I found that there didn't seem to be a
get out of the hands up stance, hence the extra line down the bottom which
eases the player out of a hands behind the back situation.

--Blindy

*/

private ["_pos"];

if(player getVariable ["surrender", false]) exitWith { player setVariable ["surrender", false, true]; };
player setVariable ["surrender", true, true];

while { player getVariable ["surrender", false] }  do {
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	
	// Check if player still alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSnonWnonDnon_EaseOut";