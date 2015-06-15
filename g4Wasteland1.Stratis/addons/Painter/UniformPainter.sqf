// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: UniformPainter.sqf
//	@file Author: LouD
//	@file Created: 14-02-2015

_texDir = "client\images\vehicleTextures\";
_paint = _this select 0;

_price = 500;
_playerMoney = player getVariable "cmoney";

if (_price > _playerMoney) exitWith
	{
		_text = format ["Not enough money! You need $%1 to paint your clothes.",_price];
		[_text, 10] call mf_notify_client;
		playSound "FD_CP_Not_Clear_F";
	};

if (_price < _playerMoney) then	
	{
		player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
		_text = format ["You paid $%1 to paint your clothes.",_price];
		[_text, 10] call mf_notify_client;		
		player spawn fn_savePlayerData;
	};

if (_paint == 0) then {
player setObjectTextureGlobal  [0, _texDir+"11_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"11_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"11_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"11_P.jpg"];
};

if (_paint == 1) then {
player setObjectTextureGlobal  [0, _texDir+"12_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"12_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"12_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"12_P.jpg"];
};

if (_paint == 2) then {
player setObjectTextureGlobal  [0, _texDir+"13_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"13_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"13_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"13_P.jpg"];
};

if (_paint == 3) then {
player setObjectTextureGlobal  [0, _texDir+"14_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"14_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"14_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"14_P.jpg"];
};

if (_paint == 4) then {
player setObjectTextureGlobal  [0, _texDir+"15_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"15_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"15_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"15_P.jpg"];
};

if (_paint == 5) then {
player setObjectTextureGlobal  [0, _texDir+"16_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"16_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"16_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"16_P.jpg"];
};

if (_paint == 6) then {
player setObjectTextureGlobal  [0, _texDir+"17_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"17_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"17_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"17_P.jpg"];
};

if (_paint == 7) then {
player setObjectTextureGlobal  [0, _texDir+"18_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"18_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"18_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"18_P.jpg"];
};

if (_paint == 8) then {
player setObjectTextureGlobal  [0, _texDir+"19_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"19_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"19_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"19_P.jpg"];
};

if (_paint == 9) then {
player setObjectTextureGlobal  [0, _texDir+"20_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"20_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"20_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"20_P.jpg"];
};

if (_paint == 10) then {
player setObjectTextureGlobal  [0, _texDir+"21_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"21_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"21_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"21_P.jpg"];
};

if (_paint == 11) then {
player setObjectTextureGlobal  [0, _texDir+"22_P.jpg"];
player setObjectTextureGlobal  [1, _texDir+"22_P.jpg"];
player setObjectTextureGlobal  [2, _texDir+"22_P.jpg"];
backpackContainer player setObjectTextureGlobal  [0, _texDir+"22_P.jpg"];
};

