' ==============================================================================
' IntyBASIC SDK Project: Ultimate Race V. 1
' ------------------------------------------------------------------------------
'     Programmer: Josue N Rivera
'     Artist:     Tim Rose
'     Created:    7/1/2018
'     Updated:    8/18/2018
'
' ------------------------------------------------------------------------------
' History:
' 7/1/2018 - 'Ultimate Race' project created;
' 8/12/2018 - Song System created; changed the code structure;
' 8/18/2018 - Game System Created;
' ==============================================================================


INCLUDE "constants.bas"

DEF FN resetCard(number) = PRINT AT number, " "

PLAY FULL NO DRUMS
WAIT
PLAY VOLUME 7
WAIT

DEFINE DEF01,3,snake_top                                                         'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF04,3,snake_bottom                                                      'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF07,4,explosion
WAIT
DEFINE DEF11,6,explosion
WAIT

CLS
WAIT

'-------------------------------- Variables ------------------------------------

INCLUDE "build/variables.bas"

'-------------------------------- Game Play ------------------------------------

GOSUB song
GOSUB IntroductionScene
GOSUB transitionScene

MAIN_LOOP:
	CLS
	
	GOSUB song
	GOSUB listener
	GOSUB scene
	GOSUB sleep                                                                 'helps stabilize the animation rate

	WAIT

GOTO MAIN_LOOP

'--------------------------------- Scenes --------------------------------------

INCLUDE "build/scenes.bas"

'------------------------------- Background ------------------------------------

INCLUDE "build/background.bas"

'------------------------------- Animation -------------------------------------

INCLUDE "build/animation.bas"

'-------------------------------- Listener -------------------------------------

INCLUDE "build/listener.bas"

'--------------------------------- Tools ---------------------------------------

INCLUDE "build/tools.bas"

'---------------------------------- Song ---------------------------------------

INCLUDE "build/music_sys.bas"

'-------------------------------- Graphics -------------------------------------

ASM ORG $F000

INCLUDE "build/graphics.bas"


'---------------------------------- Maps ---------------------------------------

map1: 'map 1
INCLUDE "maps/stage1.bas"

'------------------------------ Music Library ----------------------------------

ASM ORG $D000

background1: 'song 1
INCLUDE "music/background1.bas"
