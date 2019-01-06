private ["_delcode", "_currentworld", "_oldworld", "_newworld", "_notalive"];
if (!isDedicated) exitWith{};
_delcode = {
			private ["_crew"];
			sleep 5;
			{
				if (not isNull _x) then {
						if(_x isKindof "Ship" or _x isKindof "Air" or _x isKindof "LandVehicle") then {
							_crew = nearestObjects [_x, ["Man"], 20];
							_crew = _crew + crew _x;
							deleteVehicle _x;
							{
									if(not alive _x) then {deleteVehicle _x};
							}	forEach _crew;
						}	else {
								deleteVehicle _x;
						};
				};
			} forEach _this;
};

switch (playerSide) do
{
case west:
	{
		_currentworld = [];
		while {true} do {
			sleep 3;
			_oldworld = _currentworld;
			_currentworld =+ list safe_west;
			_newworld = _oldworld - _currentworld;
			_notalive = [];
			{
				if (not alive _x) then {_notalive = _notalive + [_x]};
			}	forEach _newworld;
			if (count _notalive > 0) then {_notalive spawn _delcode};
			};
	};
	
case east:
	{
		_currentworld = [];
		while {true} do {
			sleep 3;
			_oldworld = _currentworld;
			_currentworld =+ list safe_east;
			_newworld = _oldworld - _currentworld;
			_notalive = [];
			{
				if (not alive _x) then {_notalive = _notalive + [_x]};
			}	forEach _newworld;
			if (count _notalive > 0) then {_notalive spawn _delcode};

			};
	};

case resistance:
	{	
    _currentworld = [];
		while {true} do {
			sleep 3;
			_oldworld = _currentworld;
			_currentworld =+ list safe_guerrila;
			_newworld = _oldworld - _currentworld;
			_notalive = [];
			{
				if (not alive _x) then {_notalive = _notalive + [_x]};
			}	forEach _newworld;
			if (count _notalive > 0) then {_notalive spawn _delcode};

			};	
	};
		
};

