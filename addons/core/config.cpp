#include "script_version.hpp"

class CfgPatches
{
	class SATCPCOMPAT
	{
		name = "Sevine Arms TCP Compat";
		author = "RoutOfWolves";
		units[] = {};
		weapons[] = {};
		requiredAddons[] =
		{
			"CBA_Main",
		};
		VERSION_CONFIG;
	};
};

class CfgSettings
{
	class CBA
	{
		class Versioning // https://github.com/CBATeam/CBA_A3/wiki/Versioning-System
		{
			class SATCPCOMPAT
			{
				main_addon = "SATCPCOMPAT";
			};
		};
	};
};
