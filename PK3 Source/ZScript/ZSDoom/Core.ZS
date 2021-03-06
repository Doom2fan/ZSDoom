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

class ZSDoom_UserCMD : Object {
    uint buttons;
    int16 yaw;
    int16 forwardmove;
    int16 sidemove;

    static ZSDoom_UserCMD FromGZDUserCmd (UserCmd gzdCMD) {
        let cmd = new ('ZSDoom_UserCMD');

        cmd.buttons     = gzdCMD.buttons;
        cmd.yaw         = gzdCMD.yaw;
        cmd.forwardmove = gzdCMD.forwardmove;
        cmd.sidemove    = gzdCMD.sidemove;

        return cmd;
    }
}

class ZSDoom_Core : Thinker {
    enum GameAction {
        GA_Nothing,
        GA_LoadLevel,
        GA_NewGame,
        GA_LoadGame,
        GA_SaveGame,
        GA_PlayDemo,
        GA_Completed,
        GA_Victory,
        GA_WorldDone,
        GA_Screenshot,
    };

    GameAction curGameAction;
    int gametic;
    Array<ZSDoom_Mobj> mobjs;

    override void Tick () {
        let cmd = ZSDoom_UserCMD.FromGZDUserCmd (players [consoleplayer].original_cmd);


    }
}