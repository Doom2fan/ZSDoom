/*
 *  ZSDoom - A Doom port written in ZScript
 *  Copyright (C) 1993-1996 Id Software
 *  Copyright (C) 2018      Chronos "phantombeta" Ouroboros
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// Version
class ZSDoom_Constants {
    const MajorVersion = 0;
    const MinorVersion = 1;

    // Game mode handling - identify IWAD version
    enum GameMode {
        IWAD_Shareware,    // DOOM 1 shareware, E1, M9
        IWAD_Registered,   // DOOM 1 registered, E3, M27
        IWAD_Commercial,   // DOOM 2 retail, E1, M32
        IWAD_Retail,       // DOOM 1 retail, E4, M36
        IWAD_Indetermined, // Well, no IWAD found.
    };

    // Mision packs
    enum GameMission {
        GAMEMISSION_Doom,     // Doom 1
        GAMEMISSION_Doom2,    // Doom2
        GAMEMISSION_TNT,      // Final Doom - TNT: Evilution
        GAMEMISSION_Plutonia, // Final Doom - The Plutonia Experiment
        GAMEMISSION_None,
    };

    const BASE_WIDTH = 320;
    const SCREEN_MUL = 1;
    const INV_ASPECT_RATIO = 0.625;

    const SCREENWIDTH = 320;
    const SCREENHEIGHT = 200;

    // The maximum number of players
    const MAXPLAYERS = 4;
    // The game's ticrate
    const TICRATE = 35;

    enum GameState {
        GS_Level,
        GS_Intermission,
        GS_Finale,
        GS_Demoscreen,
    };

    enum MapFlags {
        // Skill flags
        MTF_EASY   = 1 << 0,
        MTF_NORMAL = 1 << 2,
        MTF_HARD   = 1 << 3,
        // Ambush players
        MTF_AMBUSH = 1 << 4,
    };

    enum Skills {
        SKILL_Baby,
        SKILL_Easy,
        SKILL_Medium,
        SKILL_Hard,
        SKILL_Nightmare,
    };

    enum Keys {
        IT_BlueCard,
        IT_YellowCard,
        IT_RedCard,
        IT_BlueSkull,
        IT_YellowSkull,
        IT_RedSkull,

        NUMKEYS,
    };

    enum WeaponType {
        WP_Fist,
        WP_Pistol,
        WP_Shotgun,
        WP_Chaingun,
        WP_Missile,
        WP_Plasma,
        WP_BFG,
        WP_Chainsaw,
        WP_SuperShotgun,

        NUMWEAPONS,

        // No pending weapon change
        WP_NoChange,
    };

    // Ammunition types defined.
    enum AmmoType {
        AM_Clip,   // Pistol, Chaingun.
        AM_Shell,  // Shotgun, Super Shotgun.
        AM_Cell,   // Plasma rifle, BFG.
        AM_Misl,   // Rocket Launcher.
        NUMAMMO,
        AM_NoAmmo, // Unlimited for chainsaw / fist.
    };

    enum PowerType {
        PW_Invulnerability,
        PW_Strength,
        PW_Invisibility,
        PW_IronFeet,
        PW_AllMap,
        PW_Infrared,
        NUMPOWERS,
    };

    // Powerup durations.
    //   How many seconds until expiration.
    enum PowerDuration {
        INVULNTICS = ( 30 * TICRATE),
        INVISTICS  = ( 60 * TICRATE),
        INFRATICS  = (120 * TICRATE),
        IRONTICS   = ( 60 * TICRATE),
    };
}