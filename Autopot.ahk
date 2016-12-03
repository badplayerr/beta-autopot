;██████╗ ██╗   ██╗     ██████╗ ██╗   ██╗██████╗ ██╗   ██╗██████╗ 
;██╔══██╗╚██╗ ██╔╝    ██╔════╝ ██║   ██║██╔══██╗██║   ██║██╔══██╗
;██████╔╝ ╚████╔╝     ██║  ███╗██║   ██║██████╔╝██║   ██║██║  ██║
;██╔══██╗  ╚██╔╝      ██║   ██║██║   ██║██╔══██╗██║   ██║██║  ██║
;██████╔╝   ██║       ╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝██████╔╝
;╚═════╝    ╚═╝        ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                                                                
;-------GUI-----------------GUI-----------------GUI-----------------GUI-----------------GUI----------

#SingleInstance force

IniRead, LastTab, Config.ini, Config, LastTab, Settings

If LastTab = AutoFlask
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask||AutoQuit|Others|Settings|
}
Else If LastTab = AutoQuit
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit||Others|Settings|
}
Else If LastTab = Others
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others||Settings|
}
Else If LastTab = Settings
{
   Gui,Add,Tab2, x0 y0 w474 h595 gTabFunc vTabChoice,AutoFlask|AutoQuit|Others|Settings||
}

Gui, Tab, Settings

Gui, Add, GroupBox, x12 y110 w220 h60, AutoFlask/AutoQuit Profile

IniRead, ConfigNumber , Config.ini, Config, ConfigNumber, 1

If ConfigNumber = 1
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1||Profile 2|Profile 3|Profile 4|Profile 5
}
Else If ConfigNumber = 2
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2||Profile 3|Profile 4|Profile 5
}
Else If ConfigNumber = 3
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3||Profile 4|Profile 5
}
Else If ConfigNumber = 4
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3|Profile 4||Profile 5
}
Else If ConfigNumber = 5
{
   Gui, Add, DropDownList, x22 y130 w200 h21 AltSubmit gConfigList vConfigChoice R5 , Profile 1|Profile 2|Profile 3|Profile 4|Profile 5||
}

Loop, 5
{
	If ConfigNumber = %A_Index%
	{
		IniRead, minLifePercentToQuit , Config.ini, Config%A_Index%, minLifePercentToQuit, 35
		IniRead, minESPercentToQuit , Config.ini, Config%A_Index%, minESPercentToQuit, 0
		IniRead, maxLifePercentPerHitToQuit , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit, 50
		IniRead, maxESPercentPerHitToQuit , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit, 0
		IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
		IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
		IniRead, minESPercentToJade , Config.ini, Config%A_Index%, minESPercentToJade, 0
		IniRead, minLifePercentToElementalResist , Config.ini, Config%A_Index%, minLifePercentToElementalResist, 70
		IniRead, minESPercentToElementalResist , Config.ini, Config%A_Index%, minESPercentToElementalResist, 0
		IniRead, minLifePercentToDrink , Config.ini, Config%A_Index%, minLifePercentToDrink, 55
		IniRead, minManaPercentToDrink , Config.ini, Config%A_Index%, minManaPercentToDrink, 25
		IniRead, minManaToDrinkPot , Config.ini, Config%A_Index%, minManaToDrinkPot, 15
		IniRead, minLifePercentToSpam, Config.ini, Config%A_Index%, minLifePercentToSpam, 35
		IniRead, ResyncSpam, Config.ini, Config%A_Index%, ResyncSpam, 0
      IniRead, RemainingSpam, Config.ini, Config%A_Index%, RemainingSpam, 0
		IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
		IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
		IniRead, RemoveAilmentsTimer , Config.ini, Config%A_Index%, RemoveAilmentsTimer, 10
      IniRead, RemoveCorruptedBloodCharges , Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges, 10
	}	
}

IniRead, QuickSilverCheck , Config.ini, Config, QuickSilverCheck, 0

IniRead, QuickSilverCheck2 , Config.ini, Config, QuickSilverCheck2, 0

IniRead, FlaskOnFrozenCheck , Config.ini, Config, FlaskOnFrozenCheck, 0

IniRead, FlaskOnShockedCheck , Config.ini, Config, FlaskOnShockedCheck, 0

IniRead, FlaskOnIgnitedCheck , Config.ini, Config, FlaskOnIgnitedCheck, 0

IniRead, AttackInPlaceCheck , Config.ini, Config, AttackInPlaceCheck, 0

IniRead, HoldCtrlCheck , Config.ini, Config, HoldCtrlCheck, 0

IniRead, FlaskOnCurseCheck , Config.ini, Config, FlaskOnCurseCheck, 0

IniRead, FlaskOnCorruptedBloodCheck , Config.ini, Config, FlaskOnCorruptedBloodCheck, 0

Gui, Tab, AutoFlask

Gui, Add, GroupBox, x12 y250 w220 h60 , Min Life `% to Use Jade/Granite Flask
Gui, Add, Slider, x22 y270 w170 h30 gGuiUpdate vminLifePercentToJade +ToolTip TickInterval25, %minLifePercentToJade%
Gui, Add, Text, x192 y270 w20 h30 vminLifePercentToJadeUpdate , %minLifePercentToJade%
Gui, Add, Text, x212 y270 w10 h30 vminLifePercentToJadeUpdatePercent, `%

Gui, Add, GroupBox, x242 y250 w220 h60 , Min E.Shield `% to Use Jade/Granite Flask
Gui, Add, Slider, x252 y270 w170 h30 gGuiUpdate vminESPercentToJade +ToolTip TickInterval25, %minESPercentToJade%
Gui, Add, Text, x422 y270 w20 h30 vminESPercentToJadeUpdate, %minESPercentToJade%
Gui, Add, Text, x442 y270 w10 h30 vminESPercentToJadeUpdatePercent, `%

Gui, Add, GroupBox, x12 y320 w220 h60 , Min Life `% to Use Elemental Resist Flask
Gui, Add, Slider, x22 y340 w170 h30 gGuiUpdate vminLifePercentToElementalResist +ToolTip TickInterval25, %minLifePercentToElementalResist%
Gui, Add, Text, x192 y340 w20 h30 vminLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
Gui, Add, Text, x212 y340 w10 h30 vminLifePercentToElementalResistUpdatePercent, `%

Gui, Add, GroupBox, x242 y320 w220 h60 , Min E.Shield `% to Use Element. Resist Flask
Gui, Add, Slider, x252 y340 w170 h30 gGuiUpdate vminESPercentToElementalResist +ToolTip TickInterval25, %minESPercentToElementalResist%
Gui, Add, Text, x422 y340 w20 h30 vminESPercentToElementalResistUpdate, %minESPercentToElementalResist%
Gui, Add, Text, x442 y340 w10 h30 vminESPercentToElementalResistUpdatePercent, `%

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Drink Health Potion
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToDrink +ToolTip TickInterval25, %minLifePercentToDrink%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToDrinkUpdate, %minLifePercentToDrink%
Gui, Add, Text, x212 y60 w10 h30 vminLifePercentToDrinkUpdatePercent, `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Mana `% to Drink Mana Potion
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminManaPercentToDrink +ToolTip TickInterval25, %minManaPercentToDrink%
Gui, Add, Text, x422 y60 w20 h30 vminManaPercentToDrinkUpdate, %minManaPercentToDrink%
Gui, Add, Text, x442 y60 w10 h30 vminManaPercentToDrinkUpdatePercent, `%

Gui, Add, GroupBox, x12 y180 w220 h60 , Min Life `% to Spam Instant Flasks
Gui, Add, Slider, x22 y200 w170 h30 gGuiUpdate vminLifePercentToSpam +ToolTip TickInterval25, %minLifePercentToSpam%
Gui, Add, Text, x192 y200 w20 h30 vminLifePercentToSpamUpdate, %minLifePercentToSpam%
Gui, Add, Text, x212 y200 w10 h30 vminLifePercentToSpamUpdatePercent, `%

Gui, Add, GroupBox, x242 y110 w220 h60 , Min Mana to Drink Mana Potion
Gui, Add, Slider, x252 y130 w170 h30 Range0-300 gGuiUpdate vminManaToDrinkPot +ToolTip TickInterval50, %minManaToDrinkPot%
Gui, Add, Text, x422 y130 w30 h30 vminManaToDrinkPotUpdate, %minManaToDrinkPot%

Gui, Add, GroupBox, x242 y180 w220 h60 , Instant Flask Spam Delay  ;x12 y149 w220 h60
IniRead, InstantFlaskDelay , Config.ini, Config, InstantFlaskDelay, 0
Gui, Add, Slider, x252 y200 w170 h30 Range0-50 gGuiUpdate vInstantFlaskDelay +ToolTip TickInterval50, %InstantFlaskDelay%
Gui, Add, Text, x422 y200 w25 h30 vInstantFlaskDelayUpdate, % Round(InstantFlaskDelay/100,2)
Gui, Add, Text, x447 y200 w10 h30 vInstantFlaskDelayUpdatePercent, s

Gui, Add, GroupBox, x12 y390 w220 h60 , Only QuickSilver If Moving for X Seconds
Gui, Add, Slider, x22 y410 w170 h30 Range0-100 gGuiUpdate vQuickSilverMovementTimer +ToolTip TickInterval20, %QuickSilverMovementTimer%
Gui, Add, Text, x192 y410 w22 h30 vQuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
Gui, Add, Text, x214 y410 w10 h30 , s

Gui, Add, GroupBox, x12 y460 w220 h60 , Only Remove Ailments If They Are Over
Gui, Add, Slider, x22 y480 w170 h30 Range0-50 gGuiUpdate vRemoveAilmentsTimer +ToolTip TickInterval10, %RemoveAilmentsTimer%
Gui, Add, Text, x192 y480 w22 h30 vRemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
Gui, Add, Text, x214 y480 w10 h30 , s

Gui, Add, GroupBox, x12 y530 w220 h60 , Only Remove Corrupted Blood If X Charges
Gui, Add, Slider, x22 y550 w170 h30 Range1-20 gGuiUpdate vRemoveCorruptedBloodCharges +ToolTip, %RemoveCorruptedBloodCharges%
Gui, Add, Text, x192 y550 w12 h30 vRemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%
Gui, Add, Text, x210 y550 w20 h30 , ch

Gui, Add, GroupBox, x12 y110 w220 h60 , Disable AutoFlask on Slot ;x12 y359 w220 h60

Loop, 5
{
	IniRead, Slot%A_Index%Disabled, Config.ini, DisableSlot, DisableSlot%A_Index%, 0
	XSlot:=((A_Index*40)-18)
	X=x%XSlot%
	If (Slot%A_Index%Disabled = 0)
	Gui, Add, CheckBox, %X% y130 w30 h30 vDisableSlot%A_Index% gDisableSlot, %A_Index%
	Else If (Slot%A_Index%Disabled = 1)
	Gui, Add, CheckBox, %X% y130 w30 h30 checked vDisableSlot%A_Index% gDisableSlot, %A_Index%
}

If QuickSilverCheck = 0
{
   Gui, Add, CheckBox, x242 y389 w220 h30 vQuickSilverCheckBox gQuickSilverCheck, Use QuickSilver Flask When 40+ Charges
}
If QuickSilverCheck = 1
{
   Gui, Add, CheckBox, x242 y389 w220 h30  vQuickSilverCheckBox gQuickSilverCheck Checked, Use QuickSilver Flask When 40+ Charges
}

If QuickSilverCheck2 = 0
{
   Gui, Add, CheckBox, x242 y418 w220 h30 vQuickSilverCheckBox2 gQuickSilverCheck2, Use QuickSilver Flask When 20+ Charges
}
If QuickSilverCheck2 = 1
{
   Gui, Add, CheckBox, x242 y418 w220 h30  vQuickSilverCheckBox2 gQuickSilverCheck2 Checked, Use QuickSilver Flask When 20+ Charges
}

If FlaskOnFrozenCheck = 0
{
   Gui, Add, CheckBox, x242 y447 w220 h30 vFlaskOnFrozenCheckBox gFlaskOnFrozenCheck, Use Flask to Remove Frozen Ailment
}
If FlaskOnFrozenCheck = 1
{
   Gui, Add, CheckBox, x242 y447 w220 h30  vFlaskOnFrozenCheckBox gFlaskOnFrozenCheck Checked, Use Flask to Remove Frozen Ailment
}

If FlaskOnShockedCheck = 0
{
   Gui, Add, CheckBox, x242 y475 w220 h30 vFlaskOnShockedCheckBox gFlaskOnShockedCheck, Use Flask to Remove Shocked Ailment
}
If FlaskOnShockedCheck = 1
{
   Gui, Add, CheckBox, x242 y475 w220 h30  vFlaskOnShockedCheckBox gFlaskOnShockedCheck Checked, Use Flask to Remove Shocked Ailment
}

If FlaskOnIgnitedCheck = 0
{
   Gui, Add, CheckBox, x242 y503 w220 h30 vFlaskOnIgnitedCheckBox gFlaskOnIgnitedCheck, Use Flask to Remove Burning Ailment
}
If FlaskOnIgnitedCheck = 1
{
   Gui, Add, CheckBox, x242 y503 w220 h30  vFlaskOnIgnitedCheckBox gFlaskOnIgnitedCheck Checked, Use Flask to Remove Burning Ailment
}

If FlaskOnCurseCheck = 0
{
   Gui, Add, CheckBox, x242 y531 w220 h30 vFlaskOnCurseCheckBox gFlaskOnCurseCheck, Use Flask to Remove Curses
}
If FlaskOnCurseCheck = 1
{
   Gui, Add, CheckBox, x242 y531 w220 h30  vFlaskOnCurseCheckBox gFlaskOnCurseCheck Checked, Use Flask to Remove Curses
}

If FlaskOnCorruptedBloodCheck = 0
{
   Gui, Add, CheckBox, x242 y558 w220 h30 vFlaskOnCorruptedBloodCheckBox gFlaskOnCorruptedBloodCheck, Use Flask to Remove Corrupted Blood
}
If FlaskOnCorruptedBloodCheck = 1
{
   Gui, Add, CheckBox, x242 y558 w220 h30  vFlaskOnCorruptedBloodCheckBox gFlaskOnCorruptedBloodCheck Checked, Use Flask to Remove Corrupted Blood
}


Gui, Tab, AutoQuit

Gui, Add, GroupBox, x12 y180 w220 h60, Auto Quit Method
IniRead, AutoQuitMethod , Config.ini, Config, AutoQuitMethod, 1
If AutoQuitMethod = 1
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Using cports)||Exit to Login Screen (Writes to Memory)|Alt+F4 (Fastest according to Chris)|Disabled
   autoQuitMode:=1
}
Else If AutoQuitMethod = 2
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Using cports)|Exit to Login Screen (Writes to Memory)||Alt+F4 (Fastest according to Chris)|Disabled
   autoQuitMode:=0
}
Else If AutoQuitMethod = 3
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Using cports)|Exit to Login Screen (Writes to Memory)|Alt+F4 (Fastest according to Chris)||Disabled
   autoQuitMode:=3
}
Else If AutoQuitMethod = 4
{
   Gui, Add, DropDownList, x22 y200 w200 h21 AltSubmit gAutoQuitList vAutoQuitChoice R5, Exit to Login Screen (Using cports)|Exit to Login Screen (Writes to Memory)|Alt+F4 (Fastest according to Chris)|Disabled||
   autoQuitMode:=4
}

Gui, Add, GroupBox, x12 y40 w220 h60 , Min Life `% to Quit
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vminLifePercentToQuit +ToolTip TickInterval25, %minLifePercentToQuit%
Gui, Add, Text, x192 y60 w20 h30 vminLifePercentToQuitUpdate, %minLifePercentToQuit%
Gui, Add, Text, x212 y60 w10 h30 vminLifePercentToQuitUpdatePercent, `%

Gui, Add, GroupBox, x242 y40 w220 h60 , Min Energy Shield `% to Quit
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vminESPercentToQuit +ToolTip TickInterval25, %minESPercentToQuit%
Gui, Add, Text, x422 y60 w20 h30 vminESPercentToQuitUpdate, %minESPercentToQuit%
Gui, Add, Text, x442 y60 w10 h30 vminESPercentToQuitUpdatePercent, `%

Gui, Add, GroupBox, x12 y110 w220 h60 , Max Life `% Per Hit to Quit
Gui, Add, Slider, x22 y130 w170 h30 gGuiUpdate vmaxLifePercentPerHitToQuit +ToolTip TickInterval25, %maxLifePercentPerHitToQuit%
Gui, Add, Text, x192 y130 w20 h30 vmaxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
Gui, Add, Text, x212 y130 w10 h30 vmaxLifePercentPerHitToQuitUpdatePercent, `%

Gui, Add, GroupBox, x242 y110 w220 h60 , Max Energy Shield `% Per Hit to Quit
Gui, Add, Slider, x252 y130 w170 h30 gGuiUpdate vmaxESPercentPerHitToQuit +ToolTip TickInterval25, %maxESPercentPerHitToQuit%
Gui, Add, Text, x422 y130 w20 h30 vmaxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
Gui, Add, Text, x442 y130 w10 h30 vmaxESPercentPerHitToQuitUpdatePercent, `%

Gui, Tab, Settings

IniRead, DPSCheck , Config.ini, Config, DPSCheck, 0
If DPSCheck = 0
{
   Gui, Add, CheckBox, x272 y70 w190 h30 vDPSCheckBox gDPSCheck, Disable DPS Calculator
   global DPS:=false
}
If DPSCheck = 1
{
   Gui, Add, CheckBox, x272 y70 w190 h30  vDPSCheckBox gDPSCheck Checked, Disable DPS Calculator
   global DPS:=true
}

;display tray notIfications about script actions : drinking potions, autoquitting
IniRead, TrayNotIficationsCheck , Config.ini, Config, TrayNotIficationsCheck, 0
If TrayNotIficationsCheck = 0
{
   Gui, Add, CheckBox, x272 y40 w190 h30 vTrayCheckBox gTrayNotIficationsCheck, Disable Tray NotIfications
   global trayNotIfications:=true
}
If TrayNotIficationsCheck = 1
{
   Gui, Add, CheckBox, x272 y40 w190 h30 vTrayCheckBox gTrayNotIficationsCheck Checked, Disable Tray NotIfications
   global trayNotIfications:=false
}

Gui, Add, GroupBox, x12 y40 w220 h60 , Base Pointer
Gui, Add, Text, x92 y60 w130 h30, Will Automatically Find Itself On New Client/Patch
IniRead, baseMgrPtr , Config.ini, Config, baseMgrPtr, 0
Gui, Add, Text, x22 y70 w70 h20 vbasePtrText , %baseMgrPtr%

Gui, Add, Button, x262 y120 w180 h40 gshowgui2, Configure Hotkeys

Gui, Add, Button, x32 y190 w180 h40 gshowgui4, Debug Window

Gui, Add, Button, x262 y190 w180 h40 gDefaultHotkeys, Restore Default Hotkeys

Gui, Add, GroupBox, x12 y250 w220 h60, Client Server
IniRead, ClientServer , Config.ini, Config, ClientServer, 1
If ClientServer = 1
{
   Gui, Add, DropDownList, x22 y270 w200 h21 AltSubmit gClientServerList vClientServerChoice R5, Global||Steam|Singapore/Malasya|Taiwan
   ClientServerMode:=1
}
Else If ClientServer = 2
{
   Gui, Add, DropDownList, x22 y270 w200 h21 AltSubmit gClientServerList vClientServerChoice R5, Global|Steam||Singapore/Malasya|Taiwan
   ClientServerMode:=2
}
Else If ClientServer = 3
{
   Gui, Add, DropDownList, x22 y270 w200 h21 AltSubmit gClientServerList vClientServerChoice R5, Global|Steam|Singapore/Malasya||Taiwan
   ClientServerMode:=3
}
Else If ClientServer = 4
{
   Gui, Add, DropDownList, x22 y270 w200 h21 AltSubmit gClientServerList vClientServerChoice R5, Global|Steam|Singapore/Malasya|Taiwan||
   ClientServerMode:=4
}


Gui, Tab, Others

IniRead, TradeSpam, Config.ini, Config, TradeSpam, 0
Gui, Add, GroupBox, x12 y40 w220 h60 , Send Trade Message Every X Minutes*
Gui, Add, Slider, x22 y60 w170 h30 gGuiUpdate vTradeSpam +ToolTip TickInterval1 Range0-10, %TradeSpam%
Gui, Add, Text, x192 y60 w20 h30 vTradeSpamUpdate, %TradeSpam%
Gui, Add, Text, x212 y60 w10 h30 vTradeSpamUpdatePercent, m

Gui, Add, Text,  x22 y565 w400 h21, *Opening the chat will stop and reset the trade spam.

Gui, Add, GroupBox, x242 y40 w220 h60 , Send Resync Command Every X Seconds
Gui, Add, Slider, x252 y60 w170 h30 gGuiUpdate vResyncSpam +ToolTip TickInterval30 Range0-120, %ResyncSpam%
Gui, Add, Text, x422 y60 w20 h30 vResyncSpamUpdate, %ResyncSpam%
Gui, Add, Text, x442 y60 w10 h30 vResyncSpamUpdatePercent, s

Gui, Add, GroupBox, x242 y110 w220 h60 , Send Remaining Command Every X Secs
Gui, Add, Slider, x252 y130 w170 h30 gGuiUpdate vRemainingSpam +ToolTip TickInterval30 Range0-120, %RemainingSpam%
Gui, Add, Text, x422 y130 w20 h30 vRemainingSpamUpdate, %RemainingSpam%
Gui, Add, Text, x442 y130 w10 h30 vRemainingSpamUpdatePercent, s

If AttackInPlaceCheck = 0
{
   Gui, Add, CheckBox, x22 y110 w200 h30 vAttackInPlaceCheckBox gAttackInPlaceCheck, Auto Hold In Place When Attacking
}
If AttackInPlaceCheck = 1
{
   Gui, Add, CheckBox, x22 y110 w200 h30  vAttackInPlaceCheckBox gAttackInPlaceCheck Checked, Auto Hold In Place When Attacking
}

If HoldCtrlCheck = 0
{
   Gui, Add, CheckBox, x22 y140 w200 h30 vHoldCtrlCheckBox gHoldCtrlCheck, Auto Hold Ctrl On Waypoint Panel
}
If HoldCtrlCheck = 1
{
   Gui, Add, CheckBox, x22 y140 w200 h30  vHoldCtrlCheckBox gHoldCtrlCheck Checked, Auto Hold Ctrl On Waypoint Panel
}


Gui, Tab

Gui, Add, Button, x22 y609 w130 h40 gDefault, Reset Profile
Gui, Add, Button, x182 y609 w120 h40 gReadMe, ReadMe
Gui, Add, Button, x332 y609 w120 h40 gDonate, Donate

Gui, Add, Text, x380 y1 w110 h18 vguicontroled, Created by Gurud.

Gui, Add, GroupBox, x0 y590 w472 h74 ,
Gui, Add, GroupBox, x1 y591 w470 h72 ,
Gui, Add, GroupBox, x2 y592 w468 h70 ,
Gui, Add, GroupBox, x3 y593 w466 h68 ,
Gui, Add, GroupBox, x4 y594 w464 h66 ,

Gui, Add, GroupBox, x0 y21 w472 h575 ,
Gui, Add, GroupBox, x1 y22 w470 h574 ,
Gui, Add, GroupBox, x2 y23 w468 h573 ,
Gui, Add, GroupBox, x3 y24 w466 h572 ,
Gui, Add, GroupBox, x4 y25 w464 h571 ,

Menu, Tray, Add, Configuration Window, showgui

If (minLifePercentToQuit=0)
{
   GuiControl, , minLifePercentToQuitUpdate, N/A
   GuiControl, , minLifePercentToQuitUpdatePercent,
}
If (minESPercentToQuit=0)
{
   GuiControl, , minESPercentToQuitUpdate, N/A
   GuiControl, , minESPercentToQuitUpdatePercent, 
}
If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
{
   GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
   GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
}
If (maxESPercentPerHitToQuit=0)
{
   GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
   GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
}
If (minLifePercentToJade=0)
{
   GuiControl, , minLifePercentToJadeUpdate, N/A
   GuiControl, , minLifePercentToJadeUpdatePercent, 
}
If (minESPercentToJade=0)
{
   GuiControl, , minESPercentToJadeUpdate, N/A
   GuiControl, , minESPercentToJadeUpdatePercent, 
}
If (minLifePercentToElementalResist=0)
{
   GuiControl, , minLifePercentToElementalResistUpdate, N/A
   GuiControl, , minLifePercentToElementalResistUpdatePercent, 
}
If (minESPercentToElementalResist=0)
{
   GuiControl, , minESPercentToElementalResistUpdate, N/A
   GuiControl, , minESPercentToElementalResistUpdatePercent, 
}
If (minLifePercentToDrink=0)
{
   GuiControl, , minLifePercentToDrinkUpdate, N/A
   GuiControl, , minLifePercentToDrinkUpdatePercent, 
}
If (minManaPercentToDrink=0)
{
   GuiControl, , minManaPercentToDrinkUpdate, N/A
   GuiControl, , minManaPercentToDrinkUpdatePercent, 
}
If (minManaToDrinkPot=0)
{
   GuiControl, , minManaToDrinkPotUpdate, N/A
}
If (InstantFlaskDelay=0)
{
   GuiControl, , InstantFlaskDelayUpdate, N/A
   GuiControl, , InstantFlaskDelayUpdatePercent, 
}
If (minLifePercentToSpam=0)
{
   GuiControl, , minLifePercentToSpamUpdate, N/A
   GuiControl, , minLifePercentToSpamUpdatePercent, 
}
If (TradeSpam=0)
{
   GuiControl, , TradeSpamUpdate, N/A
   GuiControl, , TradeSpamUpdatePercent, 
}
If (ResyncSpam=0)
{
   GuiControl, , ResyncSpamUpdate, N/A
   GuiControl, , ResyncSpamUpdatePercent, 
}
If (RemainingSpam=0)
{
   GuiControl, , RemainingSpamUpdate, N/A
   GuiControl, , RemainingSpamUpdatePercent, 
}

Gui, Submit

StringTrimRight, Name, A_ScriptName, 4

Gui, Show, x760 y198 h665 w474, %Name%

;---------------------START DYNAMIC HOTKEYS---------------------

;"Wild Mode allows hotkeys to trigger when other modIfiers are also held.`nFor example, If you bound Ctrl+C to an action...`nWild Mode ON: Ctrl+Alt+C, Ctrl+ShIft+C etc would still trigger the action`nWild Mode OFF: Ctrl+Alt+C etc would not trigger the action."

