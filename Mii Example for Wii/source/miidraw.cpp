#include <stdlib.h>
#include <mii.h>
#include <grrlib.h>

#include "mii_heads_png.h"
#include "mii_hairs1_png.h"
#include "mii_hairs2_png.h"
#include "mii_eyebrows_png.h"
#include "mii_eyes1_png.h"
#include "mii_eyes2_png.h"
#include "mii_eyes3_png.h"
#include "mii_noses_png.h"
#include "mii_features_png.h"
#include "mii_lips_png.h"
#include "mii_mole_png.h"
#include "mii_beards_png.h"
#include "mii_mustache_png.h"
#include "mii_glasses_png.h"

Mii* miis;

static GRRLIB_texImg* img_heads;
static GRRLIB_texImg* img_hairs1;
static GRRLIB_texImg* img_hairs2;
static GRRLIB_texImg* img_eyebrows;
static GRRLIB_texImg* img_eyes1;
static GRRLIB_texImg* img_eyes2;
static GRRLIB_texImg* img_eyes3;
static GRRLIB_texImg* img_noses;
static GRRLIB_texImg* img_features;
static GRRLIB_texImg* img_lips;
static GRRLIB_texImg* img_mole;
static GRRLIB_texImg* img_beards;
static GRRLIB_texImg* img_mustache;
static GRRLIB_texImg* img_glasses;
GRRLIB_texImg* img_staticmii[100];

// ************************ DEFINE OUR ARRAYS ********************
int hairbg[72] = {56,56,56,56,56,56,56,56,56,56,56,56,16,56,56,56,56,56,17,18,56,19,20,56,56,56,21,56,56,56,56,56,56,56,56,56,22,23,56,56,24,25,56,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,56,56,48,49,50,51,52,53,56};
int hairfg[72] = {59,42,65,49,40,44,52,47,45,63,51,54,36,37,48,70,61,56,64,43,53,58,50,27,69,41,39,46,66,71,33,11,12,0,35,57,30,14,25,4,1,31,26,24,3,6,62,13,15,7,19,2,17,67,29,20,9,34,18,8,22,60,23,55,21,32,16,28,10,38,5,68};
unsigned int haircol[8] = {0x111111FF, 0x332222FF, 0x441111FF, 0xBB6644FF, 0x8888AAFF, 0x443322FF, 0x996644FF, 0xDDBB99FF};
unsigned int skincol[6] = {0xECCFBDFF, 0xF7BC7dFF, 0xD78A48FF, 0xF5B189FF, 0x995122FF, 0x563010FF};
unsigned int eyecol[6] = {0x000000FF, 0x778887FF, 0x7E6355FF, 0x888940FF, 0x6A84D0FF, 0x409B5AFF};
unsigned int lipcol[3] = {0xC76C46FF, 0xE44E3AFF, 0xD88789FF};
unsigned int glassescol[6] = {0x626D6CFF, 0x85703AFF, 0xAB4E37FF, 0x426996FF, 0xB97F27FF, 0xBDBFB9FF};
int eyebrows[24] = {1,3,14,15,11,10,0,6,8,4,13,12,2,19,16,18,22,9,21,5,17,7,20,23};
int eyes[48] = {2,6,0,42,1,24,29,36,3,16,45,13,17,26,46,9,8,5,33,14,11,20,44,18,30,21,7,10,34,41,31,32,15,12,19,23,27,28,38,4,22,25,39,43,37,40,35,47};
int noses[12] = {5,0,2,3,7,6,4,10,8,9,1,11};
int lips[24] = {6,1,14,16,17,5,10,12,7,13,8,19,23,11,22,18,9,15,21,2,20,3,4,0};
// ***************************************************************

// ************** DEFINE SOME VARIABLES FOR PROG USE *************
int feature=0;
int blink[100];				// this and the other blink variables are stored in arrays
int blinkrand[100];			// so that each mii has its own random blink. This allows
int blinkcount[100];		// for multiple miis to be drawn on the screen at the same
int startblink[100];		// time and not all blink in unison (which would be weird)

int neck=0;					// figures out what type of head is used and allows for a
int bodyadjust[100];		// bodyadjustment variable to draw the body in the right spot

char miinames[100][11];		// stores the names in an array for easy list in the menu (or anywhere else you want)
// ***************************************************************

