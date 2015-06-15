// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles", "_donatorLevel"];
_player = _this;

_donatorEnabled = ["A3W_donatorEnabled"] call isConfigOn;
_donatorLevel = player getVariable ["donatorLevel", 0];


// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

switch (_donatorLevel) do
{
	case 1:
	{
		_player addBackpack "B_AssaultPack_rgr";
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_HarnessOGL_brn";
		};
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
		// Items
		_player addWeapon "Rangefinder";
		_player addItemToBackpack "FirstAidKit";
		_player addItemToBackpack "";
		_player linkItem "ItemGPS";
	};
	case 2:
	{
		// Backpack
		_player addBackpack "B_FieldPack_khk";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_TacVest_brn";
		};
		// Head gear
		_player addHeadgear "H_HelmetB";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
		// Items
		_player addWeapon "Rangefinder";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";			
	};
	case 3:
	{
		// Backpack
		_player addBackpack "B_Kitbag_rgr";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_TacVest_brn";
		};
		// Head gear
		_player addHeadgear "H_HelmetSpecB_blk";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";		

	};
	case 4:
	{
		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_PlateCarrierSpec_blk";
		};
		// Head gear
		_player addHeadgear "H_HelmetSpecB_blk";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
	};
	case 5: // Sniper
	{
		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_Chestrig_rgr";
		};
		// Head Gear
		_player addHeadgear "H_HelmetLeaderO_ocamo";
		// Uniform	
		_player forceAddUniform "U_O_FullGhillie_sard";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player linkItem "NVGoggles";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
	};
	case 6: // Tron
	{
		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_PlateCarrier3_rgr";
		};
		// Head gear
		_player addHeadgear "H_CrewHelmetHeli_I";
		// Uniform
		_player forceAddUniform "U_B_Protagonist_VR";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player linkItem "NVGoggles";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
	};
	case 7: // Pilot
	{
		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
		_player addVest "V_PlateCarrier3_rgr";
		};
		// Head gear
		_player addHeadgear "H_PilotHelmetFighter_I";
		// uniform
		_player forceAddUniform "U_I_pilotCoveralls";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
		_player linkItem "NVGoggles";
	};
	case 8: // Diver
	{

		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_RebreatherIA";
		};
		// uniform
		_player forceAddUniform "U_I_Wetsuit";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
		_player linkItem "NVGoggles";
	};
	case 9: // Admin
	{
		// Backpack
		_player addBackpack "B_Carryall_oli";
		// Vest
		if (["_diver_", typeOf _player] call fn_findString != -1) then {} else 
		{
			_player addVest "V_PlateCarrierSpec_blk";
		};
		// Head gear
		_player addHeadgear "H_CrewHelmetHeli_B";
		// Uniform
		_player forceAddUniform "U_I_Protagonist_VR";
		// Weapons Defaults
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";		
		// Items
		_player addWeapon "Laserdesignator";
		_player linkItem "ItemGPS";
		_player addItemToBackpack "";
		_player addItemToBackpack "";
		_player linkItem "NVGoggles";
	};
	default 
	{
        _player addBackpack "B_AssaultPack_rgr";
        _player addVest "V_BandollierB_blk";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addWeapon "hgun_Pistol_heavy_01_F";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addMagazine "11Rnd_45ACP_Mag";
        _player addItem "FirstAidKit";
        _player selectWeapon "hgun_Pistol_heavy_01_F";
    };
	
};

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player removeItem "FirstAidKit";
		_player addItem "Medikit";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "MineDetector";
		_player addItem "Toolkit";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player addWeapon "Rangefinder";
	};
};



if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
