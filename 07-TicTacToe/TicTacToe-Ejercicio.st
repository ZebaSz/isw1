!classDefinition: #TicTacToeTest category: #'TicTacToe-Ejercicio'!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 09:59:04'!
test01

	|game|
	
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:20:33'!
test02

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: game Os isEmpty.
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:50:55'!
test03

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:01:26'!
test04

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: game Os isEmpty.
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:45:22'!
test05

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:18:20'!
test06

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:37:38'!
test07

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:45:04'!
test08

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	self
	should: [game putOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert:  game Os isEmpty.

		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:12:12'!
test09

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 3@3.
	self
	should: [game putOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: (game Xs includes: 3@3).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test10
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 3.
	self deny: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test11
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 3.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test12
	| game |
	game _ TicTacToe new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test13
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test14
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test15
	| game |
	game _ TicTacToe new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 3.
	game putXAt: 3 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test16
	| game |
	game _ TicTacToe new.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 1 @ 3.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test17
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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:12'!
test18

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:22:51'!
test19

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test20
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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:10:37'!
test21
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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:19:33'!
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


!classDefinition: #TicTacToe category: #'TicTacToe-Ejercicio'!
Object subclass: #TicTacToe
	instanceVariableNames: 'xs os state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:20:29'!
Os
	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:20:38'!
Xs
	^xs.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:24:45'!
checkBoundsFor: aPosition
	((aPosition x < 4) and: [aPosition y < 4]) ifFalse: [ self error: self class positionOutOfBoundsErrorMessage ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:24:39'!
checkNoMarkAt: aPosition
	((xs includes: aPosition) or: [os includes: aPosition]) ifTrue: [ self error: self class positionTakenErrorMessage ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:22:25'!
checkPosition: aPosition
	self checkBoundsFor: aPosition.
	self checkNoMarkAt: aPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:48:24'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:48:17'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:47:57'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:47:41'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:47:23'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:33:38'!
initialize
	state _ XTurnState for: self.
	xs _ OrderedCollection new.
	os _ OrderedCollection new.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
isOver
	^ state isOver.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
isTied
	^ state isTied.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
putOAt: aPosition
	state putOAt: aPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:33:15'!
putODuringOTurnAt: aPosition
	self checkPosition: aPosition.
	os add: aPosition.
	(self hasWin: os)
		ifTrue: [ state _ OWinState for: self ]
		ifFalse: [ state _ XTurnState for: self ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:04:16'!
putODuringXTurnAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:58:23'!
putOWhileGameIsOverAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:31:53'!
putXAt: aPosition
	state putXAt: aPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:04:24'!
putXDuringOTurnAt: aPosition
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:32:27'!
putXDuringXTurnAt: aPosition
	self checkPosition: aPosition.
	xs add: aPosition.
	(self hasWin: xs)
		ifTrue: [ state _ XWinState for: self ]
		ifFalse: [
			xs size = 5
				ifTrue: [ state _ TiedState for: self ]
				ifFalse: [ state _ OTurnState for: self ]].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:58:29'!
putXWhileGameIsOverAt: aPosition
	self error: self class canNotPlayWhenGameIsOverErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #'TicTacToe-Ejercicio'!
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


!classDefinition: #TicTacToeState category: #'TicTacToe-Ejercicio'!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:56:00'!
hasPlayerOWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/28/2018 20:55:58'!
hasPlayerXWon
	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:34:56'!
initializeFor: aTicTacToe
	game := aTicTacToe. ! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:16'!
isOver
	^self subclassResponsibility! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:43:27'!
isTied
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:16:50'!
putOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:16:37'!
putXAt: aPosition
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #'TicTacToe-Ejercicio'!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:34:18'!
for: aTicTacToe
	^self new initializeFor: aTicTacToe! !


!classDefinition: #OTurnState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #OTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:24:41'!
hasPlayerOWon
	^false! !

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:24:45'!
hasPlayerXWon
	^false! !

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:27'!
isOver
	^false! !

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:44:41'!
isTied
	^false! !

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:00:14'!
putOAt: aPosition
	game putODuringOTurnAt: aPosition.! !

!OTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:04:46'!
putXAt: aPosition
	game putXDuringOTurnAt: aPosition.! !


!classDefinition: #OWinState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #OWinState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:25:50'!
hasPlayerOWon
	^true! !

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:25:54'!
hasPlayerXWon
	^false! !

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:52'!
isOver
	^true! !

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:44:44'!
isTied
	^false! !

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:56:59'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!OWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:57:05'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !


!classDefinition: #TiedState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #TiedState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:25:37'!
hasPlayerOWon
	^false! !

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:25:41'!
hasPlayerXWon
	^false! !

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:43'!
isOver
	^true! !

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:44:49'!
isTied
	^true! !

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:56:51'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!TiedState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:56:43'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !


!classDefinition: #XTurnState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #XTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:24:57'!
hasPlayerOWon
	^false! !

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:25:00'!
hasPlayerXWon
	^false! !

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:39'!
isOver
	^false! !

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:44:35'!
isTied
	^false! !

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:05:04'!
putOAt: aPosition
	game putODuringXTurnAt: aPosition.! !

!XTurnState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 20:05:28'!
putXAt: aPosition
	game putXDuringXTurnAt: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XTurnState class' category: #'TicTacToe-Ejercicio'!
XTurnState class
	instanceVariableNames: ''!

!XTurnState class methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:35:27'!
for: aTicTacToe
	^self new initializeFor: aTicTacToe.! !


!classDefinition: #XWinState category: #'TicTacToe-Ejercicio'!
TicTacToeState subclass: #XWinState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe-Ejercicio'!

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:26:05'!
hasPlayerOWon
	^false! !

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:26:08'!
hasPlayerXWon
	^true! !

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:42:33'!
isOver
	^true! !

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 08:51:57'!
isTied
	^false.! !

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:57:22'!
putOAt: aPosition
	game putOWhileGameIsOverAt: aPosition! !

!XWinState methodsFor: 'as yet unclassified' stamp: 'SAS 5/29/2018 19:57:20'!
putXAt: aPosition
	game putXWhileGameIsOverAt: aPosition! !
