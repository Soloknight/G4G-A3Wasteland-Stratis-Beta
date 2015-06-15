//	@file Name: fn_onPlayerConnected.sqf
//	@file Author: AgentRev

private ["_id", "_uid", "_name"];
_id = _this select 0;
_uid = _this select 1;
_name = _this select 2;
_reconnect = 1;
_disconnect = 1;

if(_name != "__SERVER__") then
{
	

//	{
//		if(_uid == getPlayerUID _x) then
//		{
//			_x addMPEventHandler ["mprespawn", {[_x] call fn_onPlayerRespawn;}];	
//			diag_log format ["Adding Respawn Event Handler: %1 (%2)", _name, _uid];
//		};
//		
//	}foreach playableUnits;
	private ["_reconnect", "_disconnect", "_result","_bountydisconnect"];
	_reconnect = 1;
	_disconnect = 1;
	_result = 0;
    _bountydisconnect = 0;
    if(!isNil "_uid") then
    {
	if (count _result == 0) then { 
    _result = [format ["checkPlayerBountyDisconnect:%1:%2:%3",_reconnect,_disconnect,_uid],2,true] call extDB_Database_async;
	diag_log format["WASTELAND SERVER - Bounty Disconnect Result '%1' Player - '%2'", _result, _uid];
	     
    _bountydisconnect = _result;
    };
    };

	if(_bountydisconnect > 0) then
	{
		pvar_BountySystemReconnects = pvar_BountySystemReconnects + [_uid];
		diag_log format["WASTELAND SERVER - Bounty Reconnected '%1'", _uid];
	};
};
diag_log format ["Player connected: %1 (%2)", _name, _uid];