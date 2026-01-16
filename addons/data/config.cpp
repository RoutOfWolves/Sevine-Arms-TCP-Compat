#include "script_version.hpp"

class CfgPatches
{
	class Rebalance_Config
	{
		name = "Sevine Arms TCP Compat";
		author = "RoutOfWolves";
		units[] = {};
		weapons[] = {};
		requiredAddons[] =
		{
			"",
		};
		VERSION_CONFIG;
	};
};

class CfgWeapons
{
	#include "helmets\weapons_config.hpp"
	#include "firearms\weapons_config.hpp"
	#include "vests\weapons_config.hpp"
};

class CfgAmmo
{
	#include "ammo\ammo_config.hpp"
};

class CfgVehicles
{
	#include "uniforms\vehicles_config,hpp"
};
