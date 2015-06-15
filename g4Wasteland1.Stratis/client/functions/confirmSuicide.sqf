if (!alive player) exitWith {};

_Bounty = player getVariable "BountyTarget";
if (_Bounty) exitWith
{
titleText ["You cannot take the easy route as the bounty target.", "PLAIN", 0.5];
};

if (["Are you sure you want to suicide?", "Confirm", "Yes", true] call BIS_fnc_guiMessage) then
{
        player allowDamage true;
        player setDamage 1;
};