' =========================================================================
' IntyBASIC SDK Project: Ultimate Race V. 1
' -------------------------------------------------------------------------
'     Programmer: Josue N Rivera
'     Artist:     Tim Rose
'     Created:    7/1/2018
'     Updated:    7/1/2018
'
' -------------------------------------------------------------------------
' History:
' 7/1/2018 - 'Ultimate Race' project created.
' =========================================================================


INCLUDE "constants.bas"

WAIT
PLAY FULL
WAIT
GOSUB song

'ON FRAME GOSUB song

WAIT
DEFINE DEF01,3,bike_top 'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF04,3,bike_bottom 'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF07,4,explosion
WAIT

CLS
WAIT

'---------------------- variables ---------------------------
'universal
scene = 0
sleep_length = 14

'player has sprites 0 and 1
player_posX = 81
CONST player_posY = 50
player_previousPosX = 81
player_dir = 0
#player_COLOR = STACK_BROWN
player_frames = 0
player_numOfframes = 3

'explotion
explosion_SPRITE = 2
explosion_posX = 40
explosion_posY = 20
#explosion_COLOR = STACK_RED
explosion_frames = 0
explosion_numOfframes = 4


'------------------------- game -----------------------------

MAIN_LOOP:

	IF scene = 0 THEN
		GOSUB scene1
	ELSEIF scene = 1 THEN
		GOSUB scene2
	ELSE
		GOSUB scene3
	END IF

	GOSUB sleep

	WAIT

GOTO MAIN_LOOP


'------------------------ Scenes ----------------------------

scene1: procedure

	GOSUB animate_player
	GOSUB animate_explosion

END

scene2: procedure

END

scene3: procedure

END

'---------------------- Animation ---------------------------

animate_player: procedure

	player_frames = player_frames + 1 : IF player_frames >= player_numOfframes THEN player_frames = 0

	SPRITE 0, player_posX + HIT + VISIBLE, player_posY + ZOOMY2, SPR00 + (8 * player_frames) + #player_COLOR
	SPRITE 1, player_previousPosX + HIT + VISIBLE, player_posY + 8 + ZOOMY2, SPR03 + (8 * player_frames) + #player_COLOR
END

animate_explosion: procedure

	explosion_frames = explosion_frames + 1 : IF explosion_frames >= explosion_numOfframes THEN explosion_frames = 0

	SPRITE explosion_SPRITE, explosion_posX + HIT + VISIBLE, explosion_posY + ZOOMY2, SPR07 + (8 * explosion_frames) + #explosion_COLOR
END

'----------------------- listener ----------------------------

listener: procedure

END

'------------------------ tools ------------------------------

sleep: procedure
	FOR A = 1 TO sleep_length
		WAIT
	NEXT
END

'------------------------- song ------------------------------

song: procedure
	PLAY background1
END

'----------------------- Graphics ----------------------------

bike_top:

'part 1/2 of motorcycle
BITMAP "...#...."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP ".#####.."
BITMAP ".#####.."
BITMAP "..###..."

BITMAP "...#...."
BITMAP "..#.#..."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP "..###..."
BITMAP ".#####.."
BITMAP ".#####.."
BITMAP "..###..."

BITMAP "...#...."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP ".#####.."
BITMAP ".#####.."
BITMAP "..###..."

bike_bottom:

'part 2/2 of motorcycle
BITMAP "..####.."
BITMAP ".####..."
BITMAP "..###..."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP "...#...."

BITMAP ".#####.."
BITMAP "..###..."
BITMAP "..###..."
BITMAP "..###..."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "..#.#..."
BITMAP "...#...."

BITMAP ".####..."
BITMAP "..####.."
BITMAP "..###..."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "..###..."
BITMAP "..#.#..."
BITMAP "...#...."

explosion: 'each stage
BITMAP "........"
BITMAP "..####.."
BITMAP ".##..##."
BITMAP ".#.##.#."
BITMAP ".#.##.#."
BITMAP ".##..##."
BITMAP "..####.."
BITMAP "........"

BITMAP "..####.."
BITMAP "........"
BITMAP "#..##..#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#..##..#"
BITMAP "........"
BITMAP "..####.."

BITMAP ".#....#."
BITMAP "#..##..#"
BITMAP "..#..#.."
BITMAP ".#....#."
BITMAP ".#....#."
BITMAP "..#..#.."
BITMAP "#..##..#"
BITMAP ".#....#."

BITMAP "#..##..#"
BITMAP ".#....#."
BITMAP "........"
BITMAP "#......#"
BITMAP "#......#"
BITMAP "........"
BITMAP ".#....#."
BITMAP "#..##..#"

'-------------------------------- Music Library ---------------------------------------

ASM ORG $2100

background1:
INCLUDE "music\song1.bas"