; Build list of "End Keys" for Input command
EXTRA_KEY_LIST := "{Escape}"  ; DO NOT REMOVE! - Used to quit binding
; Standard non-printables
EXTRA_KEY_LIST .= "{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}"
EXTRA_KEY_LIST .= "{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BackSpace}{Pause}"
; Numpad - Numlock ON
EXTRA_KEY_LIST .= "{Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{NumpadDot}{NumpadMult}{NumpadAdd}{NumpadSub}"
; Numpad - Numlock OFF
EXTRA_KEY_LIST .= "{NumpadIns}{NumpadEnd}{NumpadDown}{NumpadPgDn}{NumpadLeft}{NumpadClear}{NumpadRight}{NumpadHome}{NumpadUp}{NumpadPgUp}{NumpadDel}"
; Numpad - Common
EXTRA_KEY_LIST .= "{NumpadMult}{NumpadAdd}{NumpadSub}{NumpadDiv}{NumpadEnter}"
; Stuff we may or may not want to trap
;EXTRA_KEY_LIST .= "{Numlock}"
EXTRA_KEY_LIST .= "{Capslock}"
;EXTRA_KEY_LIST .= "{PrintScreen}"
; Browser keys
EXTRA_KEY_LIST .= "{Browser_Back}{Browser_Forward}{Browser_Refresh}{Browser_Stop}{Browser_Search}{Browser_Favorites}{Browser_Home}"
; Media keys
EXTRA_KEY_LIST .= "{Volume_Mute}{Volume_Down}{Volume_Up}{Media_Next}{Media_Prev}{Media_Stop}{Media_Play_Pause}"
; App Keys
EXTRA_KEY_LIST .= "{Launch_Mail}{Launch_Media}{Launch_App1}{Launch_App2}"

; BindMode vars
HKModIfierState := {}   ; The state of the modIfiers at the end of the last detection sequence
HKControlType := 0      ; The kind of control that the last hotkey was. 0 = regular key, 1 = solitary modIfier, 2 = mouse, 3 = joystick
HKSecondaryInput := ""  ; Set to button pressed If the last detected bind was a Mouse button, Joystick button or Solitary ModIfier
HKLastHotkey := 0       ; Time that Escape was pressed to exit key binding. Used to determine If Escape is held (Clear binding)

DefaultHKObject := {hk: "", type: "", wild: ""}

; Misc vars
ININame := "Config.ini"
HotkeyList := []
NumHotkeys := 9

; Create the GUI
Gui 2:Add, Text,, This allows you to change Hotkeys.`n Click the "ReadMe" button to know what the hotkeys do.
Gui, 2:Add, Text, x357 y25 w30 center, Wild`nMode

ypos := 50

;Gui, 2:Add, Text, x5 y40 w300 center,Hotkey
;Gui, 2:Add, Text, x300 y40 center,~ *

Loop % NumHotkeys 
{
   Gui, 2:Add, Edit, Disabled vHotkeyName%A_Index% w260 x5 y%ypos%, None
   Gui, 2:Add, Button, gBind vBind%A_Index% yp-1 xp+270, Set Hotkey
   Gui, 2:Add, Checkbox, vWild%A_Index% gOptionChanged xp+90 yp+5
   ;Gui, 2:Add, Checkbox, vBlock%A_Index% gOptionChanged xp+30 yp
   ypos += 25
}


; Set GUI State
LoadSettings()

; Enable defined hotkeys
EnableHotkeys()

Menu, Tray, Add, Configure Hotkeys, showgui2                                                      ;Check the box If Win modIfier is used.
Gui, 2:Submit, Hide

Menu Tray, NoStandard

Menu Tray, Standard

Menu Tray,Check, Configure Hotkeys
Menu Tray,Check, Configuration Window

;---------------------END DYNAMIC HOTKEYS---------------------
;---------------------DEBUG WINDOW----------------------------

Gui, 4:Add, GroupBox, x5 y0 w300 h300 , Player Stats
ypos := 25
Gui, 4:Add, Text, x15 y%ypos% w155, Max HP
Gui, 4:Add, Edit, Disabled vMaxHPvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Current HP
Gui, 4:Add, Edit, Disabled vCurrHPvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Reserved HP Flat
Gui, 4:Add, Edit, Disabled vReservedHPFlatvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Reserved HP Percent
Gui, 4:Add, Edit, Disabled vReservedHPPercentvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Max Mana
Gui, 4:Add, Edit, Disabled vMaxManavar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Current Mana
Gui, 4:Add, Edit, Disabled vCurrManavar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Reserved Mana Flat
Gui, 4:Add, Edit, Disabled vReservedManaFlatvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Reserved Mana Percent
Gui, 4:Add, Edit, Disabled vReservedManaPercentvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Max Energy Shield
Gui, 4:Add, Edit, Disabled vMaxEShieldvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Current Energy Shield
Gui, 4:Add, Edit, Disabled vCurrEShieldvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Player Action ID
Gui, 4:Add, Edit, Disabled vPlayerActionIDvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 35

Gui, 4:Add, GroupBox, x5 y%ypos% w300 h340 , Checks
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Chat Status
Gui, 4:Add, Edit, Disabled vChatStatusvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Mouse On Enemy
Gui, 4:Add, Edit, Disabled vMouseOnEnemyStatusvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Panel Waypoint
Gui, 4:Add, Edit, Disabled vPanelWaypointvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Panel Inventory
Gui, 4:Add, Edit, Disabled vPanelInventoryvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Panel Skill Tree
Gui, 4:Add, Edit, Disabled vPanelSkillTreevar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Panel Social
Gui, 4:Add, Edit, Disabled vPanelSocialvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Panel Instance Manager
Gui, 4:Add, Edit, Disabled vPanelInstanceManagervar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, In City
Gui, 4:Add, Edit, Disabled vInCityvar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Enemy Name
Gui, 4:Add, Edit, Disabled vEnemyNamevar  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Enemy Name 2
Gui, 4:Add, Edit, Disabled vEnemyName2var  x140 y%ypos% w150, Not In Game or Broken
ypos += 25
Gui, 4:Add, Text, x15 y%ypos% w155, Map Name
Gui, 4:Add, Edit, Disabled vMapNamevar  x140 y%ypos% w150, Not In Game or Broken

Gui, 4:Add, GroupBox, x305 y0 w300 h650 , Flasks Data
ypos := 25
Loop, 5
{
   Gui, 4:Add, Text, x315 y%ypos% w155, Flask %A_Index% Type
   Gui, 4:Add, Edit, Disabled vFlask%A_Index%Typevar  x440 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x315 y%ypos% w155, Flask %A_Index% Charges Current
   Gui, 4:Add, Edit, Disabled vFlask%A_Index%ChargesCurrentvar  x440 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x315 y%ypos% w155, Flask %A_Index% Charges Per Use
   Gui, 4:Add, Edit, Disabled vFlask%A_Index%ChargesPerUsevar  x440 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x315 y%ypos% w155, Flask %A_Index% Mod 1
   Gui, 4:Add, Edit, Disabled vFlask%A_Index%Mod1var  x440 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x315 y%ypos% w155, Flask %A_Index% Mod 2
   Gui, 4:Add, Edit, Disabled vFlask%A_Index%Mod2var  x440 y%ypos% w150, Not In Game or Broken
   ypos += 25
}

Gui, 4:Add, GroupBox, x605 y0 w300 h650 , Buff Data
ypos := 25
Gui, 4:Add, Text, x615 y%ypos% w155, Buff Amount
Gui, 4:Add, Edit, Disabled vBuffAmountvar  x740 y%ypos% w150, Not In Game or Broken
ypos += 25
Loop, 8
{
   Gui, 4:Add, Text, x615 y%ypos% w155, Buff %A_Index% Name
   Gui, 4:Add, Edit, Disabled vBuff%A_Index%Namevar  x740 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x615 y%ypos% w155, Buff %A_Index% Charges
   Gui, 4:Add, Edit, Disabled vBuff%A_Index%Chargesvar  x740 y%ypos% w150, Not In Game or Broken
   ypos += 25
   Gui, 4:Add, Text, x615 y%ypos% w155, Buff %A_Index% Timer
   Gui, 4:Add, Edit, Disabled vBuff%A_Index%Timervar  x740 y%ypos% w150, Not In Game or Broken
   ypos += 25
}

;---------------------DEBUG WINDOW----------------------------
;-------GUI-----------------GUI-----------------GUI-----------------GUI-----------------GUI----------

;-------START VARIABLES-----------------START VARIABLES-----------------START VARIABLES--------------

SetBatchLines, -1
DetectHiddenWindows, On

