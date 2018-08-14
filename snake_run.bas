' ==============================================================================
' IntyBASIC SDK Project: Ultimate Race V. 1
' ------------------------------------------------------------------------------
'     Programmer: Josue N Rivera
'     Artist:     Tim Rose
'     Created:    7/1/2018
'     Updated:    8/12/2018
'
' ------------------------------------------------------------------------------
' History:
' 7/1/2018 - 'Ultimate Race' project created;
' 8/12/2017 - Song System created; changed the code structure;
' ==============================================================================


INCLUDE "constants.bas"

DEF FN findCard(row, col) = (row * 20 + col)
DEF FN resetCard(number) = PRINT AT number, " "

PLAY FULL NO DRUMS
WAIT
PLAY VOLUME 7
WAIT

DEFINE DEF01,3,bike_top                                                         'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF04,3,bike_bottom                                                      'sprite 0 and 1 are used to represent player
WAIT
DEFINE DEF07,4,explosion
WAIT

CLS
WAIT

'-------------------------------- Variables ------------------------------------
'universal
currentScene = 0
currentBackgroung = 0
currentVolume = 7
changeVolumeTo = 7
changeSongTo = 0
currentSong = 0
sleep_length = 12

'animation
DIM currentAnimation(2)
DIM changeAnimationTo(2)

'player has sprites 0 and 1
player_posX = 81
CONST player_posY = 50
player_previousPosX = 81
player_dir = 0 																							                    '0 = left, 1 = right
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


'---------------------------------- Game ---------------------------------------

MAIN_LOOP:

	GOSUB song
	GOSUB listener
	GOSUB scene
	GOSUB sleep 'helps stabilize the animation rate

	WAIT

GOTO MAIN_LOOP

'--------------------------------- Scenes --------------------------------------

scene: procedure

	IF currentScene = 0 THEN
		GOSUB menuScene
	ELSEIF currentScene = 1 THEN
		GOSUB player1Scene
	ELSEIF currentScene = 2 THEN
		GOSUB player2Scene
	ELSEIF currentScene = 3 THEN
		GOSUB endScene
	ELSEIF currentScene = 4 THEN
		GOSUB optionScene
	ELSE
		currentScene = 0 : GOSUB menuScene
	END IF

	GOSUB backgroung_generator
	GOSUB animation
END

menuScene: procedure
	changeSongTo = 1

	GOSUB animate_player
	GOSUB animate_explosion

END

player1Scene: procedure

END

player2Scene: procedure

END

endScene: procedure

END

settingScene: procedure

END

'-------------------------- Background Generator -------------------------------

backgroung_generator: procedure

END

'------------------------------- Animation -------------------------------------

animation: procedure

END

animate_player: procedure

	player_frames = player_frames + 1 : IF player_frames >= player_numOfframes THEN player_frames = 0

	SPRITE 0, player_posX + HIT + VISIBLE, player_posY + ZOOMY2, SPR00 + (8 * player_frames) + #player_COLOR
	SPRITE 1, player_previousPosX + HIT + VISIBLE, player_posY + 8 + ZOOMY2, SPR03 + (8 * player_frames) + #player_COLOR
END

animate_explosion: procedure

	explosion_frames = explosion_frames + 1 : IF explosion_frames >= explosion_numOfframes THEN explosion_frames = 0

	SPRITE explosion_SPRITE, explosion_posX + HIT + VISIBLE, explosion_posY + ZOOMY2, SPR07 + (8 * explosion_frames) + #explosion_COLOR
END

'--------------------------------- Listener ------------------------------------

listener: procedure

END

'---------------------------------- Tools --------------------------------------

sleep: procedure
	FOR A = 1 TO sleep_length
		WAIT
	NEXT
END

'----------------------------------- Song --------------------------------------

' Songs Library:
'		0 - No Music
' 	1 - Background 1

song: procedure
	GOSUB updateSong
	GOSUB updateVolume
END

updateSong: procedure

	IF not(currentSong = changeSongTo) THEN

		IF changeSongTo = 0 THEN
			Play OFF
		ELSEIF changeSongTo = 1 THEN
			PLAY background1
			SOUND 4,,$38
		END IF

		WAIT
		currentSong = changeSongTo
	END IF

END

updateVolume: procedure

	IF not(currentVolume = changeVolumeTo) THEN

		IF changeVolumeTo = 0 THEN
			PLAY VOLUME 0
		ELSEIF changeVolumeTo = 1 THEN
			PLAY VOLUME 3
		ELSEIF changeVolumeTo = 2 THEN
			PLAY VOLUME 6
		ELSEIF changeVolumeTo = 3 THEN
			PLAY VOLUME 9
		ELSEIF changeVolumeTo = 4 THEN
			PLAY VOLUME 12
		ELSE
			PLAY VOLUME 15
		END IF

		WAIT
		currentVolume = changeVolumeTo
	END IF

END

'---------------------------------- Graphics -----------------------------------

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

'-------------------------------- Music Library --------------------------------

ASM ORG $D000

background1: 'song 1
INCLUDE "music/song1.bas"
