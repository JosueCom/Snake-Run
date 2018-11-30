
'--------------------------------- Tools ---------------------------------------

sleep: procedure
	IF not(currentSleep_length = changeSleep_lengthTo) THEN

		IF changeSleep_lengthTo > 10 THEN
			 changeSleep_lengthTo = 10
		ELSEIF  changeSleep_lengthTo < 0 THEN
			 changeSleep_lengthTo = 0
		END IF

		currentSleep_length = changeSleep_lengthTo
	END IF

	FOR A = 1 TO (currentSleep_length * sleep_interval)
		WAIT
	NEXT

End