If not A_IsAdmin
{
   TrayTip, Admin Required, Seems that you are not running this program as Admin`, it might not work properlly., 5
}

cliname=Path of Exile

cliexesteam=PathOfExileSteam.exe

cliexe=PathOfExile.exe
AutoFlaskWatchdogPeriod:=20 ;milliseconds, time to have script recheck Life/mana/flasks availability more often/increase chances of getting saved from death in time, increase this If fps drop.
lagCompensation:=50
; Font size for the tooltip, leave empty for default(part of DPSCalc)
FontSize := 12
; Create font for later use(part of DPSCalc)
FixedFont := CreateFont()

ResyncTimer:= A_TickCount
RemainingTimer:= A_TickCount
ChatStatusTimer:= A_TickCount+99999999999
TradeTimer:= 0
TradeChannel:= 0
tradechat:= 0
TradeStep:= 3
TradeSpamTimer:= 3
ShIftDownOn:=0
ChatCheckTimer:= 1
10secsTimer:=A_TickCount-10000
20secsTimer:=A_TickCount-20000
PanickedTimer:=40
LastHP:=0
LastES:=0
FlaskOnFrozen:=1
FlaskOnShocked:=1
FlaskOnIgnited:=1

If (ClientServerMode = 1)
{
   ConfigPath = %A_MyDocuments%
   ConfigPath .= "\My" . A_Space . "Games\Path" . A_Space . "of" . A_Space . "Exile\production_Config.ini"
   Taiwan:=False
   Steam:=False
   Singapore:=False
   GlobalS:=True
}
If (ClientServerMode = 2)
{
   ConfigPath = %A_MyDocuments%
   ConfigPath .= "\My" . A_Space . "Games\Path" . A_Space . "of" . A_Space . "Exile\production_Config.ini"
   Taiwan:=False
   Steam:=True
   Singapore:=False
   GlobalS:=False
}
If (ClientServerMode = 3)
{
   ConfigPath = %A_MyDocuments%
   ConfigPath .= "\My" . A_Space . "Games\Path" . A_Space . "of" . A_Space . "Exile\garena_sg_production_Config.ini"
   Taiwan:=False
   Steam:=False
   Singapore:=True
   GlobalS:=False
}
If (ClientServerMode = 4)
{
   ConfigPath = %A_MyDocuments%
   ConfigPath .= "\My" . A_Space . "Games\Path" . A_Space . "of" . A_Space . "Exile\garena_tw_production_Config.ini"
   Taiwan:=True
   Steam:=False
   Singapore:=False
   GlobalS:=False
}

autoQuitPauseBeforeClick:=100
autoQuitSoftToleranceBeforeKill:=2000 ; try to quit to loginscreen at most milliseconds before killing game window(in case we can't quit by clicking menu option for some reason)

PlayerConfig:={}

PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IflaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxEShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minEShieldRatioToQuit: minESPercentToQuit/100, minEShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minEShieldRatioToPopJade: minESPercentToJade/100}

PlayerConfig["Default"].FlaskConfig:=[]

WindowQueuedFlaskEffects:=[] ;keyed by "%hwnd%%CurrPid%", hpQueueEndtime, manaQueueEndtime

basePtrAoBArray:=[0xCE, 0x50, 0xC7, 0x45, 0xF0]
basePtrAobOffset:=+0x10

WindowBasicsCache:=[] ; keyed by "%hwnd%%CurrPid%", entries are objects with properties processHandle, moduleBase, moduleSize, baseFramePtr

#Include AutoHotkeyMemoryLib.ahk

OnExit, ExitSub

Loop
{
   Main()
}

;-------START VARIABLES-----------------START VARIABLES-----------------START VARIABLES--------------

;-------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------

GetWindowBasics(hwnd, byref mB="", byref pH="", byref mS="")
{
   
   global WindowBasicsCache
   global cliexe
   
   WinGet, CurrPid, PID, ahk_id %hwnd%
   
   k="%hwnd%%CurrPid%"
   
   mB:=WindowBasicsCache[k].mBase
   mS:=WindowBasicsCache[k].mSize
   
   If mB=
   {
      WindowBasicsCache[k]:=Object()
      GetModuleInfo(cliexe, CurrPid, mB, mS)
      If (mB="" || mS="")
      {
         MsgBox, Failed to obtain moduleBase or moduleSize for PID %CurrPid%, script will now terminate
         ExitApp
      }      
      WindowBasicsCache[k].mBase:=mB
      WindowBasicsCache[k].mSize:=mS
   }

   pH:=WindowBasicsCache[k].ProcessHandle
   If pH=
   {
      pH:=GetProcessHandle(CurrPid)
      If (pH="" || pH=-1)
      {
         MsgBox, Invalid process handle obtained for PID %CurrPid%, script will now terminate
         ExitApp
      }      
      WindowBasicsCache[k].ProcessHandle:=pH
   }
}

ScanBaseMgrPtr(mBase,pH,moduleSize)
{
   global basePtrAoBArray
   global basePtrAobOffset
   global baseMgrPtr
   aobResult:=AobScan(pH,mBase,moduleSize,basePtrAoBArray)

   If aobResult
   {
      SetFormat, IntegerFast, hex
      baseMgrPtr:=ReadMemUInt(pH,mBase+aobResult+basePtrAobOffset)-mBase
      If (trayNotIfications)
     TrayTip, New Base Pointer Found, baseMgrPtr = %baseMgrPtr%
     IniWrite, %baseMgrPtr% , Config.ini, Config, baseMgrPtr
     GuiControl, , basePtrText, %baseMgrPtr%
     SetFormat, IntegerFast, dec

   }
   Else
   {
      MsgBox, baseMgrPtr not found with AoBScan, script will now terminate
      ExitApp
   }   
}

GetFrameBase(hwnd)
{
   global baseMgrPtr
   global WindowBasicsCache
   global cliname
   global 10secsTimer

   WinGet, CurrPid, PID, ahk_id %hwnd%
   k="%hwnd%%CurrPid%"

   fB:=WindowBasicsCache[k].fBase

   If fB=
   {
   		If (A_TickCount>=10secsTimer+10000)
   		{
	   		IniRead, MD5Hash , Config.ini, Config, MD5Hash, 0
			WinGet FullEXEPath, ProcessPath, %cliname%
			NewMD5Hash:=FileMD5(FullEXEPath)

			If (NewMD5Hash!=MD5Hash)
			{
				IniWrite, 0 , Config.ini, Config, baseMgrPtr
				baseMgrPtr:= 0
				IniWrite, %NewMD5Hash% , Config.ini, Config, MD5Hash
			}
			10secsTimer:=A_TickCount
   		}

		GetWindowBasics(hwnd, mBase, pH, mSize)


      If baseMgrPtr= 0
      {
         ScanBaseMgrPtr(mBase, pH, mSize)
      }

      fB:=GetMultilevelPointer(pH,[mBase+baseMgrPtr,4,0xFC,0x1c])
      WindowBasicsCache[k].fBase:=fB
   }
   return fB
}

GetUiBase(hwnd)
{
   global baseMgrPtr
   global cliname
   global 10secsTimer
   global Steam
   global Offset3
   global Offset4



	If (A_TickCount>=10secsTimer+10000)
	{
		IniRead, MD5Hash , Config.ini, Config, MD5Hash, 0
		WinGet FullEXEPath, ProcessPath, %cliname%
		NewMD5Hash:=FileMD5(FullEXEPath)

		If (NewMD5Hash!=MD5Hash)
		{
			IniWrite, 0 , Config.ini, Config, baseMgrPtr
			baseMgrPtr:= 0
			IniWrite, %NewMD5Hash% , Config.ini, Config, MD5Hash
		}
		10secsTimer:=A_TickCount
	}


	GetWindowBasics(hwnd, mBase, pH, mSize)
      
   If baseMgrPtr= 0
   {
      ScanBaseMgrPtr(mBase, pH, mSize)
   }
      
   FrameBase:=GetFrameBase(hwnd)
   If (FrameBase="" || FrameBase=0)
      return
   uiBase:=GetMultilevelPointer(pH,[FrameBase+Offset3,Offset4,0x8f4])
   return uiBase
}

ReadClientResolution(hwnd, ByRef w, ByRef h)
{
   global Steam
   global Offset6
   global Offset7

   GetWindowBasics(hwnd,mBase,pH)
   If (mBase!=0 && pH && pH!=-1)
   {
      FrameBase:=GetFrameBase(hwnd)
      w:=ReadMemUInt(pH,FrameBase+Offset6)
      h:=ReadMemUInt(pH,FrameBase+Offset7)
      return true
   }   
}



ReadPlayerStats(hwnd, byRef PlayerStats)
{
   global baseMgrPtr
   global Steam
   global Taiwan
   global Singapore
   global GlobalS


   If (Steam) 
   {
      global Offset1:=0x154
      global Offset2:=0x4c4
      global Offset3:=0x158
      global Offset4:=0x220
      global Offset5:=0x2E80
      global Offset6:=0x15a8
      global Offset7:=0x15ac
      global Offset8:=0xa24
      global Offset9:=0x9cc
      global Offset10:=0x12C
      global Offset11:=0x198
   }
   Else If (Taiwan)
   {
      global Offset1:=0x138
      global Offset2:=0x5A0
      global Offset3:=0x13c
      global Offset4:=0x220
      global Offset5:=0x2E80
      global Offset6:=0x15B8
      global Offset7:=0x15BC
      global Offset8:=0x100
      global Offset9:=0xE4
      global Offset10:=0x12C
      global Offset11:=0x198
   }
   Else If (GlobalS)
   {
      global Offset1:=0x138
      global Offset2:=0x144
      global Offset3:=0x13c
      global Offset4:=0x220
      global Offset5:=0x3934
      global Offset6:=0x158c
      global Offset7:=0x1590
      global Offset8:=0xa00
      global Offset9:=0x9a8
      global Offset10:=0xa34
      global Offset11:=0xa9c
   }
   Else If (Singapore)
   {
      global Offset1:=0x138
      global Offset2:=0x5A0
      global Offset3:=0x13c
      global Offset4:=0x220
      global Offset5:=0x2E80
      global Offset6:=0x15B8
      global Offset7:=0x15BC
      global Offset8:=0x100
      global Offset9:=0xE4
      global Offset10:=0x12C
      global Offset11:=0x198
   }
   
   GetWindowBasics(hwnd, mBase, pH)
   fBase:=GetFrameBase(hwnd)
   BaseMgr:=ReadMemUInt(pH,mBase+baseMgrPtr)
   PlayerBase:=GetMultilevelPointer(pH,[fBase+Offset1,Offset2])
   ;Config:=GetMultilevelPointer(pH,[BaseMgr+0x180,0x108,0x8c])
   ;PlayerStats.ConfigPath:=ReadMemStr(ph,Config+0xa4,255,"UTF-16")
   PlayerMain:=ReadMemUInt(pH,PlayerBase+4)
   PlayerStatsOffset:=ReadMemUInt(pH,PlayerMain+0xC)
   PlayerStats.MaxHP:=ReadMemUInt(pH,PlayerStatsOffset+0x2c)
   PlayerStats.CurrHP:=ReadMemUInt(pH,PlayerStatsOffset+0x30)  
   PlayerStats.ReservedHPFlat:=ReadMemUInt(pH,PlayerStatsOffset+0x38)
   PlayerStats.ReservedHPPercent:=ReadMemUInt(pH,PlayerStatsOffset+0x3c)
   PlayerStats.MaxMana:=ReadMemUInt(pH,PlayerStatsOffset+0x50)
   PlayerStats.ReservedManaFlat:=ReadMemUInt(pH,PlayerStatsOffset+0x5c)
   PlayerStats.ReservedManaPercent:=ReadMemUInt(pH,PlayerStatsOffset+0x60)
   PlayerStats.CurrMana:=ReadMemUInt(pH,PlayerStatsOffset+0x54)
   PlayerStats.MaxEShield:=ReadMemUInt(pH,PlayerStatsOffset+0x74)
   PlayerStats.CurrEShield:=ReadMemUInt(pH,PlayerStatsOffset+0x78)
   PlayerActionIDOffset:=ReadMemUInt(pH,PlayerMain+0x1C)
   PlayerStats.PlayerActionID:=ReadMemUInt(pH,PlayerActionIDOffset+0x70)
   /*
   SetFormat, IntegerFast, hex
   PlayerActionID += 0
   PlayerActionID .= ""
   StringRight, PlayerActionID2, PlayerActionID, 2
   SetFormat, IntegerFast, d
   PlayerStats.PlayerActionID:=PlayerActionID2
   */

   BuffListStart:=ReadMemUInt(pH,PlayerStatsOffset+0x94)
   BuffListEnd:=ReadMemUInt(pH,PlayerStatsOffset+0x98)
   BuffAmount:=((BuffListEnd-BuffListStart)/4)
   PlayerStats.BuffAmount:=((BuffListEnd-BuffListStart)/4)
   Loop, %BuffAmount%
   {
      BuffBasePtr:=GetMultilevelPointer(ph,[BuffListStart+((A_Index-1)*4),4])
      BuffNamePtr:=GetMultilevelPointer(ph,[BuffBasePtr+4,0])
      BuffNameStr:=ReadMemStr(ph,BuffNamePtr,70,"UTF-16")
      PlayerStats.BuffName[A_Index]:=BuffNameStr
      BuffCharges:=ReadMemUInt(pH,BuffBasePtr+0x20)
      PlayerStats.BuffCharges[A_Index]:=BuffCharges
      BuffTimer:=ReadMemFloat(pH,BuffBasePtr+0xC)
      PlayerStats.BuffTimer[A_Index]:=BuffTimer
   }


   CheckBase:=GetMultilevelPointer(pH,[fBase+Offset3,Offset4])

   ChatStatusOffset:=GetMultilevelPointer(pH,[CheckBase+Offset9,0x708,0x0])
   PlayerStats.ChatStatus:=ReadMemUInt(pH,ChatStatusOffset+0x754)

   PanelInventoryOffset:=ReadMemUInt(pH,CheckBase+Offset8)
   PlayerStats.PanelInventory:=ReadMemUInt(pH,PanelInventoryOffset+0x754)
   PanelSocialOffset:=ReadMemUInt(pH,CheckBase+Offset8+0x14)
   PlayerStats.PanelSocial:=ReadMemUInt(pH,PanelSocialOffset+0x754)
   PanelSkillTreeOffset:=ReadMemUInt(pH,CheckBase+Offset8+0x18)
   PlayerStats.PanelSkillTree:=ReadMemUInt(pH,PanelSkillTreeOffset+0x754)
   PanelWaypointOffset:=ReadMemUInt(pH,CheckBase+Offset8+0x30)
   PlayerStats.PanelWaypoint:=ReadMemUInt(pH,PanelWaypointOffset+0x754)
   PanelInstanceManagerOffset:=ReadMemUInt(pH,CheckBase+Offset8+0xB8)  ;added by immor
   PlayerStats.PanelInstanceManager:=ReadMemUInt(pH,PanelInstanceManagerOffset+0x754) ;added by immor
   InCityOffset:=GetMultilevelPointer(pH,[CheckBase+Offset10,0x704,0x958])
   PlayerStats.InCity:=ReadMemUInt(pH,InCityOffset+0x754)
   MouseOnEnemyOffset:=GetMultilevelPointer(pH,[CheckBase+Offset11,0x8c4,0x7f4])
   PlayerStats.MouseOnEnemyStatus:=ReadMemUInt(pH,MouseOnEnemyOffset+0x38)
   EnemyNamePtr:=GetMultilevelPointer(ph,[CheckBase+Offset11,0x8c4,0xb30])
   EnemyName:=ReadMemStr(ph,EnemyNamePtr,70,"UTF-16")
   PlayerStats.EnemyName:=EnemyName
   EnemyNamePtr2:=GetMultilevelPointer(ph,[CheckBase+Offset11,0x8c4,0xac8])
   EnemyName2:=ReadMemStr(ph,EnemyNamePtr2+0x32,70,"UTF-16")
   PlayerStats.EnemyName2:=EnemyName2

   MapNameOffset:=GetMultilevelPointer(pH,[fBase+Offset1,0x8,0x4])
   MapName:=ReadMemStr(ph,MapNameOffset,100,"UTF-16")
   PlayerStats.MapName:=MapName
}

ReadFlasksData(hwnd, byRef FlasksData)
{
   GetWindowBasics(hwnd, mBase, pH)
   
   UiBase:=GetUiBase(hwnd)
   
   If (!UiBase) ;not InGame
      return
   
   FlaskInvBase:=GetMultilevelPointer(pH,[UiBase+0x8b4,0x950,0x20])

   Loop, 5
   {
      currFlaskPtr:=ReadMemUInt(pH,FlaskInvBase+(A_Index-1)*4)

      If (currFlaskPtr!=0) ; there's a flask in said slot
      {
         FlasksData[A_Index]:={}

         If A_Index = 1
         {
            IniRead, Slot1Disabled, Config.ini, DisableSlot, DisableSlot1, 0
            If Slot1Disabled = 1
            continue
         }
         Else If A_Index = 2
         {
            IniRead, Slot2Disabled, Config.ini, DisableSlot, DisableSlot2, 0
            If Slot2Disabled = 1
            continue
         }
         Else If A_Index = 3
         {
            IniRead, Slot3Disabled, Config.ini, DisableSlot, DisableSlot3, 0
            If Slot3Disabled = 1
            continue
         }
         Else If A_Index = 4
         {
            IniRead, Slot4Disabled, Config.ini, DisableSlot, DisableSlot4, 0
            If Slot4Disabled = 1
            continue
         }
         Else If A_Index = 5
         {
            IniRead, Slot5Disabled, Config.ini, DisableSlot, DisableSlot5, 0
            If Slot5Disabled = 1
            continue
         }


         FlaskChargesPtr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0xC])
         FlasksData[A_Index].ChargesCurrent:=ReadMemUInt(pH,FlaskChargesPtr+0xC)
         FlasksData[A_Index].ChargesPerUse:=ReadMemUInt(pH,ReadMemUInt(pH,FlaskChargesPtr+8)+0xC)

         FlaskMod1Ptr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0x10,0x68,0x10,0x38])
         FlaskMod1Str:=ReadMemStr(ph,FlaskMod1Ptr,70,"UTF-16")
         FlasksData[A_Index].mod1:=FlaskMod1Str

         FlaskMod2Ptr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x1C,4,4,0x10,0x68,0x24,0x38])
         FlaskMod2Str:=ReadMemStr(ph,FlaskMod2Ptr,70,"UTF-16")
         FlasksData[A_Index].mod2:=FlaskMod2Str

         If (FlasksData[A_Index].ChargesCurrent < FlasksData[A_Index].ChargesPerUse) ; not enough charges in this flask to use it, don't bother
            continue

         FlaskMetadataPtr:=GetMultilevelPointer(ph,[currFlaskPtr,0,0x14])
         FlaskMetadataStr:=ReadMemStr(ph,FlaskMetadataPtr,70,"UTF-16")
         FlaskTypeStr:=SubStr(FlaskMetadataStr,23)
         FlasksData[A_Index].type:=FlaskTypeStr

         FlaskLocalstatsPtr:=GetMultilevelPointer(ph,[currFlaskPtr,4,0x18,0x14,0xC])
         
         If InStr(FlaskTypeStr, "FlaskLife")
         {
            FlasksData[A_Index].HPRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)
            If ( InStr(FlasksData[A_Index].mod1,"Bubbling") || InStr(FlasksData[A_Index].mod2,"Bubbling") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
            Else If ( InStr(FlasksData[A_Index].mod1,"起泡的*") || InStr(FlasksData[A_Index].mod2,"起泡的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
			Else If ( InStr(FlasksData[A_Index].mod1,"Catalysed") || InStr(FlasksData[A_Index].mod2,"Catalysed") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"催化的*") || InStr(FlasksData[A_Index].mod2,"催化的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"Saturated") || InStr(FlasksData[A_Index].mod2,"Saturated") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else If ( InStr(FlasksData[A_Index].mod1,"飽和的*") || InStr(FlasksData[A_Index].mod2,"飽和的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else
				FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)
         }

         If InStr(FlaskTypeStr, "FlaskMana")
         {
            FlasksData[A_Index].ManaRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)
            If ( InStr(FlasksData[A_Index].mod1,"Bubbling") || InStr(FlasksData[A_Index].mod2,"Bubbling") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
            Else If ( InStr(FlasksData[A_Index].mod1,"起泡的*") || InStr(FlasksData[A_Index].mod2,"起泡的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
			Else If ( InStr(FlasksData[A_Index].mod1,"Catalysed") || InStr(FlasksData[A_Index].mod2,"Catalysed") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"催化的*") || InStr(FlasksData[A_Index].mod2,"催化的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"Saturated") || InStr(FlasksData[A_Index].mod2,"Saturated") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else If ( InStr(FlasksData[A_Index].mod1,"飽和的*") || InStr(FlasksData[A_Index].mod2,"飽和的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else
				FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)
         }
         
         If InStr(FlaskTypeStr, "FlaskHybrid")
         {
            FlasksData[A_Index].HPRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+4)
            FlasksData[A_Index].ManaRegAmount:=ReadMemUInt(pH,FlaskLocalstatsPtr+0xC)
            If ( InStr(FlasksData[A_Index].mod1,"Bubbling") || InStr(FlasksData[A_Index].mod2,"Bubbling") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
            Else If ( InStr(FlasksData[A_Index].mod1,"起泡的*") || InStr(FlasksData[A_Index].mod2,"起泡的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/2.35)
			Else If ( InStr(FlasksData[A_Index].mod1,"Catalysed") || InStr(FlasksData[A_Index].mod2,"Catalysed") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"催化的*") || InStr(FlasksData[A_Index].mod2,"催化的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
            Else If ( InStr(FlasksData[A_Index].mod1,"Saturated") || InStr(FlasksData[A_Index].mod2,"Saturated") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else If ( InStr(FlasksData[A_Index].mod1,"飽和的*") || InStr(FlasksData[A_Index].mod2,"飽和的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/0.67)
            Else
				FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)
         }

         If InStr(FlaskTypeStr, "FlaskUtility")
         {
			If ( InStr(FlasksData[A_Index].mod1,"Alchemist") || InStr(FlasksData[A_Index].mod2,"Alchemist") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
			Else If ( InStr(FlasksData[A_Index].mod1,"鍊金的*") || InStr(FlasksData[A_Index].mod1,"鍊金的*") )
				FlasksData[A_Index].EffectDuration:=(ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)/1.5)
			Else
				FlasksData[A_Index].EffectDuration:=ReadMemUInt(pH,FlaskLocalstatsPtr+0x14)
         }
      }
   }
}

IsInGame(hwnd)
{
	global Steam
   global Offset3

   If (hwnd=0 || hwnd="")
      return false
   GetWindowBasics(hwnd,mBase,pH)
   If (mBase="" || mBase=0 || pH="" || pH=-1)
      return false
   fBase:=GetFrameBase(hwnd)
   If (fBase="" || fBase=0)
      return false
   localConnection:=ReadMemUInt(pH,fBase+Offset3)
   If (localConnection=0 || localConnection="")
      return false
   Else
      return true
}

SetGameStateMenu(hwnd)
{
   global Steam
   global Offset3
   global Offset5

   If (hwnd=0 || hwnd="")
      return false
   GetWindowBasics(hwnd,mBase,pH)
   If (mBase="" || mBase=0 || pH="" || pH=-1)
      return false
   fBase:=GetFrameBase(hwnd)
   If (fBase="" || fBase=0)
      return false
   localConnection:=ReadMemUInt(pH,fBase+Offset3)
   If (localConnection!="" && localConnection!=0)
   {
      WriteMemUInt(pH,localConnection+Offset5,1)
   }
}

ReadHeroPos(hwnd,ByRef x, ByRef y)
{
   global Steam
   global Offset1
   global Offset2

   GetWindowBasics(hwnd,mBase,pH)
   If (mBase!=0 && pH && pH!=-1)
   {
      FrameBase:=GetFrameBase(hwnd)

      PlayerPosBase:=GetMultilevelPointer(pH,[FrameBase+Offset1,Offset2,0x24])

      x:=ReadMemFloat(pH,PlayerPosBase+0x2c)
      y:=ReadMemFloat(pH,PlayerPosBase+0x30)

      return true
   }   
}

ScreenToClient(hwnd, ByRef x, ByRef y)
{
    VarSetCapacity(pt, 8)
    NumPut(x, pt, 0)
    NumPut(y, pt, 4)
    DllCall("ScreenToClient", "uint", hwnd, "uint", &pt)
    x := NumGet(pt, 0, "int")
    y := NumGet(pt, 4, "int")
   VarSetCapacity(pt, 0)
}

GetClientCoords(byRef mx, byRef my)
{
   hwnd:=WinActive("A")   
   CoordMode, Mouse, Screen
   MouseGetPos, mx, my
   ScreenToClient(hwnd,mx,my) ;  x 580   y 435
}

QuitToLoginScreen(hwnd)
{  
   If (!IsInGame(hwnd))
   {
      return
   }
   SetGameStateMenu(hwnd)
}

GetMaxChargesFlaskOfType(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      If (InStr(FlasksData[A_Index].type,TypeStr))
      {
         If ((FlasksData[A_Index].ChargesCurrent>currMaxCharges) && (FlasksData[A_Index].ChargesCurrent>=FlasksData[A_Index].ChargesPerUse))
         {
            currMaxI:=A_Index
            currMaxCharges:=FlasksData[A_Index].ChargesCurrent
         }
      }
   return currMaxI
}

GetMaxChargesFlaskOfMod(ByRef FlasksData,ModStr)
{
   currMaxCharges:=0
   Loop, 5
      If ((InStr(FlasksData[A_Index].mod1,ModStr)) || (InStr(FlasksData[A_Index].mod2,ModStr)))
      {
         If ((FlasksData[A_Index].ChargesCurrent>currMaxCharges) && (FlasksData[A_Index].ChargesCurrent>=FlasksData[A_Index].ChargesPerUse))
         {
            currMaxI:=A_Index
            currMaxCharges:=FlasksData[A_Index].ChargesCurrent
         }
      }
   return currMaxI
}

GetMaxChargesFlaskQuickSilver(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      If (InStr(FlasksData[A_Index].type,TypeStr))
      {
         If FlasksData[A_Index].ChargesCurrent>=40
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
      }
   return currMaxI
}

GetMaxChargesFlaskQuickSilver2(ByRef FlasksData,TypeStr)
{
   currMaxCharges:=0
   Loop, 5
      If (InStr(FlasksData[A_Index].type,TypeStr))
      {
         If FlasksData[A_Index].ChargesCurrent>=20
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
      }
   return currMaxI
}

GetMaxChargesOfInstantFlask(ByRef FlasksData,TypeStr)
{
   global PanickedTimer
   currMaxCharges:=0
   Loop, 5
      If (InStr(FlasksData[A_Index].type,TypeStr))
      {
         If (InStr(FlasksData[A_Index].mod1,"Seething"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod2,"Seething"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod1,"沸騰的"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod2,"沸騰的"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod1,"Bubbling"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod2,"Bubbling"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod1," 起泡的"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If (InStr(FlasksData[A_Index].mod2," 起泡的"))
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               currMaxI:=A_Index
               currMaxCharges:=FlasksData[A_Index].ChargesCurrent
            }
         }
         Else If ((InStr(FlasksData[A_Index].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
         Else If ((InStr(FlasksData[A_Index].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
         Else If ((InStr(FlasksData[A_Index].mod1,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
         Else If ((InStr(FlasksData[A_Index].mod2,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
         {
            If FlasksData[A_Index].ChargesCurrent>currMaxCharges
            {
               If (PanickedTimer>35)
               {
                  currMaxI:=A_Index
                  currMaxCharges:=FlasksData[A_Index].ChargesCurrent
                  PanickedTimer:= 0
               }
            }
         }
      }
   return currMaxI
}

FileMD5( sFile="", cSz=4 )
{  ; by SKAN www.autohotkey.com/community/viewtopic.php?t=64211
	cSz := (cSz<0||cSz>8) ? 2**22 : 2**(18+cSz), VarSetCapacity( Buffer,cSz,0 ) ; 18-Jun-2009
	hFil := DllCall( "CreateFile", Str,sFile,UInt,0x80000000, Int,3,Int,0,Int,3,Int,0,Int,0 )
	IfLess,hFil,1, Return,hFil
	hMod := DllCall( "LoadLibrary", Str,"advapi32.dll" )
	DllCall( "GetFileSizeEx", UInt,hFil, UInt,&Buffer ),    fSz := NumGet( Buffer,0,"Int64" )
	VarSetCapacity( MD5_CTX,104,0 ),    DllCall( "advapi32\MD5Init", UInt,&MD5_CTX )
	Loop % ( fSz//cSz + !!Mod( fSz,cSz ) )
	DllCall( "ReadFile", UInt,hFil, UInt,&Buffer, UInt,cSz, UIntP,bytesRead, UInt,0 )
	, DllCall( "advapi32\MD5Update", UInt,&MD5_CTX, UInt,&Buffer, UInt,bytesRead )
	DllCall( "advapi32\MD5Final", UInt,&MD5_CTX )
	DllCall( "CloseHandle", UInt,hFil )
	Loop % StrLen( Hex:="123456789ABCDEF0" )
	N := NumGet( MD5_CTX,87+A_Index,"Char"), MD5 .= SubStr(Hex,N>>4,1) . SubStr(Hex,N&15,1)
	Return MD5, DllCall( "FreeLibrary", UInt,hMod )
}


Main()
{
	global AutoFlaskWatchdogPeriod
	global lagCompensation
	global PlayerConfig
	global WindowQueuedFlaskEffects
	global cliname
	global cliexe
	global cliexesteam
	global trayNotIfications
	global autoQuitMode
	global desync
	global remaining
   global hideout
	global tradechat
	global borderless
	global ResyncTimer
	global ResyncSpam
   global RemainingTimer
   global RemainingSpam
	global tradechat
	global TradeSpam
	global TradeSpamTimer
	global TradeTimer
	global TradeChannel
	global TradeStep
	global PanickedTimer
	global QuickSilverCheck
	global QuickSilverCheck2
	global AttackInPlaceCheck
	global AttackInPlaceKeyUp
	global ChatStatusTimer
	global ChatCheckTimer
	global Steam
	global MovementTimer
	global 20secsTimer
	global FLaskHotkey1
	global FLaskHotkey2
	global FLaskHotkey3
	global FLaskHotkey4
	global FLaskHotkey5
	global LastHP
	global LastES
	global LastMaxHP
	global LastMaxES
	global AttackInPlaceKey
	global FlaskOnFrozenCheck
	global FlaskOnShockedCheck
	global FlaskOnIgnitedCheck
	global QuicksilverBuff
   global FlaskOnCurseCheck
   global FlaskOnCorruptedBloodCheck
   global HoldCtrlCheck
   global CtrlkeyDown
   global AttackInPlaceKeyDown
   global Taiwan
   global Singapore
   global ClientServerMode
   global ConfigPath

	WinGet, WinID, List, %cliname%

	Loop, %WinID%
	{
      
		WinGet, ProcModuleName, ProcessName,  % "ahk_id" WinID%A_Index%

		If (ProcModuleName!="PathOfExile.exe") And (ProcModuleName!="PathOfExileSteam.exe") ; got a window with title "Path of Exile" but exe is not Client.exe, perhaps we have browser window open with PoE site, ignore it
        {
        	continue
        }
        
		If (ProcModuleName="PathOfExileSteam.exe")
		{
			Steam:=True
			cliexe:="PathOfExileSteam.exe"
		}

		Else If (ProcModuleName="PathOfExile.exe")
		{
			Steam:=False
			cliexe=PathOfExile.exe
		}

		If (WinID%A_Index%=WinActive("A"))
		ThisID:=WinActive("A")

      ;--------------Get keys Start---------------
  
      If (A_TickCount>=20secsTimer+20000)
      {
         ;Loop, 5
         ;{
            FileRead, ProductionConfig, %ConfigPath%
            ;FileReadLine, ProductionConfig, %ConfigPath%, 

            Loop, read, %ConfigPath%
            {
                Loop, parse, A_LoopReadLine, %A_Tab%
                {
                     testfield = %A_LoopField%
                     testfield .= ""

                     IfInString, testfield, attack_in_place
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        AttackInPlaceKey=vk%vk%
                        continue
                     }
                     IfInString, testfield, use_flask_in_slot1
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        FlaskHotkey1={vk%vk%
                        continue
                     }
                     IfInString, testfield, use_flask_in_slot2
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        FlaskHotkey2={vk%vk%
                        continue
                     }
                     IfInString, testfield, use_flask_in_slot3
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        FlaskHotkey3={vk%vk%
                        continue
                     }
                     IfInString, testfield, use_flask_in_slot4
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        FlaskHotkey4={vk%vk%
                        continue
                     }
                     IfInString, testfield, use_flask_in_slot5
                     {
                        StringGetPos, StringPos, testfield, =
                        vk := SubStr(testfield, StringPos+2)
                        SetFormat, IntegerFast, hex
                        vk += 0
                        vk .= ""
                        SetFormat, IntegerFast, d
                        FlaskHotkey5={vk%vk%
                        continue
                     }
                }
            }
            ;FlaskHotkey%A_Index%={vk%vk%
         ;}
         
         20secsTimer:=A_TickCount
      }

      ;--------------Get keys End-----------------

      PlayerStats:={}
      ReadPlayerStats(WinID%A_Index%, PlayerStats)

      CurrentConfig:=PlayerConfig["Default"]

      If (PlayerStats.MaxHP<1 || PlayerStats.CurrHP=0) ;dead, don't bother
      {
         continue
      }

      If (!IsInGame(WinID%A_Index%))
      {
         LastHP:=0
         LastES:=0
         LastMaxHP:=0
         LastMaxES:=0
         continue
      }
      
		If PlayerStats.MaxEShield>0
		{
			currEShieldRatio:=PlayerStats.CurrEShield/PlayerStats.MaxEShield
			LastEShieldRatio:=LastES/PlayerStats.MaxEShield
			If (LastMaxES!=PlayerStats.MaxEShield)
			{
				LastEShieldRatio:=0
			}
		}
		Else 
		{
			currEShieldRatio:= 1
		}

		If (PlayerStats.MaxHP>1)
		{
			currLifeRatio:=PlayerStats.CurrHP/(PlayerStats.MaxHP-PlayerStats.ReservedHPFlat-PlayerStats.MaxHP*PlayerStats.ReservedHPPercent/100)
			LastLifeRatio:=LastHP/(PlayerStats.MaxHP-PlayerStats.ReservedHPFlat-PlayerStats.MaxHP*PlayerStats.ReservedHPPercent/100)	
			If (LastMaxHP!=PlayerStats.MaxHP)
			{
				LastLifeRatio:=0
			}
		}
		Else
		{
			currLifeRatio:=1
         LastLifeRatio:=0
		}
      
		If (PlayerStats.MaxMana>0)
		{
			currManaRatio:=PlayerStats.CurrMana/(PlayerStats.MaxMana-PlayerStats.ReservedManaFlat-PlayerStats.MaxMana*PlayerStats.ReservedManaPercent/100)
		}
      
		If (currLifeRatio<CurrentConfig.minLifeRatioToQuit || currEShieldRatio<CurrentConfig.minEShieldRatioToQuit || (currLifeRatio<LastLifeRatio And ((LastLifeRatio-currLifeRatio)>CurrentConfig.maxLifeRatioPerHitToQuit) And (CurrentConfig.maxLifeRatioPerHitToQuit<1 And CurrentConfig.maxLifeRatioPerHitToQuit>0)) || (CurrentConfig.maxEShieldRatioPerHitToQuit>0 And currEShieldRatio<LastEShieldRatio And ((LastEShieldRatio-currEShieldRatio)>CurrentConfig.maxEShieldRatioPerHitToQuit)))
		{
			If (autoQuitMode=0)
			{
				QuitToLoginScreen(WinID%A_Index%)
				continue
			}
			Else If (autoQuitMode=1)
			{
				run, cports.exe /close * * * * PathofExile.exe
				continue
			}
			Else If (autoQuitMode=3)
			{
            WinActivate Path of Exile ahk_class POEWindowClass
				IfWinActive Path of Exile ahk_class POEWindowClass
            {
               SendInput {ALT Down}
               SendInput {F4}
               SendInput {ALT Up}
            }
				continue
			}
			Else If (autoQuitMode=4)
			{

			}
		}

		If (PlayerStats.CurrHP>0)
		{
			LastHP:=PlayerStats.CurrHP
			LastES:=PlayerStats.CurrEShield
			LastMaxHP:=PlayerStats.MaxHP
			LastMaxES:=PlayerStats.MaxEShield
		}
		Else
		{
			LastHP:=0
			LastES:=0
			LastMaxHP:=0
			LastMaxES:=0
		}


		FlasksData:=[]
		ReadFlasksData(WinID%A_Index%,FlasksData)

		WinGet, CurrPID, PID,  % "ahk_id" WinID%A_Index%
		hwnd:=WinID%A_Index%
		k="%hwnd%%CurrPid%"

		If (!WindowQueuedFlaskEffects.HasKey(k))
		{
			WindowQueuedFlaskEffects[k]:={}
		}

		If (currLifeRatio>=0.90)
		{
			WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount
         WindowQueuedFlaskEffects[k].InstantQueueEndtime:=A_TickCount
		}

		If (currManaRatio>=0.90)
		{
			WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount
		}

		If (PlayerStats.BuffAmount>100)
		{
			BuffAmount:=0
		}
		Else
		{
			BuffAmount:=PlayerStats.BuffAmount
		}

		QuicksilverBuff:=0

		RemAilmentsTimer:=Round(CurrentConfig.RemAilmentsTimer/10,1)

      LeavingArea:=0
      GracePeriod:=0

      TrayTip, , %Offset1%

      loop, %BuffAmount%
		{
			BuffTimer:=PlayerStats.BuffTimer[A_Index]

			If InStr(playerstats.BuffName[A_Index], "aura")
			{
				continue
			}

			Else If InStr(playerstats.BuffName[A_Index], "flask_utility_sprint")
			{
				QuicksilverBuff:=1
				If (BuffTimer<0.25)
				{
					QuicksilverBuff:=0
					BuffTimer:=0
				}
				continue
			}


			Else If (InStr(playerstats.BuffName[A_Index], "frozen") || InStr(playerstats.BuffName[A_Index], "冰凍"))
			{
				If ((FlaskOnFrozenCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("FrozenQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].FrozenQueueEndtime-lagCompensation)))
					{
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"熱火之")
                  }
                  else
                  {
						   flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Heat")
                  }

						If (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].FrozenQueueEndtime:=A_TickCount+300
							
							If (trayNotIfications)
							{
								TrayTip, PoE AutoFlask Using "of Heat" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
						}
					}
				}
				continue
			}

			Else If (InStr(playerstats.BuffName[A_Index], "shocked") || InStr(playerstats.BuffName[A_Index], "感電"))
			{
				If ((FlaskOnShockedCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("ShockedQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].ShockedQueueEndtime-lagCompensation)))
					{
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"接地之")
                  }
                  else
                  {
						   flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Grounding")
						}

                  If (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].ShockedQueueEndtime:=A_TickCount+300
							
							If (trayNotIfications)
							{
								TrayTip, PoE AutoFlask Using "of Grounding" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
						}
					}
				}
				continue
			}

			Else If (InStr(playerstats.BuffName[A_Index], "ignited") || InStr(playerstats.BuffName[A_Index], "燃燒"))
			{
				If ((FlaskOnIgnitedCheck) && (BuffTimer>=RemAilmentsTimer))
				{
					If ((!WindowQueuedFlaskEffects[k].HasKey("IgnitedQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].IgnitedQueueEndtime-lagCompensation)))
					{
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"澆熄之")
                  }
                  else
                  {
						   flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Dousing")
                  }

						If (flaskNum!="")
						{  
							WindowQueuedFlaskEffects[k].IgnitedQueueEndtime:=A_TickCount+300
							
							If (trayNotIfications)
							{
								TrayTip, PoE AutoFlask Using "of Dousing" flask %flaskNum%, %A_Space% , 2
							}
							hKey:=FlaskHotkey%flaskNum%
							IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
						}
					}
				}
				continue
			}

         Else If (((InStr(playerstats.BuffName[A_Index], "curse")) || InStr(playerstats.BuffName[A_Index], "冰凍")) And !(InStr(playerstats.BuffName[A_Index], "flask")) And !(PlayerStats.BuffTimer[A_Index]="1.#INF00"))
         {
            If (FlaskOnCurseCheck)
            {
               If ((!WindowQueuedFlaskEffects[k].HasKey("CurseQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].CurseQueueEndtime-lagCompensation)))
               {
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"守護之")
                  }
                  else
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Warding")
                  }

                  If (flaskNum!="")
                  {  
                     WindowQueuedFlaskEffects[k].CurseQueueEndtime:=A_TickCount+300
                     
                     If (trayNotIfications)
                     {
                        TrayTip, PoE AutoFlask Using "of Warding" flask %flaskNum%, %A_Space% , 2
                     }
                     hKey:=FlaskHotkey%flaskNum%
                     IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
                  }
               }
            }
            continue
         }

         Else If (InStr(playerstats.BuffName[A_Index], "corrupted_blood") || InStr(playerstats.BuffName[A_Index], "腐化之血"))
         {
            global RemoveCorruptedBloodCharges
            BuffCharges:=PlayerStats.BuffCharges[A_Index]
            If ((FlaskOnCorruptedBloodCheck) && (BuffCharges>=RemoveCorruptedBloodCharges))
            {
               If ((!WindowQueuedFlaskEffects[k].HasKey("CorruptedBloodQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime-lagCompensation)))
               {
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"止血之")
                  }
                  else
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Staunching")
                  }

                  If (flaskNum!="")
                  {  
                     WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime:=A_TickCount+300
                     
                     If (trayNotIfications)
                     {
                        TrayTip, PoE AutoFlask Using "of Staunching" flask %flaskNum%, %A_Space% , 2
                     }
                     hKey:=FlaskHotkey%flaskNum%
                     IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
                  }
               }
            }
            continue
         }

         Else If InStr(playerstats.BuffName[A_Index], "puncture")
         {
            If ((FlaskOnCorruptedBloodCheck))
            {
               If ((!WindowQueuedFlaskEffects[k].HasKey("CorruptedBloodQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime-lagCompensation)))
               {
                  If Taiwan
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"止血之")
                  }
                  else
                  {
                     flaskNum:=GetMaxChargesFlaskOfMod(FlasksData,"of Staunching")
                  }

                  If (flaskNum!="")
                  {  
                     WindowQueuedFlaskEffects[k].CorruptedBloodQueueEndtime:=A_TickCount+300
                     
                     If (trayNotIfications)
                     {
                        TrayTip, PoE AutoFlask Using "of Staunching" flask %flaskNum%, %A_Space% , 2
                     }
                     hKey:=FlaskHotkey%flaskNum%
                     IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        Sendinput, %hkey% Down}
                        Sendinput, %hkey% Up}
                     } 
                     Else
                     {
                        ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                     }
                  }
               }
            }
            continue
         }
         /* Lag dependent?
         Else If InStr(playerstats.BuffName[A_Index], "flask_effect_Life")
         {
            If (BuffTimer)
            {
               WindowQueuedFlaskEffects[k].hpQueueEndtime:=(A_TickCount+(BuffTimer*100))
            }
            continue
         }

         Else If InStr(playerstats.BuffName[A_Index], "flask_effect_mana")
         {
            If (BuffTimer)
            {
               WindowQueuedFlaskEffects[k].ManaQueueEndtime:=(A_TickCount+(BuffTimer*100))
            }
            continue
         }
         */

         Else If InStr(playerstats.BuffName[A_Index], "leaving_area_protection")
         {
            LeavingArea:=1
            continue
         }
         Else If InStr(playerstats.BuffName[A_Index], "grace_period")
         {
            GracePeriod:=1
            continue
         }
         

			/* ;Others
			Else If InStr(playerstats.BuffName[A_Index], "chilled")
			{
				TrayTip, test , THIS BUFF IS CHILLED!!! buff%A_Index%
				continue
			}

			Else If InStr(playerstats.BuffName[A_Index], "puncture")
			{
				TrayTip, test, THIS BUFF IS PUNCTURE!!! buff%A_Index%
				continue
			}

			Else If InStr(playerstats.BuffName[A_Index], "endurance_charge")
			{
				BuffCharges:=PlayerStats.BuffCharges[A_Index]
				TrayTip, test, Endurance Charge has %BuffCharges% charges  ;charges test
				continue
			}
			*/
		}

      If (!GracePeriod && !LeavingArea)
      {
         If (currLifeRatio<CurrentConfig.minLifeRatioToInstant)
         {
            If ((!WindowQueuedFlaskEffects[k].HasKey("InstantQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].InstantQueueEndtime)))
            {
               tflaskNum2:=GetMaxChargesOfInstantFlask(FlasksData,"FlaskLife")
               If (tflaskNum2!="")
               {
                  flaskNum:=tflaskNum2
               }
               If (flaskNum!="")
               {  
                  IfDelay:= (CurrentConfig.IflaskDelay*10)
                  WindowQueuedFlaskEffects[k].InstantQueueEndtime:=A_TickCount+IfDelay
                  If (trayNotIfications)
                  {
                     TrayTip, PoE AutoFlask Using HP Flask %flaskNum%, %A_Space% , 2
                  }
                  hKey:=FlaskHotkey%flaskNum%
                  IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
                  break
               }
            }
         }

      	If (currLifeRatio<CurrentConfig.minLifeRatioToDrink)
      	{
      		If ((!WindowQueuedFlaskEffects[k].HasKey("hpQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].hpQueueEndtime-lagCompensation)))
      		{
      			tflaskNum2:=GetMaxChargesFlaskOfType(FlasksData,"FlaskLife")
      			tflaskNum1:=GetMaxChargesFlaskOfType(FlasksData,"FlaskHybrid")
      			If ((tflaskNum1!=) && (tflaskNum2!=))
      			{
      				flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
      			}
      			Else
      			{
      				If (tflaskNum1!="")
      				{
      					flaskNum:=tflaskNum1
      				}
      				If (tflaskNum2!="")
      				{
      					flaskNum:=tflaskNum2
      				}
      			}
      			If (flaskNum!="")
      			{  
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				If (InStr(FlasksData[flaskNum].mod1,"Seething"))
      				{
      					WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
      				}
      				Else If (InStr(FlasksData[flaskNum].mod2,"Seething"))
      				{
      					WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
      				}
                  Else If (InStr(FlasksData[flaskNum].mod1,"沸騰的"))
                  {
                     WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
                  }
                  Else If (InStr(FlasksData[flaskNum].mod2,"沸騰的"))
                  {
                     WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
                  }
      				Else If ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
      				{
      					WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
      				}
      				Else If ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
      				{
      					WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
      				}
                  Else If ((InStr(FlasksData[flaskNum].mod1,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
                  {
                     WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
                  }
                  Else If ((InStr(FlasksData[flaskNum].mod2,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
                  {
                     WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+500
                  }
      				Else
      				{
      					WindowQueuedFlaskEffects[k].hpQueueEndtime:=A_TickCount+EffectDuration*100
      				}
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using HP flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				Break
      			}
      		}
      	}

      	If (currLifeRatio<CurrentConfig.minLifeRatioToPopJade || currEShieldRatio<CurrentConfig.minEShieldRatioToPopJade)
      	{
      		If ((!WindowQueuedFlaskEffects[k].HasKey("jadeQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].jadeQueueEndtime-lagCompensation)))
      		{
      			flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility9") ; Jade Flask
      			If (flaskNum!="")
      			{
      			   EffectDuration:=FlasksData[flaskNum].EffectDuration
      			   WindowQueuedFlaskEffects[k].jadeQueueEndtime:=A_TickCount+EffectDuration*100
      			   If (trayNotIfications)
      			   {
      			      TrayTip, PoE AutoFlask Using Jade Flask %flaskNum%, %A_Space% , 2
      			   }
      			   hKey:=FlaskHotkey%flaskNum%
      			   IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      			   break
      			}
      		}
      		            If ((!WindowQueuedFlaskEffects[k].HasKey("GraniteQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].GraniteQueueEndtime-lagCompensation)))
            {
               flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility1") ; Basalt Flask
               If (flaskNum = "")
               {
                  flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility5") ; Granite Flask
               }     
               If (flaskNum!="")
               {
                  EffectDuration:=FlasksData[flaskNum].EffectDuration
                  WindowQueuedFlaskEffects[k].GraniteQueueEndtime:=A_TickCount+EffectDuration*100
                  If (trayNotIfications)
                  {
                     TrayTip, PoE AutoFlask Using Granite/Basalt Flask %flaskNum%, %A_Space% , 2
                  }
                  hKey:=FlaskHotkey%flaskNum%
                  IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
                  break
               }
            }
         }

      	If (currLifeRatio<CurrentConfig.minLifeRatioToPopElementalResist || currEShieldRatio<CurrentConfig.minEShieldRatioToPopElementalResist)
      	{
      		If ((!WindowQueuedFlaskEffects[k].HasKey("RubyQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].RubyQueueEndtime-lagCompensation)))
      		{
      			flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility2") ; Ruby flask
      			If (flaskNum!="")
      			{
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				WindowQueuedFlaskEffects[k].RubyQueueEndtime:=A_TickCount+EffectDuration*100
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using Ruby Flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				break
      			}
      		}

      		If ((!WindowQueuedFlaskEffects[k].HasKey("TopazQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].TopazQueueEndtime-lagCompensation)))
      		{
      			flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility4") ; Topaz flask
      			If (flaskNum!="")
      			{
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				WindowQueuedFlaskEffects[k].TopazQueueEndtime:=A_TickCount+EffectDuration*100
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using Topaz Flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				break
      			}
      		}

      		If ((!WindowQueuedFlaskEffects[k].HasKey("SapphireQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].SapphireQueueEndtime-lagCompensation)))
      		{
      			flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility3") ; Sapphire flask
      			If (flaskNum!="")
      			{
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				WindowQueuedFlaskEffects[k].SapphireQueueEndtime:=A_TickCount+EffectDuration*100
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using Sapphire flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				break
      			}
      		}

      		If ((!WindowQueuedFlaskEffects[k].HasKey("AmethystQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].AmethystQueueEndtime-lagCompensation)))
      		{
      			flaskNum:=GetMaxChargesFlaskOfType(FlasksData,"FlaskUtility7") ; Amethyst flask
      			If (flaskNum!="")
      			{
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				WindowQueuedFlaskEffects[k].AmethystQueueEndtime:=A_TickCount+EffectDuration*100
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using Amethyst Flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				break
      			}
      		}
      	}

      	If (PlayerStats.MaxMana>0 && (currManaRatio<CurrentConfig.minManaRatioToDrink || PlayerStats.CurrMana<CurrentConfig.minManaToDrink))
      	{      
      		If ((!WindowQueuedFlaskEffects[k].HasKey("ManaQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].ManaQueueEndtime-lagCompensation)))
      		{
      			tflaskNum2:=GetMaxChargesFlaskOfType(FlasksData,"FlaskMana")
      			tflaskNum1:=GetMaxChargesFlaskOfType(FlasksData,"FlaskHybrid")
      			  
      			If ((tflaskNum1!=) && (tflaskNum2!=))
      			{
      				flaskNum:=(FlasksData[tflaskNum1].ChargesCurrent>FlasksData[tflaskNum2].ChargesCurrent) ? tflaskNum1 : tflaskNum2
      			}
      			Else
      			{
      				If (tflaskNum1!="")
      				{
      					flaskNum:=tflaskNum1
      				}
      				If (tflaskNum2!="")
      				{
      					flaskNum:=tflaskNum2
      				}
      			}

      			If (flaskNum!="")
      			{
      				EffectDuration:=FlasksData[flaskNum].EffectDuration
      				If (InStr(FlasksData[flaskNum].mod1,"Seething"))
      				{
      					WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
      				}
      				Else If (InStr(FlasksData[flaskNum].mod2,"Seething"))
      				{
      					WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
      				}
                  Else If (InStr(FlasksData[flaskNum].mod1,"沸騰的"))
                  {
                     WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
                  }
                  Else If (InStr(FlasksData[flaskNum].mod2,"沸騰的"))
                  {
                     WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
                  }
      				Else If ((InStr(FlasksData[flaskNum].mod1,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
      				{
      					WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
      				}
      				Else If ((InStr(FlasksData[flaskNum].mod2,"Panicked")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
      				{
      					WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
      				}
                  Else If ((InStr(FlasksData[flaskNum].mod1,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
                  {
                     WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
                  }
                  Else If ((InStr(FlasksData[flaskNum].mod2,"恐慌的")) And ((PlayerStats.CurrHP/PlayerStats.MaxHP)<=0.35)) ; "Low Life" can be caused by auras hp reservation from blood magic
                  {
                     WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+500
                  }
      				Else
      				{
      					WindowQueuedFlaskEffects[k].ManaQueueEndtime:=A_TickCount+EffectDuration*100
      				}
      				If (trayNotIfications)
      				{
      					TrayTip, PoE AutoFlask Using Mana Flask %flaskNum%, %A_Space% , 2
      				}
      				hKey:=FlaskHotkey%flaskNum%
      				IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     Sendinput, %hkey% Down}
                     Sendinput, %hkey% Up}
                  } 
                  Else
                  {
                     ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                  }
      				Break
      			}
      		}
      	}
      }

		If (PlayerStats.PlayerActionID!="" && PlayerStats.PlayerActionID!=128 && PlayerStats.PlayerActionID!=90)
		{
			MovementTimer:= A_TickCount
		}
		;TODO MovementTimer%A_Index%

		If(QuickSilverCheck && QuicksilverBuff=0)
		{
			If (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
			{
				If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
				{
					If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
					{
						If (PlayerStats.PlayerActionID!="" && (PlayerStats.PlayerActionID=128 || PlayerStats.PlayerActionID=90))
						{
							If (A_TickCount>=MovementTimer+CurrentConfig.QuickSilverTimer)
							{
								If ((!WindowQueuedFlaskEffects[k].HasKey("QuickQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].QuickQueueEndtime-lagCompensation)))
								{
									flaskNum:=GetMaxChargesFlaskQuickSilver(FlasksData,"FlaskUtility6") ; QuickSilver flask
									If (flaskNum!="")
									{
										EffectDuration:=FlasksData[flaskNum].EffectDuration
										WindowQueuedFlaskEffects[k].QuickQueueEndtime:=A_TickCount+EffectDuration*100
										If (trayNotIfications)
										{
											TrayTip, PoE AutoFlask Using QuickSilver Flask %flaskNum%, %A_Space% , 2
										}
										hKey:=FlaskHotkey%flaskNum%
										IfWinActive Path of Exile ahk_class POEWindowClass
                              {
                                 Sendinput, %hkey% Down}
                                 Sendinput, %hkey% Up}
                              } 
                              Else
                              {
                                 ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                              }
										break
									}
								}
							}
						}
					}
				}
			}
		}

		If(QuickSilverCheck2 && QuicksilverBuff=0)
		{
			If (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
			{
				If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
				{
					If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
					{
						If (PlayerStats.PlayerActionID!="" && (PlayerStats.PlayerActionID=128 || PlayerStats.PlayerActionID=90))
						{
							If (A_TickCount>=MovementTimer+CurrentConfig.QuickSilverTimer)
							{
								If ((!WindowQueuedFlaskEffects[k].HasKey("QuickQueueEndtime")) || (A_TickCount>=(WindowQueuedFlaskEffects[k].QuickQueueEndtime-lagCompensation)))
								{
									flaskNum:=GetMaxChargesFlaskQuickSilver2(FlasksData,"FlaskUtility6") ; QuickSilver flask
									If (flaskNum!="")
									{
										EffectDuration:=FlasksData[flaskNum].EffectDuration
										WindowQueuedFlaskEffects[k].QuickQueueEndtime:=A_TickCount+EffectDuration*100
										If (trayNotIfications)
										{
											TrayTip, PoE AutoFlask Using QuickSilver flask %flaskNum%, %A_Space% , 2
										}
										hKey:=FlaskHotkey%flaskNum%
										IfWinActive Path of Exile ahk_class POEWindowClass
                              {
                                 Sendinput, %hkey% Down}
                                 Sendinput, %hkey% Up}
                              } 
                              Else
                              {
                                 ControlSend,,%hkey% Down %hkey% Up}, % "ahk_id" hwnd
                              }
										break
									}
								}
							}
						}
					}
				}
			}
		}
      
		If(AttackInPlaceCheck)
		{
			If (IsInGame(hwnd))
			{
				If (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
				{
					If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
					{
						If (PlayerStats.MouseOnEnemyStatus!="" && PlayerStats.MouseOnEnemyStatus=4)
						{
							If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
							{
								If (PlayerStats.EnemyName!="")
								{
									If (PlayerStats.EnemyName2!="Oak}" && PlayerStats.EnemyName2!="Alira}" && PlayerStats.EnemyName2!="Kraityn}")
									{
										If (InStr(PlayerStats.EnemyName2,"Shrine") || InStr(PlayerStats.EnemyName2,"(Level)"))
										{
											AttackInPlaceKeyUp:=1
										}
										Else
										{
											IfWinActive Path of Exile ahk_class POEWindowClass
											{
                                    GetKeyState, stateSH, %AttackInPlaceKey%
                                    If stateSH = U
                                    {
   												Sendinput, {%AttackInPlaceKey% DOWN}
   												AttackInPlaceKeyUp:=0
                                       AttackInPlaceKeyDown:=1
                                    }
											} 
											Else
											{
												AttackInPlaceKeyUp:=1
											}
										}
									}
									Else
									{
										AttackInPlaceKeyUp:=1
									}
								}
								Else
								{
									AttackInPlaceKeyUp:=1
								}
							}
							Else
							{
								AttackInPlaceKeyUp:=1
							}
						}
						Else
						{
							AttackInPlaceKeyUp:=1
						}
					}
					Else
					{
						AttackInPlaceKeyUp:=1
					}
				}
				Else
				{
					AttackInPlaceKeyUp:=1
				}
			}
			Else
			{
				AttackInPlaceKeyUp:=1
			}
			If (AttackInPlaceKeyUp=1 && AttackInPlaceKeyDown=1)
         {
            GetKeyState, stateSH, %AttackInPlaceKey%
            If stateSH = D
            {
               Sendinput, {%AttackInPlaceKey% UP}
            }
            AttackInPlaceKeyUp:=0
         }
		}

      If(HoldCtrlCheck)
      {
         If (IsInGame(hwnd))
         {
            If (PlayerStats.PanelWaypoint=65537 && PlayerStats.PanelInstanceManager=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
            {
               If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
               {
                  If (LeavingArea=0)
                  {
                     IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        GetKeyState, stateRCtrl, RCtrl
                        If stateRCtrl = U
                        {
                           Sendinput, {RCtrl Down}
                           CtrlKeyUp:=0
                           CtrlkeyDown:=1
                           If (trayNotIfications)
                           {
                              TrayTip, , CTRL key: DOWN, 1
                           }
                        }
                     } 
                     Else
                     {
                        CtrlKeyUp:=1
                     }
                  }
                  Else
                  {
                     CtrlKeyUp:=1
                  }
               }
               Else
               {
                  CtrlKeyUp:=1
               }
            }
            Else
            {
               CtrlKeyUp:=1
            }
         }
         Else
         {
            CtrlKeyUp:=1
         }
         If (CtrlKeyUp=1 && CtrlkeyDown=1)
         {
            GetKeyState, stateRCtrl, RCtrl
            If stateRCtrl = D
            {
               Sendinput, {RCtrl Up}
               If (trayNotIfications)
               {
                  TrayTip,, CTRL key: UP, 1
               }
               CtrlkeyDown=0
               CtrlKeyUp:=0
            }
         }
      }


      
   ;If (PlayerStats.PlayerActionID!="" && PlayerStats.PlayerActionID=2176)  ;2048 not
   ;If ((autoQuit=1) && (ThisID!="") && (ThisID!=WinActive("A")))
   ;WinActivate, % "ahk_id" ThisID
      
      ++PanickedTimer  ;TODO better way


      If desync = 1
      {
         If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            If (IsInGame(hwnd))
            {
               If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                  {
                  IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     SendInput {NumpadEnter}/oos{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/oos, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
         }
         desync := 0
      }

      If remaining = 1
      {
         If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            If (IsInGame(hwnd))
            {
               If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     SendInput {NumpadEnter}/remaining{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/remaining, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
            remaining := 0
            break
         }
      }

      If hideout = 1
      {
         If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
         {
            If (IsInGame(hwnd))
            {
               If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
               {
                  IfWinActive Path of Exile ahk_class POEWindowClass
                  {
                     SendInput {NumpadEnter}/hideout{NumpadEnter}
                  }
                  Else
                  {
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                     SetKeyDelay, 40, 20
                     ControlSend,,`/hideout, % "ahk_id" hwnd
                     SetKeyDelay, 0, 0
                     ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                  }
               }
            }
            hideout := 0
            break
         }
      }

      If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
      {
         ChatCheckTimer:= 1
      }

      If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65537)
      {
         If (A_TickCount>=(ChatStatusTimer+50))
         {
            If (IsInGame(hwnd))
            {
               IfWinActive Path of Exile ahk_class POEWindowClass
               {
                  ResyncTimer:= 0
                  TradeSpam:= 0
                  GuiControl, , TradeSpam, 0
                  GuiControl, , TradeSpamUpdate, 0
                  IniWrite, 0 , Config.ini, Config, TradeSpam
                  TradeChannel:= 1
                  tradechat:= 0
                  TradeTimer:= 0
                  TradeStep:= 3
                  TradeSpamTimer:= 3
               }
            }
         }
         Else
         {
            If ChatCheckTimer = 1
            {
               ChatStatusTimer:= A_TickCount
               ChatCheckTimer:= 0
            }
         }
      }

      If TradeSpam>0
      {
         If (A_TickCount>=(TradeSpamTimer+TradeSpam*60000))
         {
            tradechat:= 1
            TradeSpamTimer:= A_TickCount
         }
         Else If TradeSpamTimer = 3
         {
            tradechat:= 1
            TradeSpamTimer:= A_TickCount
         }
      }

      If tradechat = 1
      {
         SendMode, Input
         If (A_TickCount>=TradeTimer+1000+(TradeSpam*2000))
         {
            If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
            {
               If (IsInGame(hwnd))
               { 
                  If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                  {
                     IfWinActive Path of Exile ahk_class POEWindowClass
                     {
                        SendMode Input
                        GetKeyState, stateSH, SHIfT
                        If stateSH = D
                        {
                           Sendinput {SHIfT up}
                        }
                        If (TradeStep = 1)
                        {
                           Send {NumpadEnter}
                           Send /trade %TradeChannel%
                           Send {NumpadEnter}
                           TradeStep:= 2
                           TradeTimer:= A_TickCount
                        }
                        Else If (TradeStep = 2)
                        {
                           Send {NumpadEnter}{Up 2}{NumpadEnter}
                           TradeStep:= 3
                           TradeTimer:= A_TickCount
                        }
                        Else If (TradeStep = 3)
                        {
                           If (TradeChannel<10)
                           {
                              TradeChannel++
                              TradeStep:= 1
                              TradeTimer:= A_TickCount
                           }
                           Else
                           {
                              TradeChannel:= 1
                              tradechat:= 0
                              TradeTimer:= 0
                              TradeStep:= 1
                           }
                        }
                     }
                     Else
                     {
                        SendMode Input
                        GetKeyState, stateSH, SHIfT
                        If stateSH = D
                        {
                           Sendinput {SHIfT up}
                        }
                        If (TradeStep = 1)
                        {
                           SetKeyDelay, 60, 20
                           ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                           ControlSendRaw,,`/trade %TradeChannel%, % "ahk_id" hwnd
                           ControlSend,,{NumpadEnter}, % "ahk_id" hwnd
                           SetKeyDelay, 0, 0
                           TradeStep:= 2
                           TradeTimer:= A_TickCount
                        }
                        Else If (TradeStep = 2)
                        {
                           SetKeyDelay, 20, 20
                           ControlSend,,{NumpadEnter}{Up 2}{NumpadEnter}, % "ahk_id" hwnd
                           SetKeyDelay, 0, 0
                           TradeStep:= 3
                           TradeTimer:= A_TickCount
                        }
                        Else If (TradeStep = 3)
                        {
                           If (TradeChannel<10)
                           {
                              TradeChannel++
                              TradeStep:= 1
                              TradeTimer:= A_TickCount
                           }
                           Else
                           {
                              TradeChannel:= 1
                              tradechat:= 0
                              TradeTimer:= 0
                              TradeStep:= 1
                           }
                        }
                     }
                  }
               }
               ChatStatusTimer:= A_TickCount+99999999999
               ChatCheckTimer:= 1
            }
         }
      }
      Else
      {
         If (A_TickCount>=(ResyncTimer+ResyncSpam*1000) And (ResyncSpam>0))
         {
            If (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
            { 
               If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
               {
                  If (IsInGame(hwnd))
                  {
                     If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                     {
                        IfWinActive Path of Exile ahk_class POEWindowClass
                        {
                           GetKeyState, stateSH, SHIfT
                           If stateSH = D
                           {
                              Sendinput {SHIfT up}
                           }
                           Sendinput {NumpadEnter}/oos{NumpadEnter}
                        }
                     }
                  }
               }
            }
            ResyncTimer:= A_TickCount
         }

         If (A_TickCount>=(RemainingTimer+RemainingSpam*1000) And (RemainingSpam>0))
         {
            If (PlayerStats.InCity!="" && PlayerStats.InCity=65537)
            { 
               If (PlayerStats.ChatStatus!="" && PlayerStats.ChatStatus=65536)
               {
                  If (IsInGame(hwnd))
                  {
                     If (PlayerStats.PanelWaypoint=65536 && PlayerStats.PanelInventory=65536 && PlayerStats.PanelSkillTree=65536 && PlayerStats.PanelSocial=65536)
                     {
                        IfWinActive Path of Exile ahk_class POEWindowClass
                        {
                           GetKeyState, stateSH, SHIfT
                           If stateSH = D
                           {
                              Sendinput {SHIfT up}
                           }
                           Sendinput {NumpadEnter}/remaining{NumpadEnter}
                        }
                     }
                  }
               }
            }
            RemainingTimer:= A_TickCount
         }
      }

      ;--------------Debug Window Update------------------

      IfWinExist, Debug Window
      {
         MaxHPvalue:=PlayerStats.MaxHP
         GuiControl,4: , MaxHPvar , %MaxHPvalue%
         CurrHPvalue:=PlayerStats.CurrHP
         GuiControl,4: , CurrHPvar , %CurrHPvalue%
         ReservedHPFlatvalue:=PlayerStats.ReservedHPFlat
         GuiControl,4: , ReservedHPFlatvar , %ReservedHPFlatvalue%
         ReservedHPPercentvalue:=PlayerStats.ReservedHPPercent
         GuiControl,4: , ReservedHPPercentvar , %ReservedHPPercentvalue%
         MaxManavalue:=PlayerStats.MaxMana
         GuiControl,4: , MaxManavar , %MaxManavalue%
         CurrManavalue:=PlayerStats.CurrMana
         GuiControl,4: , CurrManavar , %CurrManavalue%
         ReservedManaFlatvalue:=PlayerStats.ReservedManaFlat
         GuiControl,4: , ReservedManaFlatvar , %ReservedManaFlatvalue%
         ReservedManaPercentvalue:=PlayerStats.ReservedManaPercent
         GuiControl,4: , ReservedManaPercentvar , %ReservedManaPercentvalue%
         MaxEShieldvalue:=PlayerStats.MaxEShield
         GuiControl,4: , MaxEShieldvar , %MaxEShieldvalue%
         CurrEShieldvalue:=PlayerStats.CurrEShield
         GuiControl,4: , CurrEShieldvar , %CurrEShieldvalue%
         PlayerActionIDvalue:=PlayerStats.PlayerActionID
         If (PlayerActionIDvalue=128 || PlayerActionIDvalue=90)
         {
            GuiControl,4: , PlayerActionIDvar , %PlayerActionIDvalue% (Moving)
         }
         Else If (PlayerActionIDvalue=2 || PlayerActionIDvalue=10 || PlayerActionIDvalue=12)
         {
            GuiControl,4: , PlayerActionIDvar , %PlayerActionIDvalue% (Attacking)
         }
         Else If (PlayerActionIDvalue=0)
         {
            GuiControl,4: , PlayerActionIDvar , %PlayerActionIDvalue% (Nothing)
         }
         Else If (PlayerActionIDvalue=64)
         {
            GuiControl,4: , PlayerActionIDvar , %PlayerActionIDvalue% (Dead)
         }
         Else
         {
            GuiControl,4: , PlayerActionIDvar , %PlayerActionIDvalue% (Unknown)
         }
         ChatStatusvalue:=PlayerStats.ChatStatus
         If (ChatStatusvalue=65537)
         {
            GuiControl,4: , ChatStatusvar , Opened
         }
         Else If (ChatStatusvalue=65536)
         {
            GuiControl,4: , ChatStatusvar , Closed
         }
         MouseOnEnemyStatusvalue:=PlayerStats.MouseOnEnemyStatus
         If (MouseOnEnemyStatusvalue=4)
         {
            GuiControl,4: , MouseOnEnemyStatusvar , Yes
         }
         Else If (MouseOnEnemyStatusvalue=3)
         {
            GuiControl,4: , MouseOnEnemyStatusvar , No
         }
         PanelWaypointvalue:=PlayerStats.PanelWaypoint
         If (PanelWaypointvalue=65537)
         {
            GuiControl,4: , PanelWaypointvar , Opened
         }
         Else If (PanelWaypointvalue=65536)
         {
            GuiControl,4: , PanelWaypointvar , Closed
         }
         PanelInventoryvalue:=PlayerStats.PanelInventory
         If (PanelInventoryvalue=65537)
         {
            GuiControl,4: , PanelInventoryvar , Opened
         }
         Else If (PanelInventoryvalue=65536)
         {
            GuiControl,4: , PanelInventoryvar , Closed
         }
         PanelSkillTreevalue:=PlayerStats.PanelSkillTree
         If (PanelSkillTreevalue=65537)
         {
            GuiControl,4: , PanelSkillTreevar , Opened
         }
         Else If (PanelSkillTreevalue=65536)
         {
            GuiControl,4: , PanelSkillTreevar , Closed
         }
         PanelSocialvalue:=PlayerStats.PanelSocial
         If (PanelSocialvalue=65537)
         {
            GuiControl,4: , PanelSocialvar , Opened
         }
         Else If (PanelSkillTreevalue=65536)
         {
            GuiControl,4: , PanelSocialvar , Closed
         }
         InCityvalue:=PlayerStats.InCity
         If (InCityvalue=65537)
         {
            GuiControl,4: , InCityvar , No
         }
         Else If (InCityvalue=65536)
         {
            GuiControl,4: , InCityvar , Yes
         }
         PanelInstanceManagervalue:=PlayerStats.PanelInstanceManager
         If (PanelInstanceManagervalue=65537)
         {
            GuiControl,4: , PanelInstanceManagervar , Opened
         }
         Else If (PanelInstanceManagervalue=65536)
         {
            GuiControl,4: , PanelInstanceManagervar , Closed
         }
         
         EnemyNamevalue:=PlayerStats.EnemyName
         GuiControl,4: , EnemyNamevar , %EnemyNamevalue%
         EnemyName2value:=PlayerStats.EnemyName2
         GuiControl,4: , EnemyName2var , %EnemyName2value%
         MapNamevalue:=PlayerStats.MapName
         GuiControl,4: , MapNamevar , %MapNamevalue%

         Loop, 5
         {
            Flask%A_Index%Typevalue:=FlasksData[A_Index].type
            value:=Flask%A_Index%Typevalue
            GuiControl,4: , Flask%A_Index%Typevar , %value%

            Flask%A_Index%ChargesCurrentvalue:=FlasksData[A_Index].ChargesCurrent
            value:=Flask%A_Index%ChargesCurrentvalue
            GuiControl,4: , Flask%A_Index%ChargesCurrentvar , %value%

            Flask%A_Index%ChargesPerUsevalue:=FlasksData[A_Index].ChargesPerUse
            value:=Flask%A_Index%ChargesPerUsevalue
            GuiControl,4: , Flask%A_Index%ChargesPerUsevar , %value%

            Flask%A_Index%mod1value:=FlasksData[A_Index].mod1
            value:=Flask%A_Index%mod1value
            GuiControl,4: , Flask%A_Index%mod1var , %value%

            Flask%A_Index%mod2value:=FlasksData[A_Index].mod2
            value:=Flask%A_Index%mod2value
            GuiControl,4: , Flask%A_Index%mod2var , %value%
         }

         BuffAmountvalue:=round(PlayerStats.BuffAmount)
         GuiControl,4: , BuffAmountvar , %BuffAmountvalue%

         Loop, 8
         {

            BuffName%A_Index%value:=PlayerStats.BuffName[A_Index]
            value:=BuffName%A_Index%value
            GuiControl,4: , Buff%A_Index%Namevar , %value%

            BuffCharges%A_Index%value:=PlayerStats.BuffCharges[A_Index]
            value:=BuffCharges%A_Index%value
            GuiControl,4: , Buff%A_Index%Chargesvar , %value%

            BuffTimer%A_Index%value:=PlayerStats.BuffTimer[A_Index]
            value:=BuffTimer%A_Index%value
            If (value="1.#INF00")
            {
               GuiControl,4: , Buff%A_Index%Timervar , Infinite
            }
            Else
            {
               GuiControl,4: , Buff%A_Index%Timervar , %value%
            }
         }
      }
      ;--------------Debug Window Update------------------
      Sleep, %AutoFlaskWatchdogPeriod%
   }
   Sleep, 1
}

;-------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------MAIN FUNCTIONS-----------------

;-------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------


UsePortal()
{
   IfWinActive Path of Exile ahk_class POEWindowClass
   {
      BlockInput On
      SendMode Input
      hwnd:=WinActive("A")
      GetKeyState, stateR, RButton
      If stateR = D
      {
         Send {RButton up}
      }
      GetKeyState, stateL, LButton
      If stateL = D
      {
         Send {LButton up}
      }
      GetKeyState, stateM, MButton
      If stateM = D
      {
         Send {MButton up}
      }
      GetKeyState, stateQ, Q
      If stateQ = D
      {
         Send {Q up}
      }
      GetKeyState, stateW, W
      If stateW = D
      {
         Send {W up}
      }
      GetKeyState, stateE, E
      If stateE = D
      {
         Send {E up}
      }
      GetKeyState, stateR, R
      If stateR = D
      {
         Send {R up}
      }
      GetKeyState, stateT, T
      If stateT = D
      {
         Send {T up}
      }
      GetKeyState, stateI, I
      If stateI = D
      {
         Send {I up}
      }
      GetKeyState, stateSP, SPACE
      If stateSP = D
      {
         Send {SPACE up}
      }
      GetKeyState, stateSH, SHIfT
      If stateSH = D
      {
         Send {SHIfT up}
      }
      ReadClientResolution(hwnd,w,h)
      Send {SPACE}
      Send {NumpadEnter}
      Send {Raw} /oos
      Send {NumpadEnter}
      Send {i}
      ErrorLevel = 1
      Sleep, 50
      ScrollX:= (w/2)
      ScrollY:= (h/2)
      PixElsearch, ScrollX, ScrollY, ScrollX, ScrollY, w, h, 0xFFFFFF, 1, fast  ;2b1d35  312238
      If ErrorLevel = 0
      {
         MouseMove, (ScrollX), (ScrollY),0
         If PortalInvCheck() = true
         {

         }
         Else If PortalInvCheck() = false
         {
            ScrollX:= (w/2)
            Loop
            {
               ErrorLevel = 1
               PixElsearch, ScrollX2, ScrollY2, ScrollX, ScrollY, (ScrollX+50), (ScrollY+10), 0xFFFFFF, 1, fast ;0xFBFBFB, 4, fast  ;2b1d35  312238
               If ErrorLevel = 0
               {
                  MouseMove, (ScrollX2), (ScrollY2),0
                  If PortalInvCheck() = true
                     Break
                  Else If PortalInvCheck() = false
                  {
                     Send {SPACE}
                     MouseMove, (w/2), (h/2), 0                      
                     BlockInput Off
                     Return
                  }
               }
               Else
               {
                  ScrollX:= (ScrollX+50)
                  Continue
               }
            }
         }
      }
      Send {RButton}
      Send {SPACE}
      Sleep, 50
      MouseMove, (w/2), (h/2),0
      Sleep, 50
      Send {LButton}
      sleep, 250
      Loop
      {
         ErrorLevel = 1
         PixElsearch, PixX, PixY, (w/4), (h/10), ((w/4)*3), h, 0xddbb30, 34, fast  ;0xdcc8c8 text color
         If ErrorLevel = 0
         {
            MouseMove, (PixX), (PixY),0
            Sleep, 20
            Send {LButton}
            Loop ;only search for portals when not moving
            {  
               ReadHeroPos(hwnd,PosX1,PosY1)
               sleep, 30
               ReadHeroPos(hwnd,PosX2,PosY2)
               If PosX1 = %PosX2%
               {
                  If PosY1 = %PosY2%
                  {
                     break
                  }
            
               }
               Else
               sleep, 30
            }
         }
         Else
         {
            Break
         }
      }
      Sleep, 50
      MouseMove, (w/2), (h/2),0
      Sleep, 50
      Send {LButton}
      Sleep, 50
      BlockInput Off
   }
   Else
   return
}

; Poe Default Style 0x14CF0000

Toggle_Window(window)
{
   global ClientX, ClientY, ClientW, ClientH
   IfWinActive Path of Exile ahk_class POEWindowClass
   {
      WinGet, S, Style, % "ahk_id " window   ; Get the style of the window
      If (S & +0x840000)      ; If not borderless
      {
         WinGetPos, ClientX, ClientY, ClientW, ClientH
         hwnd:=WinActive("A")
         ReadClientResolution(hwnd,w,h)
         
         WinSet, Style, -0x840000, % "ahk_id " window   ; Remove borders
         WinSet, Style, -0x400000, % "ahk_id " window

         WinMove, % "ahk_id " window,, %ClientX%, %ClientY%, %w%, %h%
         Confine := !Confine
         ClipCursor(Confine, (ClientX), (ClientY), (ClientX+w),(ClientY+h))
         return
      }
      If (S & -0x840000)      ; If borderless
      {
         WinSet, Style, +0x840000, % "ahk_id " window   ; Reapply borders
         WinSet, Style, +0x400000, % "ahk_id " window
         WinMove, % "ahk_id " window,, %ClientX%, %ClientY%, %ClientW%, %ClientW%
         Confine := !Confine
         ClipCursor(Confine, 0, 0, A_ScreenWidth, A_ScreenHeight)
         return
      }
   }
}

ClipCursor( Confine=True, x1=0 , y1=0, x2=1, y2=1 ) 
{
   VarSetCapacity(R,16,0),  NumPut(x1,&R+0),NumPut(y1,&R+4),NumPut(x2,&R+8),NumPut(y2,&R+12)
   Return Confine ? DllCall( "ClipCursor", UInt,&R ) : DllCall( "ClipCursor" )
}

; Parse clipboard content for item level and dps
Webgrab()
{
   global Rarity
   IfWinActive Path of Exile ahk_class POEWindowClass
   {
      SendMode Input
      clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
      ErrorLevel = 0
      Send ^c
      ClipWait, 0.05  ; Wait for the clipboard to contain text.
      If ErrorLevel = 1
      {
         return
      }
      NameIsDone := False
      ItemName :=

      Loop, Parse, Clipboard, `n, `r
      {
         ; Clipboard must have "Rarity:" in the first line
         If A_Index = 1
         {
            IfNotInString, A_LoopField, Rarity:
            {
               Exit
            }
            IfInString, A_LoopField, Rarity: Magic
            {
               Rarity:= 2
            }
            IfInString, A_LoopField, Rarity: Rare
            {
               Rarity:= 3
            }
            Else
            {
               Continue
            }

         }
      
         ; Get name
         If Not NameIsDone
         {
            If A_LoopField = --------
            {
               NameIsDone := True
            }
            Else
            {
               ItemName%A_Index% = %A_LoopField%
            }
            Continue
         }

         If (Rarity = 2)
         {
            IfInString, ItemName2, Flask
            {
               ItemName2 = Flask
               Run http://pathofexile.gamepedia.com/%ItemName2%
               Rarity:= 0
               return
            }
            Run http://www.poemods.com
            Rarity:= 0
            return
         }


         If (Rarity = 3)
         {
            Run http://www.poemods.com
            Rarity:= 0
            return
         }
         Else
         {
            StringReplace, ItemName2_, ItemName2, %A_SPACE%, _, All
            Run http://pathofexile.gamepedia.com/%ItemName2_%
            Rarity:= 0
            return
         }
      }
   }
   return
}


PortalInvCheck()
{
IfWinActive Path of Exile ahk_class POEWindowClass
{
         SendMode Input
         clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
         ErrorLevel = 0
         Send ^c
         ClipWait, 0.05  ; Wait for the clipboard to contain text.
         If ErrorLevel = 1
         {
            return false
         }

        ItemLevel := ""
        Name := ""
        Type := ""
        Quality := 0
        AttackSpeed := 0
        PhysicalDamageLow := 0
        PhysicalDamageHigh := 0
        IncreasedPhysicalDamage := 0
        FireDamageLow := 0
        FireDamageHigh := 0
        ColdDamageLow := 0
        ColdDamageHigh := 0
        LightningDamageLow := 0
        LightningDamageHigh := 0
        ChaosDamageLow := 0
        ChaosDamageHigh := 0
        Armour := 0
        EvasionRating := 0
        EnergyShield := 0
         

        Loop, parse, Clipboard, `n, `r          ; Goes through a loop with the lines of text found in the clipboard
        {
                If (A_Index = 1)
                {
                        IfNotInString, A_Loopfield, Rarity:             ; Starts a check whether it has "Rarity:" in the first line, otherwise exit
                        {
                                Exit
                        }
                }
                Else If (A_Index = 2)
                {
                        Name := A_Loopfield
                }
                Else If (A_Index = 3)
                {
                        Type := A_Loopfield
                }
                Else If (!ItemLevel && RegExMatch(A_Loopfield, "Itemlevel: (\d*)", SubPat))
                {
                        ItemLevel := SubPat1
                }
                Else If (!Quality && RegExMatch(A_Loopfield, "Quality: \+(\d*)\%", SubPat))
                {
                        Quality := SubPat1/100
                }
               
                Else If (!AttackSpeed && RegExMatch(A_Loopfield, "Attacks per Second: (\d\.\d*)", SubPat))
                {
                        AttackSpeed     := SubPat1
                }
                Else If (!PhysicalDamageLow && RegExMatch(A_Loopfield, "Physical Damage: (\d*)-(\d*)", SubPat))
                {
                        PhysicalDamageLow := SubPat1
                        PhysicalDamageHigh := SubPat2
                }
                Else If (!IncreasedPhysicalDamage && RegExMatch(A_Loopfield, "(\d*)\% increased Physical Damage", SubPat))
                {
                        IncreasedPhysicalDamage := SubPat1/100
                }
               
                Else If (!FireDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Fire Damage", SubPat))
                {
                        FireDamageLow := SubPat1
                        FireDamageHigh := SubPat2
                }
                Else If (!ColdDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Cold Damage", SubPat))
                {
                        ColdDamageLow := SubPat1
                        ColdDamageHigh := SubPat2
                }
                Else If (!LightningDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Lightning Damage", SubPat))
                {
                        LightningDamageLow := SubPat1
                        LightningDamageHigh := SubPat2
                }
                Else If (!ChaosDamageLow && RegExMatch(A_Loopfield, "Adds (\d*)-(\d*) Chaos Damage", SubPat))
                {
                        ChaosDamageLow := SubPat1
                        ChaosDamageHigh := SubPat2
                }      
               
                Else If (!Armour && RegExMatch(A_Loopfield, "Armour: (\d*)", SubPat))
                {
                        Armour:= SubPat1
                }
                Else If (!EvasionRating && RegExMatch(A_Loopfield, "Evasion Rating: (\d*)", SubPat))
                {
                        EvasionRating:= SubPat1
                }
                Else If (!EnergyShield && RegExMatch(A_Loopfield, "Energy Shield: (\d*)", SubPat))
                {
                        EnergyShield:= SubPat1
                }      
         }
   
      If (!ItemLevel) ; If we didn't get the itemlevel...
      {
         Portal := "Portal Scroll"
         If Portal = %name%
         return true
         Else
         return false
      }
   }
return false
}

;-------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------TEST FUNCTIONS-----------------

;-------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS-----

GuiUpdate:
   Gui, Submit, NoHide

   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
   GuiControl, , RemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
   GuiControl, , RemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%

   If (minLifePercentToQuit=0)
   {
      GuiControl, , minLifePercentToQuitUpdate, N/A
      GuiControl, , minLifePercentToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
      GuiControl, , minLifePercentToQuitUpdatePercent, `%
   }
   If (minESPercentToQuit=0)
   {
      GuiControl, , minESPercentToQuitUpdate, N/A
      GuiControl, , minESPercentToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
      GuiControl, , minESPercentToQuitUpdatePercent, `%
   }
   If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, `%
   }
   If (maxESPercentPerHitToQuit=0)
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent, `%
   }
   If (minLifePercentToJade=0)
   {
      GuiControl, , minLifePercentToJadeUpdate, N/A
      GuiControl, , minLifePercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
      GuiControl, , minLifePercentToJadeUpdatePercent, `% 
   }
   If (minESPercentToJade=0)
   {
      GuiControl, , minESPercentToJadeUpdate, N/A
      GuiControl, , minESPercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
      GuiControl, , minESPercentToJadeUpdatePercent, `%
   }
   If (minLifePercentToElementalResist=0)
   {
      GuiControl, , minLifePercentToElementalResistUpdate, N/A
      GuiControl, , minLifePercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
      GuiControl, , minLifePercentToElementalResistUpdatePercent, `%
   }
   If (minESPercentToElementalResist=0)
   {
      GuiControl, , minESPercentToElementalResistUpdate, N/A
      GuiControl, , minESPercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
      GuiControl, , minESPercentToElementalResistUpdatePercent, `%
   }
   If (minLifePercentToDrink=0)
   {
      GuiControl, , minLifePercentToDrinkUpdate, N/A
      GuiControl, , minLifePercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
      GuiControl, , minLifePercentToDrinkUpdatePercent, `%
   }
   If (minManaPercentToDrink=0)
   {
      GuiControl, , minManaPercentToDrinkUpdate, N/A
      GuiControl, , minManaPercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
      GuiControl, , minManaPercentToDrinkUpdatePercent, `%
   }
   If (minManaToDrinkPot=0)
   {
      GuiControl, , minManaToDrinkPotUpdate, N/A
   }
   Else
   {
      GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   }
   If (InstantFlaskDelay=0)
   {
      GuiControl, , InstantFlaskDelayUpdate, N/A
      GuiControl, , InstantFlaskDelayUpdatePercent, 
   }
   Else
   {
      GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
      GuiControl, , InstantFlaskDelayUpdatePercent, s

   }
   If (minLifePercentToSpam=0)
   {
      GuiControl, , minLifePercentToSpamUpdate, N/A
      GuiControl, , minLifePercentToSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
      GuiControl, , minLifePercentToSpamUpdatePercent, `%
   }
   If (TradeSpam=0)
   {
      GuiControl, , TradeSpamUpdate, N/A
      GuiControl, , TradeSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , TradeSpamUpdate, %TradeSpam%
      GuiControl, , TradeSpamUpdatePercent, m
   }
   If (ResyncSpam=0)
   {
      GuiControl, , ResyncSpamUpdate, N/A
      GuiControl, , ResyncSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , ResyncSpamUpdate, %ResyncSpam%
      GuiControl, , ResyncSpamUpdatePercent, s
   }
   If (RemainingSpam=0)
   {
      GuiControl, , RemainingSpamUpdate, N/A
      GuiControl, , RemainingSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , RemainingSpamUpdate, %RemainingSpam%
      GuiControl, , RemainingSpamUpdatePercent, s
   }

   Loop, 5
   {
		If ConfigChoice = %A_Index%
		{
			IniWrite, %minLifePercentToQuit% , Config.ini, Config%A_Index%, minLifePercentToQuit
			IniWrite, %minESPercentToQuit% , Config.ini, Config%A_Index%, minESPercentToQuit
			IniWrite, %maxLifePercentPerHitToQuit% , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit
			IniWrite, %maxESPercentPerHitToQuit% , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit
			IniWrite, %minLifePercentToJade% , Config.ini, Config%A_Index%, minLifePercentToJade
			IniWrite, %minESPercentToJade% , Config.ini, Config%A_Index%, minESPercentToJade
			IniWrite, %minLifePercentToElementalResist% , Config.ini, Config%A_Index%, minLifePercentToElementalResist
			IniWrite, %minESPercentToElementalResist% , Config.ini, Config%A_Index%, minESPercentToElementalResist
			IniWrite, %minLifePercentToDrink% , Config.ini, Config%A_Index%, minLifePercentToDrink
			IniWrite, %minManaPercentToDrink% , Config.ini, Config%A_Index%, minManaPercentToDrink
			IniWrite, %minManaToDrinkPot% , Config.ini, Config%A_Index%, minManaToDrinkPot
			IniWrite, %minLifePercentToSpam% , Config.ini, Config%A_Index%, minLifePercentToSpam
			IniWrite, %InstantFlaskDelay% , Config.ini, Config%A_Index%, InstantFlaskDelay
			IniWrite, %QuickSilverMovementTimer% , Config.ini, Config%A_Index%, QuickSilverMovementTimer
			IniWrite, %RemoveAilmentsTimer% , Config.ini, Config%A_Index%, RemoveAilmentsTimer
			IniWrite, %ResyncSpam% , Config.ini, Config%A_Index%, ResyncSpam
         IniWrite, %RemainingSpam% , Config.ini, Config%A_Index%, RemainingSpam
         IniWrite, %RemoveCorruptedBloodCharges% , Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges
		}
   }

   
   IniWrite, %InstantFlaskDelay% , Config.ini, Config, InstantFlaskDelay
   IfDelay:= InstantFlaskDelay

   PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IflaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxEShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minEShieldRatioToQuit: minESPercentToQuit/100, minEShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minEShieldRatioToPopJade: minESPercentToJade/100}


return

ExitSub:
If A_ExitReason not in Logoff,Shutdown  ; Avoid spaces around the comma in this line.
{
    IniWrite, %TabChoice%, Config.ini, Config, LastTab
}
ExitApp

TabFunc:
Gui, Submit, NoHide
return

Default:
   Gui, Submit, NoHide

    Loop, 5
    {
	   If ConfigChoice = %A_Index%
	   {
	   	  IniDelete, Config.ini, Config%A_Index%
	   }
	}
   
   Reload
   Sleep, 2000
   MsgBox,0,, An error ocurred, reloading script.
ExitApp

DefaultHotkeys:
   Gui, Submit, NoHide

   IniDelete, Config.ini, Hotkeys


   Reload
   Sleep, 2000
   MsgBox,0,, An error ocurred, reloading script.
ExitApp


AutoQuitList:
   Gui, Submit, NoHide
   If AutoQuitChoice = 1
   autoQuitMode:=1
   If AutoQuitChoice = 2
   autoQuitMode:=0
   If AutoQuitChoice = 3
   autoQuitMode:=3
   If AutoQuitChoice = 4
   autoQuitMode:=4
   
   IniWrite, %AutoQuitChoice% , Config.ini, Config, AutoQuitMethod
return

ClientServerList:
   Gui, Submit, NoHide
   If ClientServerChoice = 1
   ClientServerMode:=1
   If ClientServerChoice = 2
   ClientServerMode:=2
   If ClientServerChoice = 3
   ClientServerMode:=3
   If ClientServerChoice = 4
   ClientServerMode:=4
   
   IniWrite, %ClientServerChoice% , Config.ini, Config, ClientServer
reload

ConfigList:
   Gui, Submit, NoHide


   Loop, 5
   {
		If ConfigChoice = %A_Index%
		{
			IniRead, minLifePercentToQuit , Config.ini, Config%A_Index%, minLifePercentToQuit, 35
			IniRead, minESPercentToQuit , Config.ini, Config%A_Index%, minESPercentToQuit, 0
			IniRead, maxLifePercentPerHitToQuit , Config.ini, Config%A_Index%, maxLifePercentPerHitToQuit, 50
			IniRead, maxESPercentPerHitToQuit , Config.ini, Config%A_Index%, maxESPercentPerHitToQuit, 0
			IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
			IniRead, minLifePercentToJade , Config.ini, Config%A_Index%, minLifePercentToJade, 70
			IniRead, minESPercentToJade , Config.ini, Config%A_Index%, minESPercentToJade, 0
			IniRead, minLifePercentToElementalResist , Config.ini, Config%A_Index%, minLifePercentToElementalResist, 70
			IniRead, minESPercentToElementalResist , Config.ini, Config%A_Index%, minESPercentToElementalResist, 0
			IniRead, minLifePercentToDrink , Config.ini, Config%A_Index%, minLifePercentToDrink, 55
			IniRead, minManaPercentToDrink , Config.ini, Config%A_Index%, minManaPercentToDrink, 25
			IniRead, minManaToDrinkPot , Config.ini, Config%A_Index%, minManaToDrinkPot, 15
			IniRead, minLifePercentToSpam, Config.ini, Config%A_Index%, minLifePercentToSpam, 35
			IniRead, ResyncSpam, Config.ini, Config%A_Index%, ResyncSpam, 0
         IniRead, RemainingSpam, Config.ini, Config%A_Index%, RemainingSpam, 0
			IniRead, InstantFlaskDelay, Config.ini, Config%A_Index%, InstantFlaskDelay, 0
			IniRead, QuickSilverMovementTimer , Config.ini, Config%A_Index%, QuickSilverMovementTimer, 15
         IniRead, RemoveAilmentsTimer , Config.ini, Config%A_Index%, RemoveAilmentsTimer, 10
         IniRead, RemoveCorruptedBloodCharges, Config.ini, Config%A_Index%, RemoveCorruptedBloodCharges, 10
			IniWrite, %A_Index%, Config.ini, Config, ConfigNumber
		}
	}


   GuiControl, , minLifePercentToQuit, %minLifePercentToQuit%
   GuiControl, , maxLifePercentPerHitToQuit, %maxLifePercentPerHitToQuit%
   GuiControl, , maxESPercentPerHitToQuit, %maxESPercentPerHitToQuit%
   GuiControl, , minESPercentToQuit, %minESPercentToQuit%
   GuiControl, , minLifePercentToJade, %minLifePercentToJade%
   GuiControl, , minESPercentToJade, %minESPercentToJade%
   GuiControl, , minLifePercentToElementalResist, %minLifePercentToElementalResist%
   GuiControl, , minESPercentToElementalResist, %minESPercentToElementalResist%
   GuiControl, , minLifePercentToDrink, %minLifePercentToDrink%
   GuiControl, , minManaPercentToDrink, %minManaPercentToDrink%
   GuiControl, , minManaToDrinkPot, %minManaToDrinkPot%
   GuiControl, , minLifePercentToSpam, %minLifePercentToSpam%
   GuiControl, , ResyncSpam, %ResyncSpam%
   GuiControl, , RemainingSpam, %RemainingSpam%
   GuiControl, , InstantFlaskDelay, %InstantFlaskDelay%
   GuiControl, , QuickSilverMovementTimer, %QuickSilverMovementTimer%
   GuiControl, , RemoveAilmentsTimer, %RemoveAilmentsTimer%
   GuiControl, , RemoveCorruptedBloodCharges, %RemoveCorruptedBloodCharges%


   GuiControl, , QuickSilverMovementTimerUpdate, % Round(QuickSilverMovementTimer/10,1)
   GuiControl, , RemoveAilmentsTimerUpdate, % Round(RemoveAilmentsTimer/10,1)
   GuiControl, , RemoveCorruptedBloodChargesUpdate, %RemoveCorruptedBloodCharges%

   If (minLifePercentToQuit=0)
   {
      GuiControl, , minLifePercentToQuitUpdate, N/A
      GuiControl, , minLifePercentToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , minLifePercentToQuitUpdate, %minLifePercentToQuit%
      GuiControl, , minLifePercentToQuitUpdatePercent, `%
   }
   If (minESPercentToQuit=0)
   {
      GuiControl, , minESPercentToQuitUpdate, N/A
      GuiControl, , minESPercentToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToQuitUpdate, %minESPercentToQuit%
      GuiControl, , minESPercentToQuitUpdatePercent, `%
   }
   If (maxLifePercentPerHitToQuit=0 || maxLifePercentPerHitToQuit=100)
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, N/A
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, 
   }
   Else
   {
      GuiControl, , maxLifePercentPerHitToQuitUpdate, %maxLifePercentPerHitToQuit%
      GuiControl, , maxLifePercentPerHitToQuitUpdatePercent, `%
   }
   If (maxESPercentPerHitToQuit=0)
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, N/A
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent,
   }
   Else
   {
      GuiControl, , maxESPercentPerHitToQuitUpdate, %maxESPercentPerHitToQuit%
      GuiControl, , maxESPercentPerHitToQuitUpdatePercent, `%
   }
   If (minLifePercentToJade=0)
   {
      GuiControl, , minLifePercentToJadeUpdate, N/A
      GuiControl, , minLifePercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToJadeUpdate, %minLifePercentToJade%
      GuiControl, , minLifePercentToJadeUpdatePercent, `% 
   }
   If (minESPercentToJade=0)
   {
      GuiControl, , minESPercentToJadeUpdate, N/A
      GuiControl, , minESPercentToJadeUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToJadeUpdate, %minESPercentToJade%
      GuiControl, , minESPercentToJadeUpdatePercent, `%
   }
   If (minLifePercentToElementalResist=0)
   {
      GuiControl, , minLifePercentToElementalResistUpdate, N/A
      GuiControl, , minLifePercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToElementalResistUpdate, %minLifePercentToElementalResist%
      GuiControl, , minLifePercentToElementalResistUpdatePercent, `%
   }
   If (minESPercentToElementalResist=0)
   {
      GuiControl, , minESPercentToElementalResistUpdate, N/A
      GuiControl, , minESPercentToElementalResistUpdatePercent, 
   }
   Else
   {
      GuiControl, , minESPercentToElementalResistUpdate, %minESPercentToElementalResist%
      GuiControl, , minESPercentToElementalResistUpdatePercent, `%
   }
   If (minLifePercentToDrink=0)
   {
      GuiControl, , minLifePercentToDrinkUpdate, N/A
      GuiControl, , minLifePercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToDrinkUpdate, %minLifePercentToDrink%
      GuiControl, , minLifePercentToDrinkUpdatePercent, `%
   }
   If (minManaPercentToDrink=0)
   {
      GuiControl, , minManaPercentToDrinkUpdate, N/A
      GuiControl, , minManaPercentToDrinkUpdatePercent, 
   }
   Else
   {
      GuiControl, , minManaPercentToDrinkUpdate, %minManaPercentToDrink%
      GuiControl, , minManaPercentToDrinkUpdatePercent, `%
   }
   If (minManaToDrinkPot=0)
   {
      GuiControl, , minManaToDrinkPotUpdate, N/A
   }
   Else
   {
      GuiControl, , minManaToDrinkPotUpdate, %minManaToDrinkPot%
   }
   If (InstantFlaskDelay=0)
   {
      GuiControl, , InstantFlaskDelayUpdate, N/A
      GuiControl, , InstantFlaskDelayUpdatePercent, 
   }
   Else
   {
      GuiControl, , InstantFlaskDelayUpdate,  % Round(InstantFlaskDelay/100,2)
      GuiControl, , InstantFlaskDelayUpdatePercent, s

   }
   If (minLifePercentToSpam=0)
   {
      GuiControl, , minLifePercentToSpamUpdate, N/A
      GuiControl, , minLifePercentToSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , minLifePercentToSpamUpdate, %minLifePercentToSpam%
      GuiControl, , minLifePercentToSpamUpdatePercent, `%
   }
   If (TradeSpam=0)
   {
      GuiControl, , TradeSpamUpdate, N/A
      GuiControl, , TradeSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , TradeSpamUpdate, %TradeSpam%
      GuiControl, , TradeSpamUpdatePercent, m
   }
   If (ResyncSpam=0)
   {
      GuiControl, , ResyncSpamUpdate, N/A
      GuiControl, , ResyncSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , ResyncSpamUpdate, %ResyncSpam%
      GuiControl, , ResyncSpamUpdatePercent, s
   }
   If (RemainingSpam=0)
   {
      GuiControl, , RemainingSpamUpdate, N/A
      GuiControl, , RemainingSpamUpdatePercent, 
   }
   Else
   {
      GuiControl, , RemainingSpamUpdate, %RemainingSpam%
      GuiControl, , RemainingSpamUpdatePercent, s
   }

   PlayerConfig["Default"]:={RemCorruptedBloodCharges:RemoveCorruptedBloodCharges,RemAilmentsTimer:RemoveAilmentsTimer,QuickSilverTimer:QuickSilverMovementTimer*100, minLifeRatioToInstant: minLifePercentToSpam/100, IflaskDelay: InstantFlaskDelay,minLifeRatioToDrink: minLifePercentToDrink/100, minManaRatioToDrink: minManaPercentToDrink/100, minManaToDrink: minManaToDrinkPot, minLifeRatioToPopElementalResist: minLifePercentToElementalResist/100,minLifeRatioToPopJade: minLifePercentToJade/100, minLifeRatioToQuit: minLifePercentToQuit/100,maxLifeRatioPerHitToQuit: maxLifePercentPerHitToQuit/100,maxEShieldRatioPerHitToQuit: maxESPercentPerHitToQuit/100,minEShieldRatioToQuit: minESPercentToQuit/100, minEShieldRatioToPopElementalResist: minESPercentToElementalResist/100, minEShieldRatioToPopJade: minESPercentToJade/100}
   
return

TrayNotIficationsCheck:
   Gui, Submit, NoHide
   If TrayCheckBox = 0
   {
      TrayNotIficationsCheck = 0
      trayNotIfications:=true
   }
   If TrayCheckBox = 1
   {
      TrayNotIficationsCheck = 1
      trayNotIfications:=false
   }
   IniWrite, %TrayNotIficationsCheck% , Config.ini, Config, TrayNotIficationsCheck
return   

QuickSilverCheck:
   Gui, Submit, NoHide
   If QuickSilverCheckBox = 0
   {
      QuickSilverCheck = 0
      IniWrite, 0 , Config.ini, Config, QuickSilverCheck
   }
   If QuickSilverCheckBox = 1
   {
      QuickSilverCheck = 1
      IniWrite, 1 , Config.ini, Config, QuickSilverCheck
   }
   IniWrite, %QuickSilverCheck% , Config.ini, Config, QuickSilverCheck
return 

QuickSilverCheck2:
   Gui, Submit, NoHide
   If QuickSilverCheckBox2 = 0
   {
      QuickSilverCheck2 = 0
      IniWrite, 0 , Config.ini, Config, QuickSilverCheck2
   }
   If QuickSilverCheckBox2 = 1
   {
      QuickSilverCheck2 = 1
      IniWrite, 1 , Config.ini, Config, QuickSilverCheck2
   }
   IniWrite, %QuickSilverCheck2% , Config.ini, Config, QuickSilverCheck2
return 

FlaskOnFrozenCheck:
   Gui, Submit, NoHide
   If FlaskOnFrozenCheckBox = 0
   {
      FlaskOnFrozenCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnFrozenCheck
   }
   If FlaskOnFrozenCheckBox = 1
   {
      FlaskOnFrozenCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnFrozenCheck
   }
   IniWrite, %FlaskOnFrozenCheck% , Config.ini, Config, FlaskOnFrozenCheck
return 

FlaskOnShockedCheck:
   Gui, Submit, NoHide
   If FlaskOnShockedCheckBox = 0
   {
      FlaskOnShockedCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnShockedCheck
   }
   If FlaskOnShockedCheckBox = 1
   {
      FlaskOnShockedCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnShockedCheck
   }
   IniWrite, %FlaskOnShockedCheck% , Config.ini, Config, FlaskOnShockedCheck
return 

FlaskOnIgnitedCheck:
   Gui, Submit, NoHide
   If FlaskOnIgnitedCheckBox = 0
   {
      FlaskOnIgnitedCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnIgnitedCheck
   }
   If FlaskOnIgnitedCheckBox = 1
   {
      FlaskOnIgnitedCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnIgnitedCheck
   }
   IniWrite, %FlaskOnIgnitedCheck% , Config.ini, Config, FlaskOnIgnitedCheck
return 

FlaskOnCurseCheck:
   Gui, Submit, NoHide
   If FlaskOnCurseCheckBox = 0
   {
      FlaskOnCurseCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnCurseCheck
   }
   If FlaskOnCurseCheckBox = 1
   {
      FlaskOnCurseCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnCurseCheck
   }
   IniWrite, %FlaskOnCurseCheck% , Config.ini, Config, FlaskOnCurseCheck
return 

FlaskOnCorruptedBloodCheck:
   Gui, Submit, NoHide
   If FlaskOnCorruptedBloodCheckBox = 0
   {
      FlaskOnCorruptedBloodCheck = 0
      IniWrite, 0 , Config.ini, Config, FlaskOnCorruptedBloodCheck
   }
   If FlaskOnCorruptedBloodCheckBox = 1
   {
      FlaskOnCorruptedBloodCheck = 1
      IniWrite, 1 , Config.ini, Config, FlaskOnCorruptedBloodCheck
   }
   IniWrite, %FlaskOnCorruptedBloodCheck% , Config.ini, Config, FlaskOnCorruptedBloodCheck
return 

AttackInPlaceCheck:
   Gui, Submit, NoHide
   If AttackInPlaceCheckBox = 0
   {
      AttackInPlaceCheck = 0
      IniWrite, 0 , Config.ini, Config, AttackInPlaceCheck
   }
   If AttackInPlaceCheckBox = 1
   {
      AttackInPlaceCheck = 1
      IniWrite, 1 , Config.ini, Config, AttackInPlaceCheck
   }
   IniWrite, %AttackInPlaceCheck% , Config.ini, Config, AttackInPlaceCheck
return

HoldCtrlCheck:
   Gui, Submit, NoHide
   If HoldCtrlCheckBox = 0
   {
      HoldCtrlCheck = 0
      IniWrite, 0 , Config.ini, Config, HoldCtrlCheck
   }
   If HoldCtrlCheckBox = 1
   {
      HoldCtrlCheck = 1
      IniWrite, 1 , Config.ini, Config, HoldCtrlCheck
   }
   IniWrite, %HoldCtrlCheck% , Config.ini, Config, HoldCtrlCheck
return


DPSCheck:
   Gui, Submit, NoHide
   If DPSCheckBox = 0
   {
      IniWrite, 0 , Config.ini, Config, DPSCheck
   }
   If DPSCheckBox = 1
   {
      IniWrite, 1 , Config.ini, Config, DPSCheck
   }
Return

showgui:
   Gui, Show, x760 y198 h665 w474
Return

showgui2:
   
   Gui, 2:Show,,Hotkeys

   ; Set GUI State
   LoadSettings()

   ; Enable defined hotkeys
   EnableHotkeys()
Return

showgui4:
   
   Gui, 4:Show,,Debug Window

Return

DisableSlot:
   Gui, Submit, NoHide
   Loop, 5
   {
		If DisableSlot%A_Index% = 0
		{
			IniWrite, 0 , Config.ini, DisableSlot, DisableSlot%A_Index%
		}
		Else If DisableSlot%A_Index% = 1
		{
			IniWrite, 1 , Config.ini, DisableSlot, DisableSlot%A_Index%
		}
   }
return

ReadMe:
   MsgBox, ------------------------------HOTKEYS------------------------------`n`n[F1] --- Use Resync Command`n[F2] --- Use Remaining Command`n[F3] --- Over an Item for DPSCalc`n[Ctrl+F3] --- Over an Item for More info on the Internet`n[F4] --- Test Exit to Log In Screen`n[Ctrl+F4] -- Test Use Portal`n[F10] -- Send Last Chat Message to Trade Channels 1-10`n[Alt + W] - Change Window to Bordeless, and locks mouse on window.`n[MIDDLE MOUSE] - Send Hideout command.`n`n------------------------------CREDITS------------------------------`n`n Base Script Created by Wrongusername.`n`n GUI and Improvements by Gurud.`n`n DPSCalc By Nipper`n`n----------------------------MORE INFO----------------------------`n`nFor more Info and Updates Go to:`n`n http://www.ownedcore.com/forums`n/mmo/path-of-exile/poe-bots-programs`n/451206-poe-autoflask-autoscript-improvements-updates.html`n`nThe link has been coppied to the clipboard.
   clipboard = http://www.ownedcore.com/forums/mmo/path-of-exile/poe-bots-programs/451206-poe-autoflask-autoscript-improvements-updates.html
return

Donate:
   Run "https://donate.doctorswithoutborders.org/onetime.cfm"
return

GuiClose:
   Gui, Submit
   If (trayNotIfications)
   {
      TrayTip, Script is Still Running in the Background, %A_Space% , 2
   }
return



;-------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS--------------GUI UPDATE FUNCTIONS-----

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------
; Test that bound hotkeys work
;These labels may contain any commands for their respective hotkeys to perform.
DoHotkey1:
   desync:=1
return

DoHotkey2:
   remaining:=1
return

DoHotkey3:
   DPSCalc()
return

DoHotkey4:
   Webgrab()
return

DoHotkey5:

			If (autoQuitMode=0)
			{
				 QuitToLoginScreen(WinActive("A"))
			}
			Else If (autoQuitMode=1)
			{
				run, cports.exe /close * * * * PathofExile.exe
			}
			Else If (autoQuitMode=3)
			{
            WinActivate Path of Exile ahk_class POEWindowClass
				IfWinActive Path of Exile ahk_class POEWindowClass
            {
               SendInput {ALT Down}
               SendInput {F4}
               SendInput {ALT Up}
            }
			}
			Else If (autoQuitMode=4)
			{
               run, cports.exe /close * * * * PathofExile.exe
			}
return

DoHotkey6:
   UsePortal()
return

DoHotkey7:
   tradechat:=1
return

DoHotkey8:
   WinGet, window, ID, A   ; Use the ID of the active window.
   Toggle_Window(window)
return

DoHotkey9:
   hideout:=1
return

;-------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS-----------------HOTKEYS--------------

; Something changed - rebuild
OptionChanged:
   OptionChanged()
   return

OptionChanged()
{
   global HotkeyList

   Gui, 2:Submit, NoHide
   ; Disable Hotkeys
   DisableHotkeys()

   Loop % HotkeyList.MaxIndex(){
      ;HotkeyList[A_Index].block := Block%A_Index%
      HotkeyList[A_Index].wild := Wild%A_Index%
   }

   EnableHotkeys()

   SaveSettings()
}

; Detects a pressed key combination
Bind:
   Gui, 2:Submit, NoHide
   Bind(substr(A_GuiControl,5))
   return

Bind(ctrlnum)
{
   global HKModIfierState
   global BindMode
   global EXTRA_KEY_LIST
   global HKControlType
   global HKSecondaryInput
   global HKLastHotkey

   global HotkeyList

   ; init vars
   HKControlType := 0
   HKModIfierState := {ctrl: 0, alt: 0, shIft: 0, win: 0}

   ; Disable existing hotkeys
   DisableHotkeys()

   ; Enable Joystick detection hotkeys
   JoystickDetection(1)

   ; Start Bind Mode - this starts detection for mouse buttons and modIfier keys
   BindMode := 1

   ; Show the prompt
   prompt := "Please press the desired key combination.`n`n"
   prompt .= "Supports most keyboard keys and all mouse buttons. Also Ctrl, Alt, ShIft, Win as modIfiers or individual keys.`n"
   prompt .= "Joystick buttons are also supported, but currently not with modIfiers.`n"
   prompt .= "`nHit Escape to cancel."
   prompt .= "`nHold Escape to clear a binding."
   Gui, 3:Add, text, center, %prompt%
   Gui, 3:-Border +AlwaysOnTop
   Gui, 3:Show

   outhk := ""

   Input, detectedkey, L1 M, %EXTRA_KEY_LIST%

   If (substr(ErrorLevel,1,7) == "EndKey:"){
      ; A "Special" (Non-printable) key was pressed
      tmp := substr(ErrorLevel,8)
      detectedkey := tmp
      If (tmp == "Escape"){
         ; Detection ended by Escape
         If (HKControlType > 0){
            ; The Escape key was sent because a special button was used
            detectedkey := HKSecondaryInput
         } Else {
            detectedkey := ""
            ; Start listening to key up event for Escape, to see If it was held
            HKLastHotkey := ctrlnum
            hotkey, Escape up, EscapeReleased, ON
            SetTimer, DeleteHotkey, 1000
         }
      }
   }

   ; Stop listening to mouse, keyboard etc
   BindMode := 0
   JoystickDetection(0)

   ; Hide prompt
   Gui, 3:Submit


   ; Process results

   modct := CurrentModIfierCount()

   If (detectedkey && modct && HKControlType == 3){
      msgbox ,,Error, ModIfiers (Ctrl, Alt, ShIft, Win) are currently not supported with Joystick buttons.
      detectedkey := ""
   }

   If (detectedkey)
   {
      ; Update the hotkey object
      outhk := BuildHotkeyString(detectedkey,HKControlType)
      tmp := {hk: outhk, type: HKControlType, status: 0}

      clash := 0
      Loop % HotkeyList.MaxIndex(){
         If (A_Index == ctrlnum)
         {
            continue
         }
         If (StripPrefix(HotkeyList[A_Index].hk) == StripPrefix(tmp.hk))
         {
            clash := 1
         }
      }
      If (clash)
      {
         msgbox You cannot bind the same hotkey to two dIfferent actions. Aborting...
      } 
      Else 
      {
         HotkeyList[ctrlnum] := tmp
      }

      ; Rebuild rest of hotkey object, save settings etc
      OptionChanged()
      ; Write settings to INI file
      ;SaveSettings()

      ; Update the GUI control
      UpdateHotkeyControls()

      ; Enable the hotkeys
      ;EnableHotkeys()
   } 
   Else 
   {
      ; Escape was pressed - resotre original hotkey, If any
      EnableHotkeys()
   }
   return
}

DeleteHotkey:
   SetTimer, DeleteHotkey, Off
   DeleteHotKey(HKLastHotkey)
return

DeleteHotkey(hk)
{
   global HotkeyList
   global DefaultHKObject

   soundbeep
   DisableHotkeys()
   HotkeyList[hk] := DefaultHKObject

   OptionChanged()

   UpdateHotkeyControls()
   return
}

EscapeReleased:
   hotkey, Escape up, EscapeReleased, OFF
   SetTimer, DeleteHotkey, Off
return

; Enables User-Defined Hotkeys
EnableHotkeys()
{
   global HotkeyList
   Loop % HotkeyList.MaxIndex()
   {
      status := HotkeyList[A_Index].status
      hk := HotkeyList[A_Index].hk
      If (hk != "" && status == 0){
         prefix := BuildPrefix(HotkeyList[A_Index])
         ;Msgbox % "ADDING: " prefix "," hk
         hotkey, %prefix%%hk%, DoHotkey%A_Index%, ON
         HotkeyList[A_Index].status := 1
      }
   }
}

; Disables User-Defined Hotkeys
DisableHotkeys()
{
   global HotkeyList

   Loop % HotkeyList.MaxIndex(){
      status := HotkeyList[A_Index].status
      hk := HotkeyList[A_Index].hk
      If (hk != "" && status == 1){
         prefix := BuildPrefix(HotkeyList[A_Index])
         ;Msgbox % "REMOVING: " prefix "," hk
         hotkey, %prefix%%hk%, DoHotkey%A_Index%, OFF
         ;hotkey, %hk%, DoHotkey%A_Index%, OFF
         HotkeyList[A_Index].status := 0
      }
   }
}

; Builds the prefix for a given hotkey object
BuildPrefix(hk)
{
   prefix := "~"
   ;If (!hk.block){
   ;  prefix .= "~"
   ;}
   If (hk.wild){
      prefix .= "*"
   }
   return prefix
}

; Removes ~ * etc prefixes (But NOT modIfiers!) from a hotkey object for comparison
StripPrefix(hk)
{
   Loop {
      chr := substr(hk,1,1)
      If (chr == "~" || chr == "*" || chr == "$"){
         hk := substr(hk,2)
      } Else {
         break
      }
   }
   return hk
}

; Write settings to the INI
SaveSettings()
{
   global ININame
   global NumHotkeys
   global HotkeyList

   Loop % HotkeyList.MaxIndex(){
      hk := HotkeyList[A_Index].hk
      type := HotkeyList[A_Index].type
      ;block := HotkeyList[A_Index].block
      wild := HotkeyList[A_Index].wild

      ;If (hk != ""){
         iniwrite, %hk%, %ININame%, Hotkeys, hk_%A_Index%_hk
         iniwrite, %type%, %ININame%, Hotkeys, hk_%A_Index%_type
         ;iniwrite, %block%, %ININame%, Hotkeys, hk_%A_Index%_block
         iniwrite, %wild%, %ININame%, Hotkeys, hk_%A_Index%_wild
      ;}
   }
   return
}


; Read settings from the INI
LoadSettings()
{
   global ININame
   global NumHotkeys
   global HotkeyList
   global DefaultHKObject

   Loop % NumHotkeys 
   {
      ; Init array so all items exist
      HotkeyList[A_Index] := DefaultHKObject

      IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type,
      
      If A_index=1
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F1
      }
      If A_index=2
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F2
      }
      If A_index=3
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F3
      }
      If A_index=4
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,^F3
      }
      If A_index=5
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F4
      }
      If A_index=6
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,^F4
      }
      If A_index=7
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,F10
      }
      If A_index=8
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,!W
      }
      If A_index=9
      {
         IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,mbutton
      }
      
      ;IniRead, val, %ININame% , Hotkeys, hk_%A_Index%_hk,
      
      If (val != "ERROR")
      {
         If A_index=9
         {
            IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type,2
         }
         Else
         {
            IniRead, type, %ININame% , Hotkeys, hk_%A_Index%_type, 0
         }
         ;IniRead, block, %ININame% , Hotkeys, hk_%A_Index%_block, 0
         IniRead, wild, %ININame% , Hotkeys, hk_%A_Index%_wild, 0

         HotkeyList[A_Index] := {hk: val, type: type, wild: wild, status: 0}
      }
   }
   UpdateHotkeyControls()
   Gui, 2:Submit, NoHide
}

