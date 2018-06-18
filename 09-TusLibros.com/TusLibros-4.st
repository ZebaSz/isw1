!classDefinition: #BookStoreTest category: #TusLibros!
TestCase subclass: #BookStoreTest
	instanceVariableNames: 'testObjectsFactory nowBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:49:47'!
debit: anAmount from: aCreditCard! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 20:46:41'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:11'!
test01cannotCreateCartWithInvalidUser
	| bookStore user |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory nonRegisteredUser.
	self
		should: [ bookStore createCartForUser: user ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self
				assert: anException messageText
				equals: BookStore invalidUserMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:22'!
test02cannotCreateCartWithInvalidPassword
	| bookStore user |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	user value: 'unaContraseñaIncorrecta'.
	self
		should: [ bookStore createCartForUser: user ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self
				assert: anException messageText
				equals: BookStore invalidPasswordMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:31'!
test03canCreateCartIfLoginIsValid
	| bookStore user |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	bookStore createCartForUser: user.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:35'!
test04listEmptyCartReturnsEmptyList
	| bookStore user cartId |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	self assert: (bookStore listCart: cartId) isEmpty.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:38'!
test05cannotListCartWithInvalidId
	| bookStore |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	
	self
		should: [ bookStore listCart: testObjectsFactory invalidCartId ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :ex |
			self assert: ex messageText equals: BookStore invalidCartIdMessage.
		]! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:41'!
test06canAddValidItemToCart
	| bookStore user cartId |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	
	bookStore add: 1 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:45'!
test07cannotAddInvalidItemToCart
	| bookStore user cartId |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	
	
	self
		should: [ bookStore add: 1 of: testObjectsFactory itemNotSellByTheStore toCartWithId: cartId ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :ex | 
			self assert: ex messageText equals: BookStore invalidItemErrorMessage
		]! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:52'!
test08cannotAddInvalidAmountOfItemToCart
	| bookStore user cartId |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	self
		should: [
			bookStore
				add: 0
				of: testObjectsFactory itemSellByTheStore
				toCartWithId: cartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self
				assert: ex messageText
				equals: BookStore invalidQuantityErrorMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:37:56'!
test09cannotAddItemsToCartWithInvalidId
	| bookStore |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	
	self
		should: [
			bookStore
				add: 0
				of: testObjectsFactory itemSellByTheStore
				toCartWithId: testObjectsFactory invalidCartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self
				assert: ex messageText
				equals: BookStore invalidCartIdMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:38:00'!
test10listCartContainsItemsAddedToCart
	| bookStore user cartId cartContents |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	
	bookStore add: 2 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.
	bookStore add: 3 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.
	bookStore add: 4 of: testObjectsFactory anotherItemSellByTheStore toCartWithId: cartId.
	
	cartContents _ bookStore listCart: cartId.
	self assert: (cartContents occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5.
	self assert: (cartContents occurrencesOf: testObjectsFactory anotherItemSellByTheStore) equals: 4.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:38:04'!
test11canCheckoutCart
	| bookStore user cartId creditCard sale |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	
	bookStore add: 2 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.
	
	creditCard _  testObjectsFactory notExpiredCreditCard.
	
	sale _ bookStore checkOut: cartId debitingFrom: creditCard.
	
	self assert: sale total equals: (testObjectsFactory itemSellByTheStorePrice * 2).! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:03:00'!
test12cannotCheckoutCartWithInvalidId
	| bookStore creditCard |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	creditCard _  testObjectsFactory notExpiredCreditCard.
	
	self
		should: [
			bookStore
				checkOut: testObjectsFactory invalidCartId
				debitingFrom: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self
				assert: ex messageText
				equals: BookStore invalidCartIdMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:05:43'!
test13cannotCheckoutEmptyCart
	| bookStore creditCard cartId |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	creditCard _  testObjectsFactory notExpiredCreditCard.
	cartId _ bookStore createCartForUser: testObjectsFactory registeredUser.
	
	self
		should: [
			bookStore
				checkOut: cartId
				debitingFrom: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self
				assert: ex messageText
				equals: BookStore cartCanNotBeEmptyErrorMessage.
			self
				assert: (bookStore listCart: cartId) isEmpty].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:09:29'!
test14cannotCheckoutWithExpiredCreditCard
	| bookStore creditCard cartId |
	bookStore _ testObjectsFactory
		createBookStoreThrough: self
		withTimeFrom: self.
	creditCard _ testObjectsFactory expiredCreditCard.
	cartId _ bookStore createCartForUser: testObjectsFactory registeredUser.
	
	bookStore add: 2 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.
	self
		should: [
			bookStore
				checkOut: cartId
				debitingFrom: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self
				assert: ex messageText
				equals: BookStore canNotChargeAnExpiredCreditCardErrorMessage. ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:11:23'!
test15listPurchasesIsEmptyIfNoPurchaseMade
	| bookStore |
	bookStore _ testObjectsFactory
		createBookStoreThrough: self
		withTimeFrom: self.
			
	self assert: (bookStore listPurchasesFor: testObjectsFactory registeredUser) isEmpty! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:14:44'!
test16cannotListPurchasesWithInvalidUser
	| bookStore |
	bookStore _ testObjectsFactory
		createBookStoreThrough: self
		withTimeFrom: self.
	self
		should: [ bookStore listPurchasesFor: testObjectsFactory nonRegisteredUser ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self
				assert: anException messageText
				equals: BookStore invalidUserMessage ].! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:18:12'!
test17listPurchasesIncludesPurchasedItems
	| bookStore user cartId creditCard purchases |
	bookStore _ testObjectsFactory createBookStoreThrough: self withTimeFrom: self.
	user _ testObjectsFactory registeredUser.
	cartId _ bookStore createCartForUser: user.
	
	bookStore add: 2 of: testObjectsFactory itemSellByTheStore toCartWithId: cartId.
	
	creditCard _  testObjectsFactory notExpiredCreditCard.
	
	bookStore checkOut: cartId debitingFrom: creditCard.
	
	purchases _ bookStore listPurchasesFor: user.
	
	self assert: (purchases occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 2.! !

!BookStoreTest methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:41:13'!
today
	^testObjectsFactory today! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 13:47:57'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 13:48:38'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 13:48:02'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 14:54:01'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut total = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 14:54:10'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut total.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'SAS 6/18/2018 14:54:16'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut total.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #BookStore category: #TusLibros!
Object subclass: #BookStore
	instanceVariableNames: 'catalogue users processor carts nextId clock owners salesbook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:42:33'!
add: anAmount of: aProduct toCartWithId: aCartId
	self assertCartIdIsValid: aCartId.
	
	(carts at: aCartId) add: anAmount of: aProduct.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 21:27:12'!
assertCartIdIsValid: aCartId 
	(carts includesKey: aCartId) ifFalse: [ self error: self class invalidCartIdMessage ].! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 21:02:01'!
assertUserIsValid: aUser 
	(users includesKey: aUser key) ifFalse: [ self error: self class invalidUserMessage ].
	((users at: aUser key) = aUser value) ifFalse: [ self error: self class invalidPasswordMessage ].! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:51:30'!
checkOut: aCartId debitingFrom: aCreditCard
	| cashier sale |
	self assertCartIdIsValid: aCartId.
	
	cashier _ Cashier
		toCheckout: (carts at: aCartId)
		charging: aCreditCard
		throught: processor
		on: self today
		registeringOn: (self salesbookFor: (owners at: aCartId)).
		
	sale _ cashier checkOut.
	
	carts removeKey: aCartId.
	
	^sale.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:43:42'!
createCartForUser: aUser
	| cartId |

	self assertUserIsValid: aUser.
	
	cartId _ self nextCartId.
	carts at: cartId put: (Cart acceptingItemsOf: catalogue).
	owners at: cartId put: aUser key.
	
	^cartId! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:48:41'!
initializeWithInventory: aCatalogue withUsers: aUserList through: aMerchantProcessor withTimeFrom: aClock
	catalogue _ aCatalogue.
	users _ aUserList.
	processor _ aMerchantProcessor.
	clock _ aClock.
	
	carts _ Dictionary new.
	owners _ Dictionary new.
	salesbook _ Dictionary new.
	nextId _ 1.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:25:21'!
listCart: aCartId
	self assertCartIdIsValid: aCartId.
	
	^(carts at: aCartId) content.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:28:56'!
listPurchasesFor: aUser
	| saleItems |
	self assertUserIsValid: aUser.
	saleItems _ (self salesbookFor: aUser key) collect: [ :sale | sale items ].
	saleItems isEmpty ifFalse: [
		saleItems _ saleItems fold: [ :a :b | a addAll: b]
	].
	^saleItems.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 21:24:39'!
nextCartId
	| curId |
	curId _ nextId.
	nextId _ curId + 1.
	^curId.! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:13:38'!
salesbookFor: aUsername
	^salesbook at: aUsername ifAbsentPut: [ OrderedCollection new ].! !

!BookStore methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:34:15'!
today
	^clock today.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BookStore class' category: #TusLibros!
BookStore class
	instanceVariableNames: ''!

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:09:47'!
canNotChargeAnExpiredCreditCardErrorMessage
	^Cashier canNotChargeAnExpiredCreditCardErrorMessage.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 15:06:02'!
cartCanNotBeEmptyErrorMessage
	^Cashier cartCanNotBeEmptyErrorMessage.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:34:13'!
invalidCartIdMessage
	^'The requested cart does not exist'.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:45:25'!
invalidItemErrorMessage
	^Cart invalidItemErrorMessage! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 21:03:49'!
invalidPasswordMessage
	^'The password is incorrect'.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:50:59'!
invalidQuantityErrorMessage
	^Cart invalidQuantityErrorMessage.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/14/2018 21:02:31'!
invalidUserMessage
	^'That is not a registered user'.! !

!BookStore class methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 14:35:58'!
withInventory: aCatalogue withUsers: aUserList through: aMerchantProcessor withTimeFrom: aClock
	^self new initializeWithInventory: aCatalogue withUsers: aUserList through: aMerchantProcessor withTimeFrom: aClock.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!Cart methodsFor: 'assertions' stamp: 'SAS 6/18/2018 13:47:53'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self class invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'SAS 6/18/2018 13:48:35'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self class invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'accessing' stamp: 'SAS 6/18/2018 13:25:54'!
content
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !

!Cart class methodsFor: 'instance creation' stamp: 'SAS 6/18/2018 13:47:42'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart class methodsFor: 'instance creation' stamp: 'SAS 6/18/2018 13:48:22'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total sale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'SAS 6/18/2018 15:21:16'!
createSale

	^ Sale forItems: cart content totaling: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'SAS 6/18/2018 14:53:37'!
registerSale

	sale _ self createSale.
	salesBook add: sale! !


!Cashier methodsFor: 'checkout' stamp: 'SAS 6/18/2018 14:53:51'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ sale! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

!CreditCard methodsFor: 'initialization' stamp: 'SAS 6/18/2018 14:57:26'!
initializeWithNumber: aCreditCardNumber ownedBy: anOwner expiringOn: aMonth 
	number _ aCreditCardNumber.
	owner _ anOwner.
	expiration _ aMonth. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'SAS 6/18/2018 14:57:53'!
withNumber: aCreditCardNumber ownedBy: anOwner expiringOn: aMonth	
	^self new initializeWithNumber: aCreditCardNumber ownedBy: anOwner expiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'SAS 6/18/2018 15:19:30'!
initializeForItems: aCollectionOfItems totaling: aTotal
	
	items := aCollectionOfItems.
	total := aTotal ! !

!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !


!Sale methodsFor: 'accessing' stamp: 'SAS 6/18/2018 15:29:27'!
items
	^items copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'SAS 6/18/2018 15:20:31'!
forItems: aCollectionOfItems totaling: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeForItems: aCollectionOfItems totaling: aTotal! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'SAS 6/18/2018 13:55:22'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'SAS 6/18/2018 13:55:33'!
anotherItemSellByTheStorePrice
	
	^20! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'SAS 6/18/2018 13:56:37'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SAS 6/18/2018 14:59:35'!
creditCardNumber
	^1111222233334444.! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SAS 6/18/2018 14:59:55'!
creditCardOwner
	^'Diego Romero'.! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SAS 6/18/2018 14:58:45'!
expiredCreditCard
	
	^CreditCard
		withNumber: self creditCardNumber
		ownedBy: self creditCardOwner
		expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'SAS 6/18/2018 14:59:04'!
notExpiredCreditCard
	
	^CreditCard
		withNumber: self creditCardNumber
		ownedBy: self creditCardOwner
		expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'book store' stamp: 'SAS 6/18/2018 14:36:48'!
createBookStoreThrough: aMerchantProcessor withTimeFrom: aClock
	
	^BookStore withInventory: self defaultCatalog withUsers: self defaultUsers through: aMerchantProcessor withTimeFrom: aClock.! !

!StoreTestObjectsFactory methodsFor: 'book store' stamp: 'SAS 6/14/2018 20:51:16'!
defaultUsers
	^(Dictionary new) add: self registeredUser; yourself.! !

!StoreTestObjectsFactory methodsFor: 'book store' stamp: 'SAS 6/14/2018 20:54:07'!
nonRegisteredUser
	^Association key: 'KENT BECK' value: 'estaContraseñaNoImporta'.! !

!StoreTestObjectsFactory methodsFor: 'book store' stamp: 'SAS 6/14/2018 20:52:42'!
registeredUser
	^Association key: 'PEPE SANCHEZ' value: 'unaBuenaContraseña'.! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'SAS 6/18/2018 13:53:16'!
invalidCartId
	"Los tests nunca deberían crear tantos carts"
	^99999999.! !
