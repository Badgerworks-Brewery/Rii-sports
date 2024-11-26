/*===========================================
    RenderMii Example
    Code     : mdbrim

    rendermii.cpp
============================================*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <wiiuse/wpad.h>
#include <ogcsys.h>
#include <gccore.h>
#include <math.h>
#include <fat.h>
#include <stdarg.h>

#include <FreeTypeGX.h>
#include <mii.h>							
#include <grrlib.h>

#include "miidraw.h"

#include "pointer_png.h"
#include "arial_rounded_ttf.h"

static FreeTypeGX* arial16;
static GRRLIB_texImg* img_pointer;
static GRRLIB_texImg* img_mii[100];         //This is the placeholder that we will store our built miis into
extern GRRLIB_texImg* img_staticmii[100];   //This is where we will store up to 100 drawn static miis
extern Mii* miis;
extern char miinames[100][11];

int selected[5]={0,0,0,0,0};				//This array is for the number of miis displayed on the screen at the same time.

u32 wpaddown,wpadheld;
ir_t ir1,ir2,ir3;

/**
 * Draws a text string using a TrueType font with a shadow effect.
 * 
 * @param font Pointer to the FreeTypeGX object used for rendering
 * @param xpos The x-coordinate of the text position
 * @param ypos The y-coordinate of the text position
 * @param shadow The offset for the shadow effect
 * @param fgc The foreground color of the text
 * @param bgc The background color (used for the shadow)
 * @param style The style flags for text rendering
 * @param s The format string for the text to be drawn
 * @param ... Variable arguments for the format string
 * @return void
 */
void printf_ttf(FreeTypeGX* font, int xpos, int ypos, int shadow, GXColor fgc, GXColor bgc, u16 style, const char *s, ...) { // custom function i made to draw ttf fonts with a little shaddow effect
	va_list ap;
	char line[200];
	wchar_t line_wchar[200];

	va_start(ap, s);
	vsnprintf(line, 200, s, ap);
	va_end(ap);

	char *src = line;
	wchar_t *dst = line_wchar;
	while((*dst++ = *src++));
	
	font->drawText(xpos+shadow,ypos+shadow,line_wchar, bgc, style);
	font->drawText(xpos, ypos, line_wchar, fgc, style);
}

/**
 * Draws a menu displaying static Mii characters for selection.
 * 
 * This method creates an interactive menu where the user can browse and select
 * from a set of static Mii characters. It handles user input for navigation
 * and selection, and renders the Mii characters on the screen.
 * 
 * @param currentmii The index of the currently selected Mii
 * @return The index of the selected Mii character
 */
int drawthemiis(int currentmii) {  	// Draws the menu that displays all the static mii's for you to pick one.
	int themiis=1;
	int x=-150;
	int y=-150;
	int i=0;
	int j=0;
	int n=0;
	int e=0;
	int selection;
	while(themiis==1) {
		WPAD_SetVRes(0, 640+100, 480+100);
		WPAD_ScanPads();
		wpaddown = WPAD_ButtonsDown(0);
		WPAD_IR(WPAD_CHAN_0, &ir1);
	
		for(i=0;i<15;i++) {																									// draw 16 per page
			n=j*15+i;																											// mii to draw is page number * 15 + i position.
			GRRLIB_Rectangle(90+(i%5*100), 55+((i/5-(i%5)/5)*130), 90, 95, 0x4982B299, true); 								// draw a blue background rect for each mii
			GRRLIB_Rectangle(x,y,90,95,0x00FF00FF,false);    																	// draw a green box around the selected mii
			GRRLIB_Rectangle(x+1,y+1,88,93,0x00FF00FF,false);	  																// draw another green box around first green box to make it thicker
			if(n<NoOfMiis) {	//6 = NoOfMiis
				GRRLIB_DrawImg(80+(i%5*100), 45+((i/5-(i%5)/5)*130), img_staticmii[n], 0, .6, .6, 0xFFFFFFFF);  	// draw the mii
				printf_ttf(arial16, 135+(i%5*100), 165+((i/5-(i%5)/5)*130), 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_CENTER, "%s", miinames[n]);	// display the name
			}
		}
		
		GRRLIB_DrawImg(ir1.x-40, ir1.y-40, img_pointer, ir1.angle, 1, 1, 0xFFFFFFFF);  	// draw the pointer
		GRRLIB_Render();																	// render it all
		
		for(i=0;i<15;i++) {			// now draw all the selection bounds that determines what mii you are on when you click
			if(GRRLIB_PtInRect(90+(i%5*100), 55+((i/5-(i%5)/5)*130), 90, 95, ir1.x-30, ir1.y-40)) {
				x=90+(i%5*100);
				y=55+((i/5-(i%5)/5)*130);
				if(i+15*j<NoOfMiis) { //6 = NoOfMiis
					if(wpaddown & WPAD_BUTTON_A) {		// when you click A
						selection = (i+15*j);			// set selectedmii to the correct mii number (page number*15+i)
						e=1;							// start the leave menu counter
					}
				}
			}
		}
		
		if(wpaddown & WPAD_BUTTON_B) {
			selection = currentmii;						// if you back out, just leave it the original mii.
			e=1;										// start the leave menu counter
		}
		
		if(e>0) e++;									// used to leave the menu and get around the click overlay problem
		if(e>5) {										// caused by clicking A, leaving right away and the that same A
			themiis=0;									// click carrying over to the next screen.
		}
		
		if(((wpaddown & WPAD_BUTTON_RIGHT) || (wpaddown & WPAD_BUTTON_PLUS)) && (j<6)) {
			j++;										// next page
		}
		if(((wpaddown & WPAD_BUTTON_LEFT) || (wpaddown & WPAD_BUTTON_MINUS)) && (j>0)) {
			j--;										// previous page
		}	
		if(wpaddown & WPAD_BUTTON_HOME) {
			exit(0);									// exit the program
		}
	}
	return (selection);
}