; Update the GUI controls with the hotkey names
UpdateHotkeyControls()
{
   global HotkeyList

   Loop % HotkeyList.MaxIndex()
   {
      If (HotkeyList[A_Index].hk != "")
      {
         tmp := BuildHotkeyName(HotkeyList[A_Index].hk,HotkeyList[A_Index].type)
         GuiControl, 2:, HotkeyName%A_Index%, %tmp%
      } 
      Else 
      {
         GuiControl, 2:, HotkeyName%A_Index%, None
      }
      ;tmp := HotkeyList[A_Index].block
      ;GuiControl,, Block%A_Index%, %tmp%

      tmp := HotkeyList[A_Index].wild
      GuiControl, 2:, Wild%A_Index%, %tmp%
   }
   Gui, 2:Submit, NoHide
}

; Builds an AHK String (eg "^c" for CTRL + C) from the last detected hotkey
BuildHotkeyString(str, type := 0)
{
   global HKModIfierState

   outhk := ""
   modct := CurrentModIfierCount()

   If (type == 1){
      ; Solitary modIfier key used (eg Left / Right Alt)
      outhk := str
   } Else {
      If (modct){
         ; ModIfiers used in combination with something Else - List modIfiers in a specIfic order
         modIfiers := ["CTRL","ALT","SHIfT","WIN"]

         Loop, 4 {
            key := modIfiers[A_Index]
            value := HKModIfierState[modIfiers[A_Index]]
            If (value){
               If (key == "CTRL"){
                  outhk .= "^"
               } Else If (key == "ALT"){
                  outhk .= "!"
               } Else If (key == "SHIfT"){
                  outhk .= "+"
               } Else If (key == "WIN"){
                  outhk .= "#"
               }
            }
         }
      }
      ; ModIfiers etc processed, complete the string
      outhk .= str
   }

   return outhk
}

