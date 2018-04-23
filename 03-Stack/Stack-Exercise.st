!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:18:45'!
initialize
	stack := EmptyStackNode new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:24:52'!
isEmpty
	^stack isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:31:44'!
pop
	|oldTop|
	oldTop := stack top.
	stack := stack pop.
	^oldTop! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:21:56'!
push: anObject
	stack := stack push: anObject.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:05'!
size
	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:27:21'!
top
	^stack top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'SAS 4/23/2018 20:20:17'!
signalEmpty
	self error: self stackEmptyErrorDescription.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #StackNode category: #'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:25:04'!
isEmpty
	self subclassResponsibility.! !

!StackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:23:41'!
pop
	self subclassResponsibility.! !

!StackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:24:11'!
push: anObject
	^NonEmptyStackNode
		with: anObject
		onTopOf: self.! !

!StackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:15'!
size
	self subclassResponsibility.! !

!StackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:30:33'!
top
	self subclassResponsibility.! !


!classDefinition: #EmptyStackNode category: #'Stack-Exercise'!
StackNode subclass: #EmptyStackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:25:27'!
isEmpty
	^true.! !

!EmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:19:44'!
pop
	OOStack signalEmpty.! !

!EmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:42'!
size
	^0.! !

!EmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:30:22'!
top
	OOStack signalEmpty.! !


!classDefinition: #NonEmptyStackNode category: #'Stack-Exercise'!
StackNode subclass: #NonEmptyStackNode
	instanceVariableNames: 'value substack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:25:18'!
isEmpty
	^false.! !

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:15:32'!
pop
	^substack.! !

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:34'!
size
	^substack size + 1.! !

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:29:23'!
top
	^value.! !

!NonEmptyStackNode methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:14:25'!
with: anObject onTopOf: anOOStack 
	value := anObject.
	substack := anOOStack.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackNode class' category: #'Stack-Exercise'!
NonEmptyStackNode class
	instanceVariableNames: ''!

!NonEmptyStackNode class methodsFor: 'instance creation' stamp: 'SAS 4/23/2018 20:26:49'!
with: anObject onTopOf: anOOStack 
	^self new with: anObject onTopOf: anOOStack.! !
