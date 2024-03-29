class Life_bountylist_menu {
	idd = 2900;
	name= "life_bountylist_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "$STR_BOUNTY_MenuTitle";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class BountyList : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_getBountyInfo";
			
			x = 0.12; y = 0.26;
			w = 0.40; h = 0.5;
			
			//w = 0.76;
		};

		class BountyInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			//x = 0.42;
			x = 0.50;
			y = 0.25;
			w = 0.40;
			h = 0.6;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AddBountyMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_BOUNTY_AddBounty";
			onButtonClick = "[] spawn life_fnc_addBountyMenu;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			//w = (6.25 / 40);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class TakeBounty : Life_RscButtonMenu {
			idc = 2012;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_BOUNTY_TakeBounty";
			onButtonClick = "[] spawn life_fnc_takeBounty";
			//x = 0.1 + (6.75 / 40) + (1 / 250 / (safezoneW / safezoneH));
			x = 0.1 + (5.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (7.25 / 40);
			h = (1 / 25);
		};
		
	};
};