; Builds a Human-Readable form of a Hotkey string (eg "^C" -> "CTRL + C")
BuildHotkeyName(hk,ctrltype)
{
   outstr := ""
   modctr := 0
   stringupper, hk, hk

   Loop % strlen(hk) {
      chr := substr(hk,1,1)
      mod := 0

      If (chr == "^"){
         ; Ctrl
         mod := "CTRL"
         modctr++
      } Else If (chr == "!"){
         ; Alt
         mod := "ALT"
         modctr++
      } Else If (chr == "+"){
         ; ShIft
         mod := "SHIfT"
         modctr++
      } Else If (chr == "#"){
         ; Win
         mod := "WIN"
         modctr++
      } Else {
         break
      }
      If (mod){
         If (modctr > 1){
            outstr .= " + "
         }
         outstr .= mod
         ; shIft character out
         hk := substr(hk,2)
      }
   }
   If (modctr){
      outstr .= " + "
   }

   If (ctrltype == 1){
      ; Solitary ModIfiers
      pfx := substr(hk,1,1)
      If (pfx == "L"){
         outstr .= "LEFT "
      } Else {
         outstr .= "RIGHT "
      }
      outstr .= substr(hk,2)
   } Else If (ctrltype == 2){
      ; Mouse Buttons
      If (hk == "LBUTTON") {
         outstr .= "LEFT MOUSE"
      } Else If (hk == "RBUTTON") {
         outstr .= "RIGHT MOUSE"
      } Else If (hk == "MBUTTON") {
         outstr .= "MIDDLE MOUSE"
      } Else If (hk == "XBUTTON1") {
         outstr .= "MOUSE THUMB 1"
      } Else If (hk == "XBUTTON2") {
         outstr .= "MOUSE THUMB 2"
      } Else If (hk == "WHEELUP") {
         outstr .= "MOUSE WHEEL U"
      } Else If (hk == "WHEELDOWN") {
         outstr .= "MOUSE WHEEL D"
      } Else If (hk == "WHEELLEFT") {
         outstr .= "MOUSE WHEEL L"
      } Else If (hk == "WHEELRIGHT") {
         outstr .= "MOUSE WHEEL R"
      }
   } Else If (ctrltype == 3){
      ; Joystick Buttons
      pos := instr(hk,"JOY")
      id := substr(hk,1,pos-1)
      button := substr(hk,5)
      outstr .= "JOYSTICK " id " BTN " button
   } Else {
      ; Keyboard Keys
      tmp := instr(hk,"NUMPAD")
      If (tmp){
         outstr .= "NUMPAD " substr(hk,7)
      } Else {
         ; Replace underscores with spaces (In case of key name like MEDIA_PLAY_PAUSE)
         StringReplace, hk, hk, _ , %A_SPACE%, All
         outstr .= hk
      }
   }


   return outstr
}

