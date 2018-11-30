
'----------------------------------- Song --------------------------------------

' Songs Library:
'   0 - No Music
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