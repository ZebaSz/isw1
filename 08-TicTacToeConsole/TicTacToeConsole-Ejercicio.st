!classDefinition: #TicTacToeConsoleTest category: #'TicTacToeConsole-Ejercicio'!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:01:34'!
assertLines: aCollectionOfLines match: expectedLines
	aCollectionOfLines with: expectedLines do: [ :actual :expected | self assert: actual equals: expected ]! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 13:19:50'!
test01OutputIsCleanOnNewGame
	| game console |
	game := TicTacToe new.
	console := TicTacToeConsole with: game.
	
	self assert: (console lines isEmpty).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:18:38'!
test02OutputContainsMarksAndStateAfterFirstPlay
	| game console |
	game := TicTacToe new.
	console := TicTacToeConsole with: game.
	
	game putXAt: 1@1.
	
	self
		assertLines: (console lines)
		match: #(
			'X marcó en 1@1'
			'Estado: Jugando O'
		).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:05:47'!
test03OutputContainsMarksAndStateAfterSecondPlay
	| game console |
	game := TicTacToe new.
	console := TicTacToeConsole with: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self
		assertLines: (console lines)
		match: #(
			'X marcó en 1@1'
			'Estado: Jugando O'
			'O marcó en 2@2'
			'Estado: Jugando X'
		).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:05:54'!
test04OutputContainsMarksAndStateUntilXVictory
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole with: game.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 1 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 3.
	
	self
		assertLines: (console lines)
		match: #(
			'X marcó en 1@1'
			'Estado: Jugando O'
			'O marcó en 2@2'
			'Estado: Jugando X'
			'X marcó en 1@2'
			'Estado: Jugando O'
			'O marcó en 2@3'
			'Estado: Jugando X'
			'X marcó en 1@3'
			'Estado: Juego Terminado - Ganó X!!'
		).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:07:05'!
test05OutputContainsMarksAndStateUntilOVictory
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole with: game.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	game putOAt: 2 @ 3.
	
	self
		assertLines: (console lines)
		match: #(
			'X marcó en 1@1'
			'Estado: Jugando O'
			'O marcó en 2@1'
			'Estado: Jugando X'
			'X marcó en 1@2'
			'Estado: Jugando O'
			'O marcó en 2@2'
			'Estado: Jugando X'
			'X marcó en 3@3'
			'Estado: Jugando O'
			'O marcó en 2@3'
			'Estado: Juego Terminado - Ganó O!!'
		).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:09:19'!
test05OutputContainsMarksAndStateUntilTie
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole with: game.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 2.
	game putXAt: 3 @ 3.
	
	
	self
		assertLines: (console lines)
		match: #(
			'X marcó en 2@2'
			'Estado: Jugando O'
			'O marcó en 1@1'
			'Estado: Jugando X'
			'X marcó en 1@3'
			'Estado: Jugando O'
			'O marcó en 3@1'
			'Estado: Jugando X'
			'X marcó en 2@1'
			'Estado: Jugando O'
			'O marcó en 2@3'
			'Estado: Jugando X'
			'X marcó en 1@2'
			'Estado: Jugando O'
			'O marcó en 3@2'
			'Estado: Jugando X'
			'X marcó en 3@3'
			'Estado: Juego Terminado - Empate!!'
		).! !

!TicTacToeConsoleTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:10:01'!
test06OutputDoesNotChangeIfErrorOccurs
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole with: game.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	
	self assert: (console lines size) equals: 8.
	
	self
		should: [ game putOAt: 1@2 ]
	 	raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self assert: (console lines size) equals: 8.
		]! !