; Detects ModIfiers and Mouse Buttons in BindMode
#If BindMode
   ; Detect key down of modIfier keys
   *lctrl::
   *rctrl::
   *lalt::
   *ralt::
   *lshIft::
   *rshIft::
   *lwin::
   *rwin::
      mod := substr(A_ThisHotkey,2)
      SetModIfier(mod,1)
      return

   ; Detect key up of modIfier keys
   *lctrl up::
   *rctrl up::
   *lalt up::
   *ralt up::
   *lshIft up::
   *rshIft up::
   *lwin up::
   *rwin up::
      ; Strip * from beginning, " up" from end etc
      mod := substr(substr(A_ThisHotkey,2),1,strlen(A_ThisHotkey) -4)
      If (CurrentModIfierCount() == 1){
         ; If CurrentModIfierCount is 1 when an up is received, then that is a Solitary ModIfier
         ; It cannot be a modIfier + normal key, as this code would have quit on keydown of normal key

         HKControlType := 1
         HKSecondaryInput := mod

         ; Send Escape - This will cause the Input command to quit with an EndKey of Escape
         ; But we stored the modIfier key, so we will know it was not really escape
         Send {Escape}
      }
      SetModIfier(mod,0)
      return

   ; Detect Mouse buttons
   lbutton::
   rbutton::
   mbutton::
   xbutton1::
   xbutton2::
   wheelup::
   wheeldown::
   wheelleft::
   wheelright::
      HKControlType := 2
      HKSecondaryInput := A_ThisHotkey
      Send {Escape}
      return
