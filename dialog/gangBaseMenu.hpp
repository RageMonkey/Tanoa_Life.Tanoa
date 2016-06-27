class Life_gang_base {
	idd = 2700;
	name= "life_gang_base";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {		
		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = .14;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Gang Base Computer";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class moneyEdit : Life_RscEdit {
		
			idc = 2702;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.4; y = 0.41;
			w = 0.2; h = 0.03;
		
		};
		
		class GangBaseDeposit : life_RscButtonMenu
		{
			idc = 2705;
			text = "   Gang Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangBaseDeposit";

			x = 0.375;
			y = 0.46;
			w = (10 / 40);
			h = (1 / 25);
		};	
		
		class RentDate : Life_RscStructuredText
		{
			idc = 2708;
			text = "";
			
			x = 0.39;
			y = 0.56;
			w = 0.3;
			h = .14;
		};
		
		class GangBasePayRent : life_RscButtonMenu 
		{
			idc = 2706;
			text = "  Pay Base Rent";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_payGangBaseRent";
			
			x = 0.375;
			//y = 0.512;
			y = 0.664;
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class markerName : Life_RscEdit {
		
			idc = 2707;
			
			shadow = 0;
			text = "x";
			sizeEx = 0.0;
			//x = 0.35; y = 0.2;
			//w = 0.2; h = 0.03;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
			
		};
		
	};
};