/**
 * Initializes the program and sets up various components.
 * 
 * This method performs the following tasks:
 * - Initializes GRRLIB (Graphics Library)
 * - Initializes and loads Mii characters
 * - Loads textures for the pointer and Mii characters
 * - Sets up the font using FreeTypeGX
 * - Initializes the Wiimote and sets its data format
 * 
 * @return void
 */
void initme() {						// sets up our program

	GRRLIB_Init();					// Init GRRLIB

	GRRLIB_MiisInit();				// Init the Miis
	
	GRRLIB_CreateStaticMiis();		// Load all the mii's on your wii into Static images.
	
	img_pointer = GRRLIB_LoadTexture(pointer_png);
	
	for(int i=0; i<NoOfMiis; i++) {	//6 = NoOfMiis // create a bunch of empty textures to be ready to load our Dynamic Miis into
		img_mii[i] = GRRLIB_CreateEmptyTexture(180, 200);
	}
	
	arial16 = new FreeTypeGX();			// Get our font ready
	arial16->loadFont(arial_rounded_ttf, arial_rounded_ttf_size, 16);
	
	WPAD_Init();					// Init the Wiimote
	WPAD_SetDataFormat(WPAD_CHAN_0, WPAD_FMT_BTNS_ACC_IR);
	
}

/**
 * Randomizes the selection of Miis.
 * 
 * This method populates the 'selected' array with random indices
 * representing Miis. It selects 5 random Mii indices from the 
 * available pool of Miis (NoOfMiis).
 * 
 * @param None
 * @return void
 */
void randomizemii() {				// If random mii button is hit, set the Mii array to some random numbers
	for(int i=0; i < 5; i++) {
		selected[i] = rand() % NoOfMiis; //6 = NoOfMiis
	}
}

/**
 * Main function for a Mii customization application.
 * 
 * This function initializes the application, sets up the display, and enters a
 * main loop for user interaction. It allows users to select and customize Mii
 * characters, including changing their facial expressions (eyes and mouth) and
 * randomizing selections. The function handles user input via the Wii Remote,
 * updates the display, and manages the application state.
 * 
 * @return 0 on successful execution and termination of the program
 */
int main() {

	initme();
	randomizemii();
	
	int eyes[100]={0};
	int mouth[100]={0};
    while(1) {
		WPAD_SetVRes(0, 640+100, 480+100);
		WPAD_ScanPads();
		wpaddown = WPAD_ButtonsDown(0);
		WPAD_IR(WPAD_CHAN_0, &ir1);
		
		for(int i=0; i < 5; i++) {		// Build the 5 Dynamic Miis on the screen using the desired parameters (blinking, custom eyes, custom mouth)
			GRRLIB_BuildMii(miis[selected[i]], selected[i], 1, eyes[selected[i]], mouth[selected[i]], img_mii[selected[i]]); 
		}
		
		GRRLIB_FillScreen(0x0000FFFF);												// blue screen
	
		printf_ttf(arial16, 330, 50, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_CENTER, "Click on each face to select Custom Mii");
	
		for(int i=0; i < 5; i++) {		// Draw the 5 Miis after they've been built and stored in the img_mii array.
			GRRLIB_DrawImg(i*120, 100, img_mii[selected[i]], 0, 1, 1, 0xFFFFFFFF);
		}

		GRRLIB_Rectangle(70,285,150,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 80, 300, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "RANDOM HAPPY");
	
		GRRLIB_Rectangle(70,335,150,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 80, 350, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "RANDOM SHOCK");

		GRRLIB_Rectangle(280,285,90,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 290, 300, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "DEFAULT");
		
		GRRLIB_Rectangle(420,285,130,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 430, 300, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "RANDOM SAD");
		
		GRRLIB_Rectangle(420,335,130,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 430, 350, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "RANDOM MAD");

		GRRLIB_Rectangle(260,385,135,20,0xFFFFFFFF,false);
		printf_ttf(arial16, 270, 400, 2, (GXColor){255,255,255,255}, (GXColor){0,0,0,255}, FTGX_JUSTIFY_LEFT, "RANDOM MIIs");
		
		GRRLIB_DrawImg(ir1.x-40, ir1.y-40, img_pointer, ir1.angle, 1, 1, 0xFFFFFFFF);
		
		GRRLIB_Render();

		for(int i=0; i < 5; i++) {  //if click on a Mii Face
			if(GRRLIB_PtInRect(i*120, 100, 120, 160, ir1.x-30, ir1.y-40)) {
				if((wpaddown & WPAD_BUTTON_A)) {
					selected[i] = drawthemiis(selected[i]); //set that face (array value) to the selected Mii number.
				}
			}
		}

		if(GRRLIB_PtInRect(80, 280, 150, 20, ir1.x-30, ir1.y-40)) {  //if click on Random Happy
			if((wpaddown & WPAD_BUTTON_A)) {
				for(int i=0; i < 5; i++) {
					mouth[selected[i]] = MakeMiiHappy(1);	//set the mouth of each of the 5 miis to a random happy
					eyes[selected[i]] = MakeMiiHappy(2);	//set the eyes of each of the 5 miis to a random happy
				}	
			}
		}
		
		if(GRRLIB_PtInRect(80, 330, 150, 20, ir1.x-30, ir1.y-40)) {  //if click on Random Shocked
			if((wpaddown & WPAD_BUTTON_A)) {
				for(int i=0; i < 5; i++) {
					mouth[selected[i]] = MakeMiiShocked(1);
					eyes[selected[i]] = MakeMiiShocked(2);
				}	
			}
		}
		
		if(GRRLIB_PtInRect(290, 280, 90, 20, ir1.x-30, ir1.y-40)) {  //if click on default
			if((wpaddown & WPAD_BUTTON_A)) {						
				for (int i=0; i < 100; i++) {
					eyes[i]=0;					// set eyes to default
					mouth[i]=0;					// set mouths to default
				}
			}
		}
		
		if(GRRLIB_PtInRect(430, 280, 130, 20, ir1.x-30, ir1.y-40)) {  //if click on random Sad
			if((wpaddown & WPAD_BUTTON_A)) {
				for(int i=0; i < 5; i++) {
					mouth[selected[i]] = MakeMiiSad(1);
					eyes[selected[i]] = MakeMiiSad(2);
				}	
			}
		}
		
		if(GRRLIB_PtInRect(430, 330, 130, 20, ir1.x-30, ir1.y-40)) {  //if click on random Mad
			if((wpaddown & WPAD_BUTTON_A)) {
				for(int i=0; i < 5; i++) {
					mouth[selected[i]] = MakeMiiMad(1);
					eyes[selected[i]] = MakeMiiMad(2);
				}	
			}
		}
		
		if(GRRLIB_PtInRect(270, 380, 135, 20, ir1.x-30, ir1.y-40)) {  	//if click on random miis
			if((wpaddown & WPAD_BUTTON_A)) {
				randomizemii();												// randomize the selected array
			}
		}

		if((wpaddown & WPAD_BUTTON_HOME)) {
			exit(0);														// exit
		}
		
    }
	
    return 0;
}
