
'-------------------------------- Variables ------------------------------------

'universal
currentScene = 0
currentBackgroung = 0
currentVolume = 7
changeVolumeTo = 7
changeSongTo = 1
currentSong = 0
CONST sleep_interval = 3
currentSleep_length = 5
changeSleep_lengthTo = 4

'animation
DIM currentAnimation(2)
DIM changeAnimationTo(2)

'players has sprites 0 and 1
player_posX = 81
CONST player_posY = 64
player_dir = 0														             '0 = left, 1 = right
#player_COLOR = STACK_white
player_frames = 0
player_numOfframes = 4
player_size = 3

'explotion
explosion_SPRITE = 2
explosion_posX = 40
explosion_posY = 20
#explosion_COLOR = STACK_RED
explosion_frames = 0
explosion_numOfframes = 4

'enviorment
DIM current_map(10)
player1_map = 0
player2_map = 0
player1_collision = 0
player2_collision = 0