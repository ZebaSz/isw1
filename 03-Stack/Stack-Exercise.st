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

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:53:27'!
initialize
	stack _ StackBase withBlockIfEmpty: [self error: self class stackEmptyErrorDescription].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:43:02'!
isEmpty
	^stack hasValue.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:44:26'!
pop
	|oldTop|
	oldTop := stack value.
	stack := stack substack.
	^oldTop! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:45:07'!
push: anObject
	stack := StackElement with: anObject onTopOf: stack.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:05'!
size
	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:44:14'!
top
	^stack value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #StackLevel category: #'Stack-Exercise'!
Object subclass: #StackLevel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackLevel methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:42:05'!
hasValue
	self subclassResponsibility.! !

!StackLevel methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:15'!
size
	self subclassResponsibility.! !

!StackLevel methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:43:20'!
substack
	self subclassResponsibility.! !

!StackLevel methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:44:00'!
value
	self subclassResponsibility.! !


!classDefinition: #StackBase category: #'Stack-Exercise'!
StackLevel subclass: #StackBase
	instanceVariableNames: 'blockIfEmpty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:42:05'!
hasValue
	^ true.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:42'!
size
	^0.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:51:24'!
substack
	^blockIfEmpty value.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:51:33'!
value
	^blockIfEmpty value.! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:50:53'!
withBlockIfEmpty: aBlockClosure
	blockIfEmpty := aBlockClosure.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackBase class' category: #'Stack-Exercise'!
StackBase class
	instanceVariableNames: ''!

!StackBase class methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:50:09'!
withBlockIfEmpty: aBlockClosure
	^self new withBlockIfEmpty: aBlockClosure.! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
StackLevel subclass: #StackElement
	instanceVariableNames: 'value substack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:42:05'!
hasValue
	^ false.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:32:34'!
size
	^substack size + 1.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:43:20'!
substack
	^ substack.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'SAS 4/26/2018 09:44:00'!
value
	^ value.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'SAS 4/23/2018 20:14:25'!
with: anObject onTopOf: anOOStack 
	value := anObject.
	substack := anOOStack.
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: #'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'instance creation' stamp: 'SAS 4/23/2018 20:26:49'!
with: anObject onTopOf: anOOStack 
	^self new with: anObject onTopOf: anOOStack.! !