!classDefinition: #TicTacToeTest category: #'TicTacToeConsole-Ejercicio'!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:09:48'!
test01NewGameIsEmpty
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:10:24'!
test02PuttingAnXAtAValidPositionAddsItToTheBoard
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:11:03'!
test03PuttingAnXAndAnOAtAValidsPositionsAddsBothToTheBoard
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:11:35'!
test04CantPutAnXWhenItsOsTurn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:11:55'!
test05CantPutAnOWhenItsXsTurn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notOTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:13:24'!
test06CantPutAnXAtAPositionWithAnX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:13:08'!
test07CantPutAnXAtAPositionWithAnO
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:13:48'!
test08CantPutAnOAtAPositionWithAnX
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	self
		should: [ game putOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:14:10'!
test09CantPutAnOAtAPositonWithAnO
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	self
		should: [ game putOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:14:57'!
test10ThereAreNoWinnersIfTheGameIsntOver
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 3.
	self deny: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:17:49'!
test11XWinsIfHeOccupiesEntireFirstRow
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 3.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:18:03'!
test12XWinsIfHeOccupiesEntireSecondRow
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:18:15'!
test13XWinsIfHeOccupiesEntireThirdRow
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:18:27'!
test14XWinsIfHeOccupiesEntireFirstColumn
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:19:20'!
test15XWinsIfHeOccupiesEntireDownwardDiagonal
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:20:39'!
test16XWinsIfHeOccupiesEntireUpwardDiagonal
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:21:22'!
test17OWinsIfHeOccupiesEntireFirstColumn
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 3.
	game putOAt: 1 @ 3.
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:22:25'!
test18CantPutAnOAfterGameIsOver
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self
		should: [ game putOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:22:47'!
test19CantPutAnXAfterGameIsOver
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self
		should: [ game putXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:23:09'!
test20GameEndsInTieAfterNineTurns
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 2.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/31/2018 16:23:36'!
test21XCanWinOnFullBoard
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 5/29/2018 19:19:33'!
test22PositionsAreRestrictedTo3By3
	| game |
	game _ TicTacToe new.
	self
		should: [game putXAt: 4@1]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutOfBoundsErrorMessage equals: anError messageText.	
			self assert: game Xs isEmpty.
			self assert: game Os isEmpty.
		].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 13:08:33'!
test23CanRegisterToGameStateChanges
	| game notified |
	notified := false.
	game := TicTacToe new.
	
	game observeState: [ :state |
		notified := true.
		self assert: (state isKindOf: OTurnState).
	].

	game putXAt: 1@1.
	self assert: notified.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:16:39'!
test24LastPlayIsNilOnStart
	| game |
	game := TicTacToe new.
	self assert: game lastPlay isNil.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'SAS 6/4/2018 15:17:40'!
test25LastPlayReturnsLastMarkedPosition
	| game position |
	game := TicTacToe new.
	position := 1@1.
	
	game putXAt: position.
	
	self assert: (game lastPlay) equals: position.! !


!classDefinition: #TicTacToeViewTest category: #'TicTacToeConsole-Ejercicio'!
TestCase subclass: #TicTacToeViewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeViewTest methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:04:13'!
test01OutputContainsAnEmptyTableOnNewGame
	| game view |
	game := TicTacToe new.
	view := TicTacToeView with: game.
	
	self assert: (view lines at:1) equals: ' | | '.
	self assert: (view lines at:2) equals: '-----'.
	self assert: (view lines at:3) equals: ' | | '.
	self assert: (view lines at:4) equals: '-----'.
	self assert: (view lines at:5) equals: ' | | '.
	self assert: (view lines at:6) equals: 'Playing X'.! !

!TicTacToeViewTest methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:07:40'!
test02OutputContainsMarksAndStateAfterFirstPlay
	| game view |
	game := TicTacToe new.
	view := TicTacToeView with: game.
	
	game putXAt: 1@1.
	
	self assert: (view lines at:1) equals: 'X| | '.
	self assert: (view lines at:2) equals: '-----'.
	self assert: (view lines at:3) equals: ' | | '.
	self assert: (view lines at:4) equals: '-----'.
	self assert: (view lines at:5) equals: ' | | '.
	self assert: (view lines at:6) equals: 'Playing O'.! !

!TicTacToeViewTest methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:12:00'!
test03OutputContainsMarksAndStateAfterSecondPlay
	| game view |
	game := TicTacToe new.
	view := TicTacToeView with: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: (view lines at:1) equals: 'X| | '.
	self assert: (view lines at:2) equals: '-----'.
	self assert: (view lines at:3) equals: ' |O| '.
	self assert: (view lines at:4) equals: '-----'.
	self assert: (view lines at:5) equals: ' | | '.
	self assert: (view lines at:6) equals: 'Playing X'.! !

!TicTacToeViewTest methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:15:11'!
test04OutputContainsMarksAndStateUntilXVictory
	| game view |
	game := TicTacToe new.
	view := TicTacToeView with: game.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 1@2.
	game putOAt: 3@2.
	game putXAt: 1@3.
	self assert: (view lines at:1) equals: 'X|X|X'.
	self assert: (view lines at:2) equals: '-----'.
	self assert: (view lines at:3) equals: ' |O| '.
	self assert: (view lines at:4) equals: '-----'.
	self assert: (view lines at:5) equals: ' |O| '.
	self assert: (view lines at:6) equals: 'X Won!!'.! !


!classDefinition: #Observable category: #'TicTacToeConsole-Ejercicio'!
Object subclass: #Observable
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!Observable methodsFor: 'as yet unclassified' stamp: 'SAS 6/4/2018 12:59:57'!
changeTo: aNewValue
	value := aNewValue.
	self notifyObservers.! !

!Observable methodsFor: 'as yet unclassified' stamp: 'SAS 6/4/2018 13:13:58'!
doesNotUnderstand: aMessage
	^aMessage sendTo: value.! !

!Observable methodsFor: 'as yet unclassified' stamp: 'SAS 6/4/2018 13:08:45'!
notifyObservers
	observers do: [ :obs | obs value: value ].! !

!Observable methodsFor: 'as yet unclassified' stamp: 'SAS 6/4/2018 14:26:15'!
register: anObserver
	observers add: anObserver.! !


!Observable methodsFor: 'initialization' stamp: 'SAS 6/4/2018 13:02:44'!
initializeWith: aValue
	value := aValue.
	observers := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Observable class' category: #'TicTacToeConsole-Ejercicio'!
Observable class
	instanceVariableNames: ''!

!Observable class methodsFor: 'as yet unclassified' stamp: 'SAS 6/4/2018 13:03:15'!
with: aValue
	^self new initializeWith: aValue.! !


!classDefinition: #TicTacToe category: #'TicTacToeConsole-Ejercicio'!
Object subclass: #TicTacToe
	instanceVariableNames: 'xs os state lastPlay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToe methodsFor: 'accessing' stamp: 'SAS 5/29/2018 19:20:29'!
Os
	^os copy.! !

!TicTacToe methodsFor: 'accessing' stamp: 'SAS 6/4/2018 13:46:05'!
Xs
	^xs copy.! !

!TicTacToe methodsFor: 'accessing' stamp: 'SAS 6/4/2018 15:12:07'!
lastPlay
	^lastPlay.! !


!TicTacToe methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 20:31:53'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 20:31:53'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 20:31:53'!
isOver
	^ state isOver.! !

!TicTacToe methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 20:31:53'!
isTied
	^ state isTied.! !


!TicTacToe methodsFor: 'initialization' stamp: 'SAS 6/4/2018 13:10:54'!
initialize
	state _ Observable with: (XTurnState for: self).
	xs _ OrderedCollection new.
	os _ OrderedCollection new.! !


!TicTacToe methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:31:53'!
putOAt: aPosition
	state putOAt: aPosition.! !

!TicTacToe methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:31:53'!
putXAt: aPosition
	state putXAt: aPosition.! !


!TicTacToe methodsFor: 'observing' stamp: 'SAS 6/4/2018 14:26:15'!
observeState: aStateObserver
	state register: aStateObserver.! !


!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/29/2018 19:24:45'!
checkBoundsFor: aPosition
	((aPosition x < 4) and: [aPosition y < 4]) ifFalse: [ self error: self class positionOutOfBoundsErrorMessage ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/29/2018 19:24:39'!
checkNoMarkAt: aPosition
	((xs includes: aPosition) or: [os includes: aPosition]) ifTrue: [ self error: self class positionTakenErrorMessage ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/29/2018 19:22:25'!
checkPosition: aPosition
	self checkBoundsFor: aPosition.
	self checkNoMarkAt: aPosition.! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/28/2018 20:48:24'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/28/2018 20:48:17'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/28/2018 20:47:57'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/28/2018 20:47:41'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'private - board checking' stamp: 'SAS 5/28/2018 20:47:23'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]
! !


!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 6/4/2018 15:13:29'!
putODuringOTurnAt: aPosition
	self checkPosition: aPosition.
	os add: aPosition.
	lastPlay := aPosition.
	(self hasWin: os)
		ifTrue: [ state changeTo: (OWinState for: self) ]
		ifFalse: [ state changeTo: (XTurnState for: self) ].! !

!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 5/29/2018 20:04:16'!
putODuringXTurnAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 5/29/2018 19:58:23'!
putOWhileGameIsOverAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage.! !

!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 5/29/2018 20:04:24'!
putXDuringOTurnAt: aPosition
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 6/4/2018 15:13:33'!
putXDuringXTurnAt: aPosition
	self checkPosition: aPosition.
	xs add: aPosition.
	lastPlay := aPosition.
	(self hasWin: xs)
		ifTrue: [ state changeTo: (XWinState for: self) ]
		ifFalse: [
			xs size = 5
				ifTrue: [ state changeTo: (TiedState for: self) ]
				ifFalse: [ state changeTo: (OTurnState for: self) ]].! !

!TicTacToe methodsFor: 'private - state dispatch' stamp: 'SAS 5/29/2018 19:58:29'!
putXWhileGameIsOverAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #'TicTacToeConsole-Ejercicio'!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:50:57'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:11:58'!
positionOutOfBoundsErrorMessage
	^'Position is out of bounds'.! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeObserver category: #'TicTacToeConsole-Ejercicio'!
Object subclass: #TicTacToeObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeObserver methodsFor: 'observing' stamp: 'SAS 6/4/2018 14:39:34'!
value: aNewValue
	self subclassResponsibility.! !


!TicTacToeObserver methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:41:43'!
visitOTurnState: anOTurnState
	self subclassResponsibility.! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:42:06'!
visitOWinState: anOWinState
	self subclassResponsibility.! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:42:15'!
visitTiedState: anTiedState
	self subclassResponsibility.! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:41:50'!
visitXTurnState: anXTurnState
	self subclassResponsibility.! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:41:57'!
visitXWinState: anXWinState
	self subclassResponsibility.! !


!classDefinition: #TicTacToeConsole category: #'TicTacToeConsole-Ejercicio'!
TicTacToeObserver subclass: #TicTacToeConsole
	instanceVariableNames: 'game lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeConsole methodsFor: 'accessing' stamp: 'SAS 6/4/2018 13:46:18'!
lines
	^lines copy.! !


!TicTacToeConsole methodsFor: 'initialization' stamp: 'SAS 6/4/2018 15:21:47'!
initializeWith: aTicTacToe 
	game := aTicTacToe.
	game observeState: self.
	lines := OrderedCollection new.! !


!TicTacToeConsole methodsFor: 'observing' stamp: 'SAS 6/4/2018 13:37:55'!
value: aTicTacToeState
	aTicTacToeState accept: self! !


!TicTacToeConsole methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:52:22'!
visitOTurnState: anOTurnState
	self registerLastXTurn.
	lines add: 'Estado: Jugando O'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:58:53'!
visitOWinState: anOWinState
	self registerLastOTurn.
	self registerVictoryBy: 'O'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:09:44'!
visitTiedState: aTiedState 
	self registerLastXTurn.
	self registerTie.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:51:58'!
visitXTurnState: aXTurnState
	self registerLastOTurn.
	lines add: 'Estado: Jugando X'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:58:32'!
visitXWinState: aXWinState
	self registerLastXTurn.
	self registerVictoryBy: 'X'.! !


!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 14:02:16'!
registerEndState: anEndStateMessage
	self registerNextState: ('Juego Terminado - ', anEndStateMessage).! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 15:14:55'!
registerLastMarkBy: aPlayer
	lines add: (aPlayer, ' marcó en ', game lastPlay printString).! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 15:15:04'!
registerLastOTurn
	self registerLastMarkBy: 'O'.! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 15:15:14'!
registerLastXTurn
	self registerLastMarkBy: 'X'.! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 14:01:44'!
registerNextState: anStateMessage
	lines add: ('Estado: ', anStateMessage).! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 14:04:51'!
registerTie
	self registerEndState: 'Empate!!'.! !

!TicTacToeConsole methodsFor: 'private - printing' stamp: 'SAS 6/4/2018 14:04:29'!
registerVictoryBy: aPlayer
	self registerEndState: ('Ganó ',aPlayer,'!!').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeConsole class' category: #'TicTacToeConsole-Ejercicio'!
TicTacToeConsole class
	instanceVariableNames: ''!

!TicTacToeConsole class methodsFor: 'instance creation' stamp: 'SAS 6/4/2018 13:23:21'!
with: aTicTacToe 
	^self new initializeWith: aTicTacToe.! !


!classDefinition: #TicTacToeView category: #'TicTacToeConsole-Ejercicio'!
TicTacToeObserver subclass: #TicTacToeView
	instanceVariableNames: 'game lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 15:56:06'!
gameStatus
	^ 'Playing X'! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 15:47:45'!
gameTableRow: aRowNumber
	^ ' | | '! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:05:43'!
initializeWith: aTicTacToe 
	game := aTicTacToe.
	game observeState: self.
	lines := OrderedCollection new.
	lines add: (self gameTableRow: 1).
	lines add: (self rowSeparatorLine).
	lines add: (self gameTableRow: 2).
	lines add: (self rowSeparatorLine).
	lines add: (self gameTableRow: 3).
	lines add: ('Playing X').! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 15:58:47'!
lines
	^lines copy.! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:16:51'!
printGameTable
	lines at: 1 put: (self gameTableRow: 1).
	lines at: 2 put: (self rowSeparatorLine).
	lines at: 3 put: (self gameTableRow: 2).
	lines at: 4 put: (self rowSeparatorLine).
	lines at: 5 put: (self gameTableRow: 3).! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 15:44:34'!
rowSeparatorLine
	^ '-----'! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 15:59:30'!
value: aTicTacToeState
	aTicTacToeState accept: self! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:17:03'!
visitOTurnState: aXTurnState
	self lines at:6 put: 'Playing O'.! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:17:07'!
visitXTurnState: aXTurnState
	self lines at:6 put: 'Playing X'.! !

!TicTacToeView methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:16:01'!
visitXWinState: aXWinState
	self lines at:6 put: 'Playing X'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeView class' category: #'TicTacToeConsole-Ejercicio'!
TicTacToeView class
	instanceVariableNames: ''!

!TicTacToeView class methodsFor: 'as yet unclassified' stamp: 'IT 6/4/2018 16:03:47'!
with: aTicTacToe 
	^self new initializeWith: aTicTacToe.! !


!classDefinition: #TicTacToeState category: #'TicTacToeConsole-Ejercicio'!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TicTacToeState methodsFor: 'evaluating' stamp: 'SAS 5/28/2018 20:56:00'!
hasPlayerOWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'evaluating' stamp: 'SAS 5/28/2018 20:55:58'!
hasPlayerXWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:16'!
isOver
	^self subclassResponsibility! !

!TicTacToeState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:43:27'!
isTied
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'SAS 5/29/2018 08:34:56'!
initializeFor: aTicTacToe
	game := aTicTacToe. ! !


!TicTacToeState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 08:16:50'!
putOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 08:16:37'!
putXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:26:41'!
accept: aStateVisitor 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:34:18'!
for: aTicTacToe
	^self new initializeFor: aTicTacToe! !


!classDefinition: #OTurnState category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState subclass: #OTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!OTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:24:41'!
hasPlayerOWon
	^false! !

!OTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:24:45'!
hasPlayerXWon
	^false! !

!OTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:27'!
isOver
	^false! !

!OTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:44:41'!
isTied
	^false! !


!OTurnState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:00:14'!
putOAt: aPosition
	game putODuringOTurnAt: aPosition.! !

!OTurnState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:04:46'!
putXAt: aPosition
	game putXDuringOTurnAt: aPosition.! !


!OTurnState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:39:45'!
accept: aStateVisitor 
	aStateVisitor visitOTurnState: self.! !


!classDefinition: #OWinState category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState subclass: #OWinState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!OWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:25:50'!
hasPlayerOWon
	^true! !

!OWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:25:54'!
hasPlayerXWon
	^false! !

!OWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:52'!
isOver
	^true! !

!OWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:44:44'!
isTied
	^false! !


!OWinState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:56:59'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!OWinState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:57:05'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !


!OWinState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:56:15'!
accept: aStateVisitor 
	aStateVisitor visitOWinState: self.! !


!classDefinition: #TiedState category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState subclass: #TiedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!TiedState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:25:37'!
hasPlayerOWon
	^false! !

!TiedState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:25:41'!
hasPlayerXWon
	^false! !

!TiedState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:43'!
isOver
	^true! !

!TiedState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:44:49'!
isTied
	^true! !


!TiedState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:56:51'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!TiedState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:56:43'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !


!TiedState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 14:09:25'!
accept: aStateVisitor
	aStateVisitor visitTiedState: self.! !


!classDefinition: #XTurnState category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState subclass: #XTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!XTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:24:57'!
hasPlayerOWon
	^false! !

!XTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:25:00'!
hasPlayerXWon
	^false! !

!XTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:39'!
isOver
	^false! !

!XTurnState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:44:35'!
isTied
	^false! !


!XTurnState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:05:04'!
putOAt: aPosition
	game putODuringXTurnAt: aPosition.! !

!XTurnState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 20:05:28'!
putXAt: aPosition
	game putXDuringXTurnAt: aPosition.! !


!XTurnState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:47:29'!
accept: aStateVisitor
	aStateVisitor visitXTurnState: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XTurnState class' category: #'TicTacToeConsole-Ejercicio'!
XTurnState class
	instanceVariableNames: ''!

!XTurnState class methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:35:27'!
for: aTicTacToe
	^self new initializeFor: aTicTacToe.! !


!classDefinition: #XWinState category: #'TicTacToeConsole-Ejercicio'!
TicTacToeState subclass: #XWinState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToeConsole-Ejercicio'!

!XWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:26:05'!
hasPlayerOWon
	^false! !

!XWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:26:08'!
hasPlayerXWon
	^true! !

!XWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:42:33'!
isOver
	^true! !

!XWinState methodsFor: 'evaluating' stamp: 'SAS 5/29/2018 08:51:57'!
isTied
	^false.! !


!XWinState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:57:22'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!XWinState methodsFor: 'modifying' stamp: 'SAS 5/29/2018 19:57:20'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !


!XWinState methodsFor: 'visiting' stamp: 'SAS 6/4/2018 13:51:00'!
accept: aStateVisitor 
	aStateVisitor visitXWinState: self.! !
