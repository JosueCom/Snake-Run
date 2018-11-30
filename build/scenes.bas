
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
		GOSUB settingScene
	ELSE
		currentScene = 0 : GOSUB menuScene
	END IF

	GOSUB animation
END

menuScene: procedure
	
	currentScene = 1 : GOSUB player1Scene
END

player1Scene: procedure
	
	changeSongTo = 1

	GOSUB backgroung_generator
	GOSUB animate_player
	GOSUB animate_explosion
End

player2Scene: procedure

END

endScene: procedure

END

settingScene: procedure

END

transitionScene: procedure
	for a = 0 to 12
		cls

		print at SCREENPOS(17,9), "..."
		print at SCREENPOS(0,9), a

		GOSUB sleep
		wait
	next a
END

introductionScene: procedure
	for a = 0 to 12
		cls
		
		GOSUB animate_player
		
		GOSUB sleep
		wait
	next a
END