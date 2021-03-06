// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_key", "_shift", "_ctrl", "_alt", "_handled"];

_key = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;

_handled = false;

// ********** Hardcoded keys **********
switch (true) do
{
	// U key
	case (_key == 22):
	{
		execVM "client\systems\adminPanel\checkAdmin.sqf";
	};

	// Tilde (key above Tab)
	case (_key == 41):
	{
		[] spawn loadPlayerMenu;
		_handled = true;
	};

	// Home & Windows keys
	case (_key in [199,219,220]):
	{
		showPlayerNames = if (isNil "showPlayerNames") then { true } else { !showPlayerNames };
	};

	// Earplugs - End Key
	case (_key == 207):
	{
		if (soundVolume > 0.5) then
		{
			0.5 fadeSound 0.2;
			["You've inserted your earplugs.", 5] call mf_notify_client;
		}
		else
		{
			0.5 fadeSound 1;
			["You've taken out your earplugs.", 5] call mf_notify_client;
		};
	};
		// Emergency Eject - Del Key
	case (_key == 211):
	{	
		[-9, false, true, ""] execVM "client\actions\forceEject.sqf";
	};
   // U Key
	case (_key == 87):
	{
		private ["_uid"];
		_uid = getPlayerUID player;

		switch (true) do
		{
			case ([_uid, serverOwners] call isAdmin || isServer):
			{
				deleteVehicle cursorTarget;
				hint "Vehicle Deleted!";
			};
			case (serverCommandAvailable "#kick"):
			{
				deleteVehicle cursorTarget;
				hint "Vehicle Deleted!";
			};
		};

	};
	// Holster /Unholster Weapon - H Key
	case (_key == 35):
	{
		if (currentweapon player != "") then
		{
			player action ["SwitchWeapon", player, player, 100];
			["You holster your weapon!", 5] call mf_notify_client;
		}
		else
		{
			player action ["SwitchWeapon", player, player, 0];
			["You Unholster your weapon!", 5] call mf_notify_client;
		};
	};
	//Spawn an ATV with Y
	case (_key == 210):
    {
        if(vehicle player != player) exitWith{};
        _pos = getPos player;
        _legitim = player getVariable "Neugeladen";
        if(_legitim == 1) then 
        {
            player setVariable["Neugeladen", 0,true];
            _car = createVehicle ["C_Quadbike_01_F",_pos, [], 0, "CAN_COLLIDE"];
            _car setVariable ["newVehicle",1,true];
            _car setVariable ["R3F_LOG_disabled", true];
            clearMagazineCargoGlobal _car;
            clearWeaponCargoGlobal _car;
            clearItemCargoGlobal _car; 
            _car spawn ATVCleanup;
        } 
        else 
        {
        hint "You have already spawned an ATV!"
        };    
    };
};

// ********** Action keys **********

// Remove Locking On ability
if (!_handled && (inputAction "LockTarget" > 0 || inputAction "LockTargets" > 0)) then
{
	private["_pweapon","_vweapon","_locktarget","_maxLockonDistance"];
	_lockTarget = cursorTarget;
	_pweapon = currentWeapon player;
	_vweapon = currentWeapon (vehicle player);
	_maxLockonDistance = (["A3W_maxLockonDistance", 0] call getPublicVar) max 0;

	switch (true) do
	{
		//case (_pweapon == "launch_Titan_short_F" || {_pweapon == "launch_I_Titan_short_F" || {_pweapon == "launch_O_Titan_short_F"}}): { systemChat format ["Locking Disabled for Titan AT/AP Missiles"]; _handled = true; };
		case (_vweapon == "missiles_DAGR" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for DAGR Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "missiles_SCALPEL" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for SCALPEL  Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "Missile_AGM_01_Plane_CAS_02_F" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for Sharur Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "Missile_AGM_02_Plane_CAS_01_F" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for Macer Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
		case (_vweapon == "Titan_AT" && (player distance _lockTarget) >= _maxLockonDistance): { systemChat format ["Locking Disabled for Titan Missiles beyond %1M.",_maxLockonDistance]; _handled = true; };
	};
};
// Parachute
if (!_handled && _key in actionKeys "GetOver") then
{
	if (alive player) then
	{
		_veh = vehicle player;

		if (_veh == player) then
		{
			if ((getPos player) select 2 > 2.5) then
			{
				true call fn_openParachute;
				_handled = true;
			};
		}
		else
		{
			if (_veh isKindOf "ParachuteBase") then
			{
				// 1s cooldown after parachute is deployed so you don't start falling again if you double-tap the key
				if (isNil "openParachuteTimestamp" || {diag_tickTime - openParachuteTimestamp >= 1}) then
				{
					moveOut player;
					_veh spawn
					{
						sleep 1;
						deleteVehicle _this;
					};
				};
			};
		};
	};
};

// Eject
if (!_handled && _key in actionKeys "GetOut") then
{
	_veh = vehicle player;

	if (alive player && _veh != player) then
	{
		if (_ctrl && {_veh isKindOf 'Air' && !(_veh isKindOf 'ParachuteBase')}) then
		{
			[] spawn
			{
				if !(["Are you sure you want to eject?", "Confirm", true, true] call BIS_fnc_guiMessage) exitWith {};
				[[], fn_emergencyEject] execFSM "call.fsm";
			};
		};
	};
};

// Scoreboard
if (!_handled && _key in actionKeys "NetworkStats") then
{
	if (_key != 25 || // 25 = P
	   ((!_ctrl || {!(486539289 in actionKeys "NetworkPlayers") && isNil "TFAR_fnc_TaskForceArrowheadRadioInit"}) && // 486539289 = Left Ctrl + P
	   (!_shift || {!(704643042 in actionKeys "NetworkPlayers")}))) then // 704643042 = Left Shift + P
	{
		if (alive player && isNull (uiNamespace getVariable ["ScoreGUI", displayNull])) then
		{
			call loadScoreboard;
		};

		_handled = true;
	};
};



_handled
