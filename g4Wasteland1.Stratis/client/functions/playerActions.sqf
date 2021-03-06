// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[
	["Holster Weapon", { player action ["SwitchWeapon", player, player, 100] }, [], -90, false, false, "", "vehicle player == player && currentWeapon player != ''"],
	["Unholster Primary Weapon", { player action ["SwitchWeapon", player, player, 0] }, [], -90, false, false, "", "vehicle player == player && currentWeapon player == '' && primaryWeapon player != ''"],

	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -100, false], //, false, "", ""],
	
	
	["Track Devices", "addons\beacondetector\beacondetector.sqf",0,-10,false,false,"","('MineDetector' in (items player)) && !BeaconScanInProgress"],
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel tracking.</t>", "Beaconscanstop = true",0,-10,false,false,"","BeaconScanInProgress"],

	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],

	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", { doCancelAction = true }, [], 1, false, false, "", "mutexScriptInProgress"],

	["<img image='client\icons\repair.paa'/> Salvage", "client\actions\salvage.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && !(cursorTarget isKindOf 'Man') && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 2}"],

	["<t color='#FFE496'><img image='client\icons\gunner.paa'/> Mark your stuff on the map</t>", "addons\scripts\markOwned.sqf", [], -95,false,false,"","{_x in ['ItemGPS','B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0"],

	["<t color='#FFE496'><img image='client\icons\r3f_lock.paa'/> Open Base Menu</t>", "addons\BoS\BoS_selectMenu.sqf", [cursorTarget], -97, false, false, "", "cursortarget iskindof 'Land_Device_assembled_F' && {cursorTarget getVariable ['objectLocked', false]} && {vehicle player == player} && {!isNull cursorTarget} && {alive cursorTarget} && {(player distance cursortarget) < 5}"],	
	["<t color='#FFE496'><img image='client\icons\take.paa'/> Hack Base</t>", "addons\BoS\BoS_hackBase.sqf", [cursorTarget], -97, false, false, "", "cursortarget iskindof 'Land_Device_assembled_F' && {cursorTarget getVariable ['objectLocked', false]} && {vehicle player == player} && {!isNull cursorTarget} && {alive cursorTarget} && {'ToolKit' in (items player)} && {cursorTarget getVariable ['ownerUID',''] != getPlayerUID player} && {(player distance cursortarget) < 5}"],	

	["<img image='client\icons\cancel.paa'/> Hide Body", "client\actions\hide.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && (cursorTarget isKindOf 'Man') && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 2}"],	
	["<img image='client\icons\health.paa'/> Heal Self", "addons\scripts\healself.sqf", [], 1, false, false, "", "(damage player > 0.05) && ('FirstAidKit' in (items player))"],
	
["<img image='client\icons\r3f_unlock.paa'/> Pick Lock", "addons\breakLock\breakLock.sqf", [cursorTarget], 1, false, false, "", "!isNull cursorTarget && alive cursorTarget && {{ cursorTarget isKindOf _x } count ['LandVehicle', 'Ship', 'Air'] > 0 ;} && ('ToolKit' in (items player)) && cursorTarget getVariable ['ownerUID',''] != getPlayerUID player && locked cursorTarget >= 2 && cursorTarget distance player < 5 && ('ToolKit' in (items player)) && isNil {cursorTarget getVariable 'A3W_Truck'}"],
	
	["[0]"] call getPushPlaneAction,
	["<img image='client\icons\push.paa'/> Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["<img image='client\icons\push.paa'/> Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["<img image='client\icons\push.paa'/> Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],

	["<t color='#FF0000'>Emergency eject</t>",  { [[], fn_emergencyEject] execFSM "call.fsm" }, [], -9, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase')"],
	["<t color='#FF00FF'>Open magic parachute</t>", { [[], fn_openParachute] execFSM "call.fsm" }, [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"],
	[format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' color='%1'/> <t color='%1'>[</t>Airdrop Menu<t color='%1'>]</t>", "#FF0000"],"addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf",[], -100, false, false],
	["<t color='#FF0000'>Explosives Interface</t>", {vip_sms_var_cl_minePlacing = false; createDialog "vip_sms_dlg_mineMenu"},[], -98, false, true, "", "!vip_sms_var_cl_minePlacing && !(surfaceIsWater (getPos player)) && ((getPosASL player select 2) > 0) && !((animationState player) in ['AinvPknlMstpSlayWrflDnon_medic', 'AinvPknlMstpSlayWpstDnon_medicOut', 'AinvPknlMstpSlayWnonDnon_medic'])"]
];

// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'><img image='client\icons\driver.paa'/> Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};

// Morehehe... (heli)
if !(304380 in getDLCs 1) then 
{
	[player, ["<t color='#00FFFF'><img image='client\icons\driver.paa'/> Get in as pilot anyway!</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "((cursorTarget isKindOf 'B_Heli_Transport_03_base_F') or (cursorTarget isKindOf 'Heli_Transport_04_base_F')) && player distance cursorTarget < 5.5 && isNull driver cursorTarget"]] call fn_addManagedAction;

	[player, ["<t color='#00FFFF'><img image='client\icons\gunner.paa'/> Get in as gunner anyway!</t>", "client\actions\moveInGunner.sqf", [], 6, true, true, "", "((cursorTarget isKindOf 'B_Heli_Transport_03_base_F') or (cursorTarget isKindOf 'Heli_Transport_04_base_F')) && player distance cursorTarget < 5.5 && cursorTarget emptyPositions 'Gunner' > 0  "]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Get in as Copilot", "client\actions\moveInTurret.sqf", [0], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F') or (cursorTarget isKindOf 'Heli_Transport_04_base_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [0])"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Get in as Left door gunner", "client\actions\moveInTurret.sqf", [1], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [1])"]] call fn_addManagedAction;
	[player, ["<img image='client\icons\gunner.paa'/> Get in as Right door gunner", "client\actions\moveInTurret.sqf", [2], 6, true, true, "", "(locked cursorTarget != 2) && ((cursorTarget isKindOf 'B_Heli_Transport_03_F') or (cursorTarget isKindOf 'B_Heli_Transport_03_unarmed_F')) && player distance cursorTarget < 10 && isNull (cursorTarget turretUnit [2])"]] call fn_addManagedAction;
};

if (["_crew_", typeOf player] call fn_findString != -1) then
{


[player, ["<t color='#FF0000'><img image='client\icons\bomb.paa'/> Perform your duty!</t>", "addons\far_revive\FAR_lastResort.sqf",[], 10, false ]] call fn_addManagedAction;


};
if (["A3W_savingMethod", "profile"] call getPublicVar == "extDB" && {["A3W_purchasedVehicleSaving"] call isConfigOn || ["A3W_missionVehicleSaving"] call isConfigOn}) then
{
	[player, ["<img image='client\icons\save.paa'/> Force Save Vehicle", { pvar_manualVehicleSave = netId cursorTarget; publicVariableServer "pvar_manualVehicleSave" }, [], -9.5, false, true, "", "call canForceSaveVehicle"]] call fn_addManagedAction;
};
	