#If

; Adds / removes hotkeys to detect Joystick Buttons in BindMode
JoystickDetection(mode := 1)
{
   If (mode){
      mode := "ON"
   } Else {
      mode := "OFF"
   }
   Loop , 16 {
      stickid := A_Index
      Loop, 32 {
         buttonid := A_Index
         hotkey, %stickid%Joy%buttonid%, JoystickPressed, %mode%
      }
   }
}

; A Joystick button was pressed while in Binding mode
JoystickPressed:
   HKControlType := 3
   HKSecondaryInput := A_ThisHotkey
   Send {Escape}
   return

; Sets the state of the HKModIfierState object to reflect the state of the modIfier keys
SetModIfier(hk,state)
{
   global HKModIfierState

   If (hk == "lctrl" || hk == "rctrl"){
      HKModIfierState.ctrl := state
   } Else If (hk == "lalt" || hk == "ralt"){
      HKModIfierState.alt := state
   } Else If (hk == "lshIft" || hk == "rshIft"){
      HKModIfierState.shIft := state
   } Else If (hk == "lwin" || hk == "rwin"){
      HKModIfierState.win := state
   }
   return
}

; Counts how many modIfier keys are currently held
CurrentModIfierCount()
{
   global HKModIfierState

   return HKModIfierState.ctrl + HKModIfierState.alt + HKModIfierState.shIft  + HKModIfierState.win
}

