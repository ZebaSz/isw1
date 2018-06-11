!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:35:18'!
test01NewCartsAreCreatedEmpty

	self assert: TestSupport createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:36:47'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := TestSupport createCart.
	
	self 
		should: [ cart add: TestSupport itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:35:35'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := TestSupport createCart.
	
	cart add: TestSupport itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:35:45'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := TestSupport createCart.
	
	self 
		should: [cart add: 0 of: TestSupport itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:35:51'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := TestSupport createCart.
	
	self 
		should: [cart add: 2 of: TestSupport itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:35:57'!
test06CartRemembersAddedItems

	| cart |
	
	cart := TestSupport createCart.
	
	cart add: TestSupport itemSellByTheStore.
	self assert: (cart includes: TestSupport itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:36:03'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := TestSupport createCart.
	
	self deny: (cart includes: TestSupport itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:36:10'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := TestSupport createCart.
	
	cart add: 2 of: TestSupport itemSellByTheStore.
	self assert: (cart occurrencesOf: TestSupport itemSellByTheStore) = 2! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:05:18'!
test01cannotCheckoutEmptyCart
	| cashier cart creditCard date |
	cashier _ TestSupport createCashier.
	cart _ TestSupport createCart.
	creditCard _ TestSupport createValidCreditCard.
	date _ TestSupport today.
	self
		should: [
			cashier
				checkOut: cart
				with: creditCard
				on: date ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self assert: ex messageText equals: Cashier emptyCartMessage
		].! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:19:57'!
test02cannotCheckoutWithExpiredCard
	| cashier cart creditCard date |
	
	cashier _ TestSupport createCashier.
	cart _ TestSupport createCart.
	cart add: TestSupport itemSellByTheStore.
	creditCard := TestSupport createExpiredCreditCard.
	date _ TestSupport today.
	
	self
		should: [
			cashier
				checkOut: cart
				with: creditCard
				on: date ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self assert: ex messageText equals: Cashier expiredCardMessage
		].! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:29:18'!
test03cashierReportsSumOnSuccessfulPurchase
	| cashier cart creditCard date total |
	
	cashier _ TestSupport createCashier.
	cart _ TestSupport createCart.
	cart add: TestSupport itemSellByTheStore.
	cart add: TestSupport anotherItemSellByTheStore.
	creditCard := TestSupport createValidCreditCard.
	date _ TestSupport today.
	
	total := cashier checkOut: cart with: creditCard on: date.
	
	
	self assert: total equals: (TestSupport itemSellByTheStorePrice + TestSupport anotherItemSellByTheStorePrice)! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/11/2018 17:39:13'!
test04cashierRegistersSuccessfulPurchases
	| cashier cart creditCard date total |
	
	cashier _ TestSupport createCashier.
	cart _ TestSupport createCart.
	cart add: TestSupport itemSellByTheStore.
	cart add: TestSupport anotherItemSellByTheStore.
	creditCard := TestSupport createValidCreditCard.
	date _ TestSupport today.
	
	total := cashier checkOut: cart with: creditCard on: date.
	
	
	self assert: total equals: cashier salesTotal! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'assertions' stamp: 'SAS 6/11/2018 17:37:37'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'SAS 6/11/2018 17:31:17'!
priceTotal
	^catalog inject: 0 into: [ :acc :each | acc + each value ].! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'actions' stamp: 'SAS 6/11/2018 17:43:55'!
checkOut: aCart with: aCreditCard on: aDate
	| total |
	self assertCartIsNotEmpty: aCart.
	self assertCardIsNotExpired: aCreditCard on: aDate.
	
	total := aCart priceTotal.
	sales add: total.
	
	^total.! !


!Cashier methodsFor: 'assertions' stamp: 'SAS 6/11/2018 17:17:06'!
assertCardIsNotExpired: creditCard on: aDate
	(creditCard isExpired: aDate) ifTrue: [ self error: self class expiredCardMessage ].! !

!Cashier methodsFor: 'assertions' stamp: 'SAS 6/11/2018 17:04:22'!
assertCartIsNotEmpty: cart 
	cart isEmpty ifTrue: [ self error: self class emptyCartMessage ].! !


!Cashier methodsFor: 'initialization' stamp: 'SAS 6/11/2018 17:40:20'!
initialize
	sales := OrderedCollection new.! !


!Cashier methodsFor: 'queries' stamp: 'SAS 6/11/2018 17:39:48'!
salesTotal
	^sales sum.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'messages' stamp: 'SAS 6/11/2018 17:04:43'!
emptyCartMessage
	^'Cannot checkout an empty cart'.! !

!Cashier class methodsFor: 'messages' stamp: 'SAS 6/11/2018 17:19:25'!
expiredCardMessage
	^'Credit card is expired'.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'SAS 6/11/2018 17:02:15'!
initializeExpiring: aMonth 
	expiration := aMonth.! !


!CreditCard methodsFor: 'testing' stamp: 'SAS 6/11/2018 17:18:41'!
isExpired: aDate
	^(aDate yearNumber > expiration yearNumber) or: [ aDate monthIndex > expiration monthIndex ] .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'SAS 6/11/2018 17:01:56'!
expiring: aMonth 
	^self new initializeExpiring: aMonth.! !


!classDefinition: #TestSupport category: #TusLibros!
Object subclass: #TestSupport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestSupport class' category: #TusLibros!
TestSupport class
	instanceVariableNames: ''!

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:27:00'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:28:34'!
anotherItemSellByTheStorePrice
	
	^ 20! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 16:47:30'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 16:51:20'!
createCashier
	
	^Cashier new.! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:08:34'!
createExpiredCreditCard
	| today |
	today _ self today.
	^ CreditCard expiring:
		(Month
			month: today monthIndex
			year: today yearNumber - 1).! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:08:29'!
createValidCreditCard
	| today |
	today := self today.
	^ CreditCard expiring:
		(Month
			month: today monthIndex
			year: today yearNumber + 1).! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:34:35'!
defaultCatalog
	
	^ Dictionary
		with: (Association
			key: self itemSellByTheStore
			value: self itemSellByTheStorePrice)
		with: (Association
			key: self anotherItemSellByTheStore
			value: self anotherItemSellByTheStorePrice).! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 16:47:58'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 16:48:13'!
itemSellByTheStore
	
	^ 'validBook'! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:26:42'!
itemSellByTheStorePrice
	
	^ 10! !

!TestSupport class methodsFor: 'test support' stamp: 'SAS 6/11/2018 17:02:55'!
today
	^Date today.! !
