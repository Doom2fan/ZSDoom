/*
 *  ZSDoom - A Doom port written in ZScript
 *  Copyright (C) 2018 Chronos "phantombeta" Ouroboros
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

enum MobjFlags {
    MF_SPECIAL      = 1 << 0, // Call P_SpecialThing when touched.
    MF_SOLID        = 1 << 2, // Blocks.
    MF_SHOOTABLE    = 1 << 3, // Can be hit.
    MF_NOSECTOR     = 8, // Don't use the sector links (invisible but touchable).
    MF_NOBLOCKMAP   = 16, // Don't use the blocklinks (inert but displayable)

    MF_AMBUSH       = 32, // Not to be activated by sound, deaf monster.
    MF_JUSTHIT      = 64, // Will try to attack right back.
    MF_JUSTATTACKED = 128, // Will take at least one step before attacking.
    MF_SPAWNCEILING = 256, // On level spawning (initial position), hang from ceiling instead of stand on floor.
    MF_NOGRAVITY    = 512, // Don't apply gravity.

    // Movement flags.
    MF_DROPOFF      = 0x400, // This allows jumps from high places.
    MF_PICKUP       = 0x800, // For players, will pick up items.
    MF_NOCLIP       = 0x1000, // Player cheat. ???
    MF_SLIDE        = 0x2000, // Player: keep info about sliding along walls.
    MF_FLOAT        = 0x4000, // Allow moves to any height, no gravity.
    MF_TELEPORT     = 0x8000, // Don't cross lines
                              //   ??? or look at heights on teleport.
    MF_MISSILE      = 0x10000, // Don't hit same species, explode on block.
    MF_DROPPED      = 0x20000, // Dropped by a demon, not level spawned.
    MF_SHADOW       = 0x40000, // Use fuzzy draw. (shadow demons or spectres)
    MF_NOBLOOD      = 0x80000, // Flag: don't bleed when shot. (use puff)
    MF_CORPSE       = 0x100000, // Don't stop moving halfway off a step,
                                //  that is, have dead bodies slide down all the way.
    MF_INFLOAT      = 0x200000, // Floating to a height for a move, ???
                                //  don't auto float to target's height.

    MF_COUNTKILL    = 0x400000, // On kill, count this enemy object towards intermission kill total.
    MF_COUNTITEM    = 0x800000, // On picking up, count this item object towards intermission item total.
    MF_SKULLFLY     = 0x1000000, // Special handling: skull in flight. Neither a cacodemon nor a missile.
    MF_NOTDMATCH    = 0x2000000, // Don't spawn this object in death match mode (e.g. key cards).

    // Player sprites in multiplayer modes are modified using an internal color lookup table for re-indexing.
    // If 0x4 0x8 or 0xc, use a translation table for player colormaps
    MF_TRANSLATION = 0xc000000,
    // Hmm ???.
    MF_TRANSSHIFT = 26
};

// Map Object definition.
class ZSDoom_Mobj : ZSDoom_Thinker {
    Vector3 pos;
    Vector3 vel;

    // More list: links in sector (if needed)
    ZSDoom_Mobj snext;
    ZSDoom_Mobj sprev;

    // More drawing info: to determine current sprite.
    double angle;  // orientation
    int    sprite; // used to find patch_t and flip value
    int    frame;  // might be ORed with FF_FULLBRIGHT

    // Interaction info, by BLOCKMAP.
    // Links in blocks (if needed).
    ZSDoom_Mobj  bnext;
    ZSDoom_Mobj  bprev;

    //struct subsector_s* subsector;

    // The closest interval over all contacted Sectors.
    double floorZ;
    double ceilingZ;

    // For movement checking.
    double radius;
    double height;

    // If == validcount, already checked.
    int validcount;

    ZSDoom_MobjType type;
    ZSDoom_MobjInfo info; // mobjinfo[mobj.type]

    int          tics;   // state tic counter
    //ZSDoom_State state;
    int          flags;
    int          health;

    // Movement direction, movement generation (zig-zagging).
    int movedir;    // 0-7
    int movecount;  // when 0, select a new dir

    // Thing being chased/attacked (or NULL),
    // also the originator for missiles.
    ZSDoom_Mobj target;

    // Reaction time: if non 0, don't attack yet.
    // Used by player to freeze a bit after teleporting.
    int reactiontime;

    // If >0, the target will be chased
    // no matter what (even if shot)
    int threshold;

    // Additional info record for player avatars only.
    // Only valid if type == MT_PLAYER
    //ZSDoom_PlayerInfo player;

    // Player number last looked for.
    int lastlook;

    // For nightmare respawn.
    //mapthing_t spawnpoint;

    // Thing being chased/attacked for tracers.
    ZSDoom_Mobj tracer;
}