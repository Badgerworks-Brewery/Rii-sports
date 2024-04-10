/*===========================================
    Wii Double Down Mii interface
    Code     : mdbrim

    miidraw.h
============================================*/

#include <mii.h>

extern Mii* miis;
extern GRRLIB_texImg* img_staticmii[100];
extern int bodyadjust[100];
extern char miinames[100][11];

int MakeMiiHappy(int bodypart);
int MakeMiiSad(int bodypart);
int MakeMiiShocked(int bodypart);
int MakeMiiMad(int bodypart);
void GRRLIB_MiisInit();
void GRRLIB_BuildMii(Mii mii, int miiid, int miiblinks, int miieyes, int miimouth, GRRLIB_texImg* tex);
void GRRLIB_CreateStaticMiis();