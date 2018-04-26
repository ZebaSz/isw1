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
	instanceVariableNames: 'size stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:19:06'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:22:51'!
top
	^ stack valueIfEmpty: [ self signalEmpty ].! !


!OOStack methodsFor: 'adding' stamp: 'SAS 4/26/2018 16:27:00'!
push: anObject
	stack := StackElement with: anObject onTopOf: stack.
	size := size + 1.! !


!OOStack methodsFor: 'error handling' stamp: 'SAS 4/26/2018 16:23:20'!
signalEmpty
	self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'initialization' stamp: 'SAS 4/26/2018 16:24:08'!
initialize
	stack _ StackBase new.
	size := 0.! !


!OOStack methodsFor: 'removing' stamp: 'SAS 4/26/2018 16:26:15'!
pop
	|oldTop|
	oldTop := stack valueIfEmpty: [self signalEmpty].
	stack := stack substackIfEmpty: [self signalEmpty].
	size := size - 1.
	^oldTop! !


!OOStack methodsFor: 'testing' stamp: 'SAS 4/26/2018 16:29:28'!
isEmpty
	^size = 0.! !

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

!StackLevel methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:18:29'!
substackIfEmpty: aBlockClosure
	self subclassResponsibility.! !

!StackLevel methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:22:51'!
valueIfEmpty: aBlockClosure
	self subclassResponsibility.! !


!classDefinition: #StackBase category: #'Stack-Exercise'!
StackLevel subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:18:09'!
substackIfEmpty: aBlockClosure
	^aBlockClosure value.! !

!StackBase methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:22:51'!
valueIfEmpty: aBlockClosure
	^ aBlockClosure value.! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
StackLevel subclass: #StackElement
	instanceVariableNames: 'value substack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:18:45'!
substackIfEmpty: aBlockClosure
	^ substack.! !

!StackElement methodsFor: 'accessing' stamp: 'SAS 4/26/2018 16:22:51'!
valueIfEmpty: aBlockClosure
	^ value.! !


!StackElement methodsFor: 'initialization' stamp: 'SAS 4/23/2018 20:14:25'!
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