; Takes the start of the file name (before .ini or .exe and replaces it with .ini)
BuildIniName()
{
   tmp := A_Scriptname
   Stringsplit, tmp, tmp,.
   ini_name := ""
   last := ""
   Loop, % tmp0
   {
      ; build the string up to the last period (.)
      If (last != ""){
         If (ini_name != ""){
            ini_name := ini_name "."
         }
         ini_name := ini_name last
      }
      last := tmp%A_Index%
   }
   ;this.ini_name := ini_name ".ini"
   return ini_name ".ini"
}

;-------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS-----------------
 
; DPS Calculator Script
; This script can be found here:
; https://www.pathofexile.com/forum/view-thread/594346
; If you have any questions or comments please post them there as well. If you think you can help
; improve this project. I am looking for contributors. So Pm me If you think you can help.
;
;
; If you have a issue please post what version you are using.
; Reason being is that something that might be a issue might already be fixed.
; Version: 1.2d

;DPSCalc Credits:
;Nipper4369, creator of DPSCalc
;mcpower for the base iLVL display of the script 5months ago before Immo.
;Immo for the base iLVL display of the script.(Which was taken from mcpower.)
;olop4444 for helping Nipper4369 figure out the calculations for Q20 items.
;Aeons for a rewrite and fancy tooltips.
;kongyuyu for base item level display.
;Fayted for testing the script.
 
; Creates a font for later use
CreateFont()
{
   global FontSize
   Options :=
   If (!(FontSize = ""))
   {
      Options = s%FontSize%
   }
   Gui Font, %Options%, Courier New
   Gui Font, %Options%, Consolas
   Gui Add, Text, HwndHidden, 
   SendMessage, 0x31,,,, ahk_id %Hidden%
   return ErrorLevel
}
 
; Sets the font for a created ahk tooltip
SetFont(Font)
{
   SendMessage, 0x30, Font, 1,, ahk_class tooltips_class32 ahk_exe autohotkey.exe
}
 
; Parse elemental damage
ParseDamage(String, DmgType, ByRef DmgLo, ByRef DmgHi)
{
   IfInString, String, %DmgType% Damage
   {
      IfInString, String, Converted to or IfInString, String, taken as
       Return
      IfNotInString, String, increased
      {
         StringSplit, Arr, String, %A_Space%
         StringSplit, Arr, Arr2, -
         DmgLo := Arr1
         DmgHi := Arr2
      }
   }
}

; Parse clipboard content for item level and dps
DPSCalc()
{
   Global DPS
   If DPS
   return
   IfWinActive Path of Exile ahk_class POEWindowClass
   {
      SendMode Input
      clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
      ErrorLevel = 0
      Send ^c
      ClipWait, 0.05  ; Wait for the clipboard to contain text.
      If ErrorLevel = 1
      {
         return
      }
      NameIsDone := False
      ItemName := 
      ItemLevel := -1
      IsWeapon := False
      PhysLo := 0
      PhysHi := 0
      Quality := 0
      AttackSpeed := 0
      PhysMult := 0
      ChaoLo := 0
      ChaoHi := 0
      ColdLo := 0
      ColdHi := 0
      FireLo := 0
      FireHi := 0
      LighLo := 0
      LighHi := 0
 
      Loop, Parse, Clipboard, `n, `r
      {
         ; Clipboard must have "Rarity:" in the first line
         If A_Index = 1
         {
            IfNotInString, A_LoopField, Rarity:
            {
               Exit
            }
            Else
            {
               Continue
            }
         }
    
         ; Get name
         If Not NameIsDone
         {
            If A_LoopField = --------
            {
               NameIsDone := True
            }
            Else
            {
               ItemName := ItemName . A_LoopField . "`n" ; Add a line of name
            }
            Continue
         }
    
         ; Get item level
         IfInString, A_LoopField, Item level:
         {
            StringSplit, ItemLevelArray, A_LoopField, %A_Space%
            ItemLevel := ItemLevelArray3
            Continue
         }
    
         ; Get quality
         IfInString, A_LoopField, Quality:
         {
            StringSplit, Arr, A_LoopField, %A_Space%, +`%
            Quality := Arr2
            Continue
         }
    
         ; Get total physical damage
         IfInString, A_LoopField, Physical Damage:
         {
            IsWeapon = True
            StringSplit, Arr, A_LoopField, %A_Space%
            StringSplit, Arr, Arr3, -
            PhysLo := Arr1
            PhysHi := Arr2
            Continue
         }
         ;Fix for Elemental damage only weapons. Like the Oro's SacrIfice
         IfInString, A_LoopField, Elemental Damage:
         {
            IsWeapon = True
            Continue
         }
    
         ; These only make sense for weapons
         If IsWeapon 
         {
            ; Get attack speed
            IfInString, A_LoopField, Attacks per Second:
            {
               StringSplit, Arr, A_LoopField, %A_Space%
               AttackSpeed := Arr4
               Continue
            }
    
            ; Get percentage physical damage increase
            IfInString, A_LoopField, increased Physical Damage
            {
               StringSplit, Arr, A_LoopField, %A_Space%, `%
               PhysMult := Arr1
               Continue
            }
         
         ;Lines to skip fix for converted type damage. Like the Voltaxic RIft
         IfInString, A_LoopField, Converted to
          Goto, SkipDamageParse
         IfInString, A_LoopField, can Shock
          Goto, SkipDamageParse
         
            ; Parse elemental damage
            ParseDamage(A_LoopField, "Chaos", ChaoLo, ChaoHi)
            ParseDamage(A_LoopField, "Cold", ColdLo, ColdHi)
            ParseDamage(A_LoopField, "Fire", FireLo, FireHi)
            ParseDamage(A_LoopField, "Lightning", LighLo, LighHi)
            
           SkipDamageParse:
         }
      }
      If ItemLevel = -1 ; Something without an itemlevel
      {  
         Exit
      }
      ; Get position of mouse cursor
      global X
      global Y
      MouseGetPos, X, Y
    
      ; All items should show name and item level
      ; Pad to 3 places
      ItemLevel := "   " + ItemLevel
      StringRight, ItemLevel, ItemLevel, 3
      TT = %ItemName%Item lvl:  %ItemLevel%
    
      ; DPS calculations
      If IsWeapon {
         SetFormat, FloatFast, 5.1
    
         PhysDps := ((PhysLo + PhysHi) / 2) * AttackSpeed
         EleDps := ((ChaoLo + ChaoHi + ColdLo + ColdHi + FireLo + FireHi + LighLo + LighHi) / 2) * AttackSpeed
         TotalDps := PhysDps + EleDps
    
         TT = %TT%`nPhys DPS:  %PhysDps%`nElem DPS:  %EleDps%`nTotal DPS: %TotalDps%
    
         ; Only show Q20 values If item is not Q20
         If Quality < 20
         {
            TotalPhysMult := (PhysMult + Quality + 100) / 100
            BasePhysDps := PhysDps / TotalPhysMult
            Q20Dps := BasePhysDps * ((PhysMult + 120) / 100) + EleDps
    
            TT = %TT%`nQ20 DPS:   %Q20Dps%
         }
      }
    
           ; Replaces Clipboard with tooltip data
           StringReplace, clipboard, TT, `n, %A_SPACE% , All

      ; Show tooltip, with fixed width font
      ToolTip, %TT%, X + 35, Y + 35
      ;global FixedFont
      ;SetFont(FixedFont)
      ; Set up count variable and start timer for tooltip timeout
      global ToolTipTimeout := 0
      SetTimer, ToolTipTimer, 100
   }
}
 
; Tick every 100 ms
; Remove tooltip If mouse is moved or 5 seconds pass
ToolTipTimer:
ToolTipTimeout += 1
MouseGetPos, CurrX, CurrY
MouseMoved := (CurrX - X)**2 + (CurrY - Y)**2 > 40**2
If (MouseMoved or ToolTipTimeout >= 50)
{
   SetTimer, ToolTipTimer, Off
   ToolTip
}
return

;-------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS--------------NOT MY FUNCTIONS-----------------

;-------END--------------END--------------END--------------END--------------END----------------------