/**
 * Generates a happy facial feature for a Mii character.
 * 
 * @param bodypart An integer representing the body part to make happy (1 for mouth, 2 for eyes)
 * @return An integer representing the tile index for the happy facial feature
 */
int MakeMiiHappy(int bodypart) {
	if(bodypart==1) {									// 1 = mouth
		int miipart[8] = {3, 4, 5, 8, 14, 16, 19, 23};		// Array of tiles I think are happy mouths
		return(miipart[rand() % 8]);						// Randomly return one of the tiles
	}
	else if(bodypart==2) {								// 2 = eyes
		int miipart=0;										// Most eyes are happy, so just use 0 (which = default eyes)
		return(miipart);
	}
	// etc, etc.
	else return(0);
}
int MakeMiiSad(int bodypart) {
	if(bodypart==1) {									// 1 = mouth
		int miipart[3] = {9, 22, 24};						// Array of tiles I think are sad mouths
		return(miipart[rand() % 3]);						// Randomly return one of the tiles
	}
	else if(bodypart==2) {								// 2 = eyes
		int miipart[3]={6, 33, 39};						// Array of tiles I think are sad eyes
		return(miipart[rand() % 3]);						// Randomly return one of the tiles
	}
	// etc, etc.
	else return(0);
}
/**
 * Generates a random tile number for a shocked Mii body part.
 * 
 * @param bodypart An integer representing the body part (1 for mouth, 2 for eyes)
 * @return An integer representing the tile number for the shocked body part, or 0 if the bodypart is not recognized
 */
int MakeMiiShocked(int bodypart) {
	if(bodypart==1) {									// 1 = mouth
		int miipart[2] = {15, 11};							// Array of tiles I think are shocked mouths
		return (miipart[rand() % 2]);						// Randomly return one of the tiles
	}
	else if(bodypart==2) {								// 2 = eyes
		int miipart[5] = {10, 13, 36, 37, 43};				// Array of tiles I think are shocked eyes
		return(miipart[rand() % 5]);						// Randomly return one of the tiles
	}
	// etc, etc.
	else return(0);
}
int MakeMiiMad(int bodypart) {
	if(bodypart==1) {									// 1 = mouth
		int miipart[3] = {1, 21, 24};						// Array of tiles I think are mad mouths
		return (miipart[rand() % 3]);						// Randomly return one of the tiles
	}
	else if(bodypart==2) {								// 2 = eyes
		int miipart[2] = {44, 44};							// Array of tiles I think are mad eyes
		return(miipart[rand() % 2]);						// Randomly return one of the tiles
	}
	// etc, etc.
	else return(0);
}
/**
 * Initializes the Mii components by loading textures and setting up tile sets.
 * 
 * This function loads various textures for Mii parts (heads, hair, eyes, etc.)
 * and initializes tile sets for each component. It also loads Mii data from
 * the Wii console.
 * 
 * @return void
 */
void GRRLIB_MiisInit() { // INITIALIZE THE MIIS!!!
	
	img_heads = GRRLIB_LoadTexture(mii_heads_png);
	img_hairs1 = GRRLIB_LoadTexture(mii_hairs1_png);
	img_hairs2 = GRRLIB_LoadTexture(mii_hairs2_png);
	img_eyebrows = GRRLIB_LoadTexture(mii_eyebrows_png);
	img_eyes1 = GRRLIB_LoadTexture(mii_eyes1_png);
	img_eyes2 = GRRLIB_LoadTexture(mii_eyes2_png);
	img_eyes3 = GRRLIB_LoadTexture(mii_eyes3_png);
	img_noses = GRRLIB_LoadTexture(mii_noses_png);
	img_features = GRRLIB_LoadTexture(mii_features_png);
	img_lips = GRRLIB_LoadTexture(mii_lips_png);
	img_mole = GRRLIB_LoadTexture(mii_mole_png);
	img_beards = GRRLIB_LoadTexture(mii_beards_png);
	img_mustache = GRRLIB_LoadTexture(mii_mustache_png);
	img_glasses = GRRLIB_LoadTexture(mii_glasses_png);
	
	GRRLIB_InitTileSet(img_heads, 120, 120, 0);
	GRRLIB_InitTileSet(img_hairs1, 120, 120, 0);
	GRRLIB_InitTileSet(img_hairs2, 120, 120, 0);
	GRRLIB_InitTileSet(img_eyebrows, 36, 54, 0);
	GRRLIB_InitTileSet(img_eyes1, 54, 54, 0);
	GRRLIB_InitTileSet(img_eyes2, 54, 54, 0);
	GRRLIB_InitTileSet(img_eyes3, 54, 54, 0);
	GRRLIB_InitTileSet(img_noses, 50, 50, 0);
	GRRLIB_InitTileSet(img_features, 120, 120, 0);
	GRRLIB_InitTileSet(img_lips, 60, 60, 0);
	GRRLIB_InitTileSet(img_beards, 120, 140, 0);
	GRRLIB_InitTileSet(img_mustache, 60, 60, 0);
	GRRLIB_InitTileSet(img_glasses, 180, 72, 0);
	
	miis = loadMiis_Wii();	
}	


