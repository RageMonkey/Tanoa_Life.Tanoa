#include <macro.h>
/*
Skins players
*/

sleep 0.5;

if (playerSide == west) then {
	if ((uniform player) == "U_BG_Guerilla2_1") then
	{
			player setObjectTextureGlobal [0, "textures\cop\clothing\Cadet.jpg"];
	};
	
	if ((uniform player) == "U_Rangemaster") then
	{
		player setObjectTextureGlobal [0, "textures\cop\clothing\PoliceOfficer.jpg"];
	};
	
	if ((uniform player) == "U_B_SpecopsUniform_sgg") then
	{
		player setObjectTextureGlobal [0, "textures\cop\clothing\SWAT.jpg"];
	};
	
	if ((uniform player) == "U_Competitor") then
	{
		player setObjectTextureGlobal [0, "textures\cop\clothing\HighwayCostume.jpg"];
	};
	
	if ((uniform player) == "U_B_Wetsuit") then
	{
		player setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0.08,0.21,0.2)"];
	};
	
	if(backpack player != "") then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
	
	
};

if (playerSide == independent) then {
	if ((uniform player) == "U_Competitor") then
	{
		player setObjectTextureGlobal [0, "textures\med\clothing\medic_uniform.jpg"];
	};
	if ((uniform player) == "U_B_HeliPilotCoveralls") then
	{
		player setObjectTextureGlobal [0, "textures\civ\clothing\jailed.jpg"];
	};
	
	if(backpack player != "") then {
		(unitBackpack player) setObjectTextureGlobal [0,""];
	};
};

if  (playerSide == civilian) then {
	if ((uniform player) == "U_Competitor") then
	{
		player setObjectTextureGlobal [0, "textures\civ\clothing\miningco_uniform.jpg"];
	};
	if ((uniform player) == "U_B_HeliPilotCoveralls") then
	{
		player setObjectTextureGlobal [0, "textures\civ\clothing\jailed.jpg"];
	};
	
	//Bounty Hunter
	if ((uniform player) == "U_OG_Guerrilla_6_1") then
	{
		if(license_civ_bounty) then {
			player setObjectTextureGlobal[0,"#(argb,8,8,3)color(0.9,0.9,0.9,0.01)"];
		};
	};
};