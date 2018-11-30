
'------------------------------- Animation -------------------------------------

animation: procedure

END

' Player scenes
player_frames_scene:
Data 0, 1, 0, 2

animate_player: procedure 'animation of the snake moving
	
	player_frames = player_dir
	player_frames = player_frames + 1 : IF player_frames >= player_numOfframes THEN player_frames = 0
	player_dir = player_frames

	SPRITE 0, player_posX + HIT + VISIBLE, player_posY + ZOOMY2, SPR01 + (8 * player_frames_scene(player_frames)) + #player_COLOR

	x = (player_posX + 4)/8 - 1: y = (player_posY)/8

	for a = 0 to (player_size)
		player_frames = player_frames + 1 : IF player_frames >= player_numOfframes THEN player_frames = 0

		if player_frames_scene(player_frames) = 0 then
			print at SCREENPOS(x, y + a) color #player_COLOR, "\260"
		elseif player_frames_scene(player_frames) = 1 then
			print at SCREENPOS(x, y + a) color #player_COLOR, "\261"
		elseif player_frames_scene(player_frames) = 2 then
			print at SCREENPOS(x, y + a) color #player_COLOR, "\262"
		end if

		print at SCREENPOS(x+1, y + a) color #player_COLOR, ("\265" + player_frames_scene(player_frames)*8)

	next a

	'SPRITE 1, player_previousPosX + HIT + VISIBLE, player_posY + 8 + ZOOMY2, BG03 + (8 * player_frames_scene(player_frames)) + #player_COLOR
END

animate_explosion: procedure

	explosion_frames = explosion_frames + 1 : IF explosion_frames >= explosion_numOfframes THEN explosion_frames = 0

	SPRITE explosion_SPRITE, explosion_posX + HIT + VISIBLE, explosion_posY + ZOOMY2, SPR07 + (8 * explosion_frames) + #explosion_COLOR
END