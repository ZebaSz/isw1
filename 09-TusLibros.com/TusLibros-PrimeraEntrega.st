!classDefinition: #CartTest category: #'TusLibros-Ejercicio'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:50:33'!
assert: cart containsProduct: aProduct 
	self assert: 0 < (cart countOf: aProduct).! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:48:26'!
assert: cart containsProduct: aProduct exactlyTimes: anAmount
	self assert: anAmount equals: (cart countOf: aProduct).! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:48:40'!
assert: cart isOfSize: aSize
	self assert: (cart size) equals: aSize.! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:43:25'!
cartWithCatalog
	^ Cart withCatalog: self catalogForTesting.! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:51:22'!
catalogForTesting
	^ #('Producto A' 'Producto B' 'Producto C' ).! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:43:25'!
productInCatalog: anIndex
	^ self catalogForTesting at: anIndex.! !

!CartTest methodsFor: 'test support' stamp: 'SAS 6/7/2018 16:20:32'!
productNotInCatalog
	^'Producto fuera de catálogo'.! !


!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:07:10'!
test01cartIsEmptyWhenCreated
	| cart |
	cart _ self cartWithCatalog.
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:12:09'!
test02cartIsNotEmptyWhenItemIsAdded
	| cart |
	cart _ self cartWithCatalog.
	
	cart add: (self productInCatalog: 1).
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:13:42'!
test03cartContainsAddedItem
	| cart product |
	cart _ self cartWithCatalog.
	product := self productInCatalog: 1.
	
	cart add: product.
	
	self assert: cart containsProduct: product.! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:17:55'!
test04cartContainsAllAddedItem
	| cart firstProduct secondProduct |
	cart _ self cartWithCatalog.
	firstProduct := self productInCatalog: 1.
	secondProduct := self productInCatalog: 2.
	
	cart add: firstProduct.
	cart add: secondProduct.
	
	self assert: cart containsProduct: firstProduct.
	self assert: cart containsProduct: secondProduct.! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:25:40'!
test05cartCannotContainItemNotInCatalog
	| cart product |
	cart _ self cartWithCatalog.
	product := self productNotInCatalog.
	
	self
		should: [cart add: product ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self assert: cart isEmpty.
			self assert:  (ex messageText) equals: Cart productNotInCatalogMessage.
		]! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:46:04'!
test06cartCanAddManyOfOneProduct
	| cart product |
	cart _ self cartWithCatalog.
	product := self productInCatalog: 1.
	
	cart add: product times: 2.
	
	self assert: cart isOfSize: 2.
	self assert: cart containsProduct: product exactlyTimes: 2.! !

!CartTest methodsFor: 'tests' stamp: 'SAS 6/7/2018 16:40:30'!
test07cartCannotAddLessThanOneOfAProduct
	| cart product |
	cart _ self cartWithCatalog.
	product := self productInCatalog: 1.
	
	self
		should: [ cart add: product times: 0. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :ex |
			self assert: (ex messageText) equals: Cart invalidAmountMessage.
			self assert: cart isEmpty.
		].! !


!classDefinition: #Cart category: #'TusLibros-Ejercicio'!
Object subclass: #Cart
	instanceVariableNames: 'catalog contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Ejercicio'!

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:40:57'!
add: aProduct
	self add: aProduct times: 1.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:42:10'!
add: aProduct times: anAmount 
	self assertInCatalog: aProduct.
	self assertAmountIsPositive: anAmount.
	contents add: aProduct withOccurrences: anAmount.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:41:52'!
assertAmountIsPositive: anAmount
	(anAmount > 0) ifFalse: [ self error: self class invalidAmountMessage ].! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:23:12'!
assertInCatalog: aProduct 
	(catalog includes: aProduct) ifFalse: [ self error: self class productNotInCatalogMessage ].! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:16:28'!
contents
	^ contents copy.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:48:15'!
countOf: aProduct
	^contents occurrencesOf: aProduct.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:16:28'!
initializeWithCatalog: aCatalog
	catalog _ Set new.
	catalog addAll: aCatalog.
	contents _ Bag new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:16:28'!
isEmpty
	^ contents isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:48:06'!
size
	^contents size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Ejercicio'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:42:49'!
invalidAmountMessage
	^'La cantidad de elementos a agregar debe ser positiva'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:23:37'!
productNotInCatalogMessage
	^'El producto seleccionado no está en el catálogo'.! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'SAS 6/7/2018 16:02:38'!
withCatalog: aCatalog
	^ self new initializeWithCatalog: aCatalog.! !