/**
 * Builds and renders a Mii character with specified attributes and expressions.
 * 
 * This method constructs a Mii character by compositing various facial features and accessories based on the provided Mii structure. It handles the rendering of hair, face shape, facial features, eyes, eyebrows, lips, mustache, nose, and glasses. The method also implements a blinking mechanism for the Mii.
 *
 * @param mii The Mii structure containing all the character's attributes
 * @param miiid An identifier for the Mii, used for blinking calculations
 * @param miiblinks Flag to enable or disable blinking (1 for enabled, 0 for disabled)
 * @param miieyes Custom eye type to use, or 0 for default eyes based on the Mii structure
 * @param miimouth Custom mouth type to use, or 0 for default mouth based on the Mii structure
 * @param tex Pointer to the GRRLIB_texImg structure where the rendered Mii will be stored
 * @return void This function does not return a value
 *
 * @note This function uses global variables and arrays for various Mii components and colors
 * @note The rendered Mii is composed using GRRLIB library functions
 * @note The blinking mechanism uses random intervals for a more natural appearance
 */
void GRRLIB_BuildMii(Mii mii, int miiid, int miiblinks, int miieyes, int miimouth, GRRLIB_texImg* tex) { // The heart and sole, builds up our mii with requested blink, eye, and mouth settings. 0s will build the Mii unaltered)
	
	GRRLIB_CompoStart();

	GRRLIB_SetHandle(img_hairs1, 60,0);
	GRRLIB_SetHandle(img_hairs2, 60,0);
	GRRLIB_DrawTile(230, 210, img_hairs2, 0, -1*(2*mii.hairPart-1), 1, haircol[mii.hairColor], hairbg[hairfg[mii.hairType]]);
	GRRLIB_DrawTile(230, 200, img_heads, 0, 1, 1, skincol[mii.skinColor], mii.faceShape);
	
	if(mii.faceShape==0) neck=2;
	else if(mii.faceShape==1) neck=0;
	else if(mii.faceShape==2) neck=8;
	else if(mii.faceShape==3) neck=5;
	else if(mii.faceShape==4) neck=1;
	else if(mii.faceShape==5) neck=1;
	else if(mii.faceShape==6) neck=9;
	else if(mii.faceShape==7) neck=10;
	
	if(mii.facialFeature==0) feature=39;
	else if(mii.facialFeature==1) feature=mii.faceShape;
	else if(mii.facialFeature==2) feature=mii.faceShape;
	else if(mii.facialFeature==3) feature=33;
	else if(mii.facialFeature==4) feature=34;
	else if(mii.facialFeature==5) feature=35;
	else if(mii.facialFeature==6) feature=36;
	else if(mii.facialFeature==7) feature=40+mii.faceShape;
	else if(mii.facialFeature==8) feature=38;
	else if(mii.facialFeature==9) feature=8+mii.faceShape;
	else if(mii.facialFeature==10) feature=16+mii.faceShape;
	else if(mii.facialFeature==11) feature=24+mii.faceShape;
	
	if(mii.facialFeature==2) {
		GRRLIB_DrawTile(230, 200, img_features, 0, 1, 1, skincol[mii.skinColor], 32);
		GRRLIB_DrawTile(230, 200, img_features, 0, 1, 1, skincol[mii.skinColor], feature);
	}
	else GRRLIB_DrawTile(230, 200, img_features, 0, 1, 1, skincol[mii.skinColor], feature);
	
	if(mii.beardType>0) GRRLIB_DrawTile(230, 200, img_beards, 0, 1, 1, haircol[mii.facialHairColor], ((mii.beardType-1)*8)+mii.faceShape);
	
	GRRLIB_SetHandle(img_mole, 6, 6);
	if(mii.mole==1) GRRLIB_DrawImg(252+(4*mii.moleHorizPos), 212+(2.8*mii.moleVertPos), img_mole, 0, .2+(mii.moleSize*0.1), .2+(mii.moleSize*0.1), 0xFFFFFFFF);
	
	// ********** RANDOM BLINKER ************
	blink[miiid]++;
	if(blink[miiid]>300+100*blinkrand[miiid]) startblink[miiid]=1;
	if(startblink[miiid]==1) blinkcount[miiid]++;
	if(blinkcount[miiid]>11) {
		blinkrand[miiid]=rand() % 8;
		blink[miiid]=0;
		startblink[miiid]=0;
		blinkcount[miiid]=0;
	}
	// **************************************
	
	if(blinkcount[miiid]<11 && blinkcount[miiid]>1 && miiblinks==1) { //if blinking (and time is right for a blink) display closed eye
		GRRLIB_SetHandle(img_eyes1, 18,36);
		GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 46); 
		GRRLIB_SetHandle(img_eyes2, 18,36);
		GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], 46); 
		GRRLIB_SetHandle(img_eyes3, 18,36);
		GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 46); 
		GRRLIB_SetHandle(img_eyes1, 36,36);
		GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-46); 
		GRRLIB_SetHandle(img_eyes2, 36,36);
		GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], 95-46); 
		GRRLIB_SetHandle(img_eyes3, 36,36);
		GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-46);
	}
	else { // display open eye
		if(miieyes==0) { // if miieyes is 0 draw default open eye.
			GRRLIB_SetHandle(img_eyes1, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, eyes[mii.eyeType]); 
			GRRLIB_SetHandle(img_eyes2, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], eyes[mii.eyeType]); 
			GRRLIB_SetHandle(img_eyes3, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, eyes[mii.eyeType]); 
			GRRLIB_SetHandle(img_eyes1, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-eyes[mii.eyeType]); 
			GRRLIB_SetHandle(img_eyes2, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], 95-eyes[mii.eyeType]); 
			GRRLIB_SetHandle(img_eyes3, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-eyes[mii.eyeType]);
		}
		else { // draw custom open eye.
			GRRLIB_SetHandle(img_eyes1, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, miieyes-1); 
			GRRLIB_SetHandle(img_eyes2, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], miieyes-1); 
			GRRLIB_SetHandle(img_eyes3, 18,36);
			GRRLIB_DrawTile(272+(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, 11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, miieyes-1); 
			GRRLIB_SetHandle(img_eyes1, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes1, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-(miieyes-1)); 
			GRRLIB_SetHandle(img_eyes2, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes2, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), eyecol[mii.eyeColor], 95-(miieyes-1)); 
			GRRLIB_SetHandle(img_eyes3, 36,36);
			GRRLIB_DrawTile(254-(2.6*mii.eyeHorizSpacing), 184+(2.8*(mii.eyeVertPos)), img_eyes3, -11.25 * (7-mii.eyeRotation), .3+(mii.eyeSize*0.1), .3+(mii.eyeSize*0.1), 0xFFFFFFFF, 95-(miieyes-1));
		}
	}
	
	GRRLIB_SetHandle(img_eyebrows, 0, 54);
	GRRLIB_DrawTile(288+(2.6*mii.eyebrowHorizSpacing), 166+(2.8*(mii.eyebrowVertPos-3)), img_eyebrows, 11.25 * (11-mii.eyebrowRotation), .3+(mii.eyebrowSize*0.1), .3+(mii.eyebrowSize*0.1), haircol[mii.eyebrowColor], eyebrows[mii.eyebrowType]);
	GRRLIB_SetHandle(img_eyebrows, 36, 54);
	GRRLIB_DrawTile(256-(2.6*mii.eyebrowHorizSpacing), 166+(2.8*(mii.eyebrowVertPos-3)), img_eyebrows, -11.25 * (11-mii.eyebrowRotation), .3+(mii.eyebrowSize*0.1), .3+(mii.eyebrowSize*0.1), haircol[mii.eyebrowColor], 53-eyebrows[mii.eyebrowType]);
	
	GRRLIB_SetHandle(img_lips, 30, 30);
	if(miimouth==0) {
		if(lips[mii.lipType]==1 || lips[mii.lipType]==6 || lips[mii.lipType]==11 || lips[mii.lipType]==17 || lips[mii.lipType]==19) {
			GRRLIB_DrawTile(260, 220+(2.6*mii.lipVertPos), img_lips, 0, .2+(mii.lipSize*0.1), .2+(mii.lipSize*0.1), lipcol[mii.lipColor], lips[mii.lipType]);
		}
		else {
			GRRLIB_DrawTile(260, 220+(2.6*mii.lipVertPos), img_lips, 0, .2+(mii.lipSize*0.1), .2+(mii.lipSize*0.1), 0XFFFFFFFF, lips[mii.lipType]);
		}
	}
	else {
		if(miimouth-1==1 || miimouth-1==6 || miimouth-1==11 || miimouth-1==17 || miimouth-1==19) {
			GRRLIB_DrawTile(260, 220+(2.6*mii.lipVertPos), img_lips, 0, .2+(mii.lipSize*0.1), .2+(mii.lipSize*0.1), 0xC76C46FF, miimouth-1);
		}
		else {
			GRRLIB_DrawTile(260, 220+(2.6*mii.lipVertPos), img_lips, 0, .2+(mii.lipSize*0.1), .2+(mii.lipSize*0.1), 0XFFFFFFFF, miimouth-1);
		}
	}
	
	GRRLIB_SetHandle(img_mustache, 30, 10);
	if(mii.mustacheType>0) GRRLIB_DrawTile(260, 244+(2.9*mii.mustacheVertPos), img_mustache, 0, .2+(mii.mustacheSize*0.1), .2+(mii.mustacheSize*0.1), haircol[mii.facialHairColor], mii.mustacheType-1);
	
	GRRLIB_SetHandle(img_noses, 25, 30);
	GRRLIB_DrawTile(265, 220+(2.6*mii.noseVertPos), img_noses, 0, .2+(mii.noseSize*0.1), .2+(mii.noseSize*0.1), skincol[mii.skinColor], noses[mii.noseType]);
		
	if(hairfg[mii.hairType]<56) {
		GRRLIB_DrawTile(230, 190, img_hairs1, 0, -1*(2*mii.hairPart-1), 1, haircol[mii.hairColor], hairfg[mii.hairType]);
	}
	else {
		GRRLIB_DrawTile(230, 190, img_hairs2, 0, -1*(2*mii.hairPart-1), 1, haircol[mii.hairColor], hairfg[mii.hairType]-56);
	}

	if(mii.glassesType > 0) {
		GRRLIB_SetHandle(img_glasses, 90, 32);
		if(mii.glassesType < 6) {
			GRRLIB_DrawTile(200, 195+(2.6*(mii.glassesVertPos)), img_glasses, 0, .1+(mii.glassesSize*0.1), .1+(mii.glassesSize*0.1), glassescol[mii.glassesColor], mii.glassesType-1);
		}
		else {
			GRRLIB_DrawTile(200, 195+(2.6*(mii.glassesVertPos)), img_glasses, 0, .1+(mii.glassesSize*0.1), .1+(mii.glassesSize*0.1), glassescol[mii.glassesColor], mii.glassesType+2);
			GRRLIB_DrawTile(200, 195+(2.6*(mii.glassesVertPos)), img_glasses, 0, .1+(mii.glassesSize*0.1), .1+(mii.glassesSize*0.1), 0xFFFFFFFF, mii.glassesType-1);
		}
	}
	GRRLIB_CompoEnd(200, 160, tex);		// finish the composition and store it as whatever texture was passed to GRRLIB_Build Mii
	strcpy(miinames[miiid], mii.name);
	bodyadjust[miiid] = neck;
}

/**
 * Creates static Mii textures.
 * 
 * This function creates up to 100 empty textures and stores each static Mii into them.
 * It iterates through the available Miis, creates an empty texture for each,
 * and then builds the Mii image into the created texture.
 * 
 * @param None
 * @return None
 */
void GRRLIB_CreateStaticMiis() {		// Create up to 100 empty textures and store each static mii into them.
	u8 i;
	for(i=0; i<NoOfMiis; i++) {
		img_staticmii[i] = GRRLIB_CreateEmptyTexture(180, 200);
		GRRLIB_BuildMii(miis[i], i, 0, 0, 0, img_staticmii[i]);
	}
}
