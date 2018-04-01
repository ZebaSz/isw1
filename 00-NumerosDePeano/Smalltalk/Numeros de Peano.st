!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operaciones' stamp: 'SAS 3/22/2018 21:41:28'!
* unNumeroDePeano
	^unNumeroDePeano ! !

!I class methodsFor: 'operaciones' stamp: 'SAS 3/22/2018 21:44:27'!
+ unNumeroDePeano
	^unNumeroDePeano next.! !

!I class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 19:36:21'!
- unNumeroDePeano
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 20:25:11'!
/ unNumeroDePeano
	self = unNumeroDePeano ifTrue: [^self].
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor .! !

!I class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 20:24:09'!
>= unNumeroDePeano
	^(unNumeroDePeano == self)! !


!I class methodsFor: 'errores' stamp: 'SAS 3/26/2018 19:46:47'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'errores' stamp: 'SAS 3/26/2018 19:57:45'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'No se soportan los números no-naturales (< 1)'.! !


!I class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/29/2018 15:17:43'!
next
	^II.! !

!I class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/29/2018 15:11:03'!
previous
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/26/2018 19:56:29'!
restarDe: unNumeroDePeano
	^(unNumeroDePeano previous)! !


!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'myNext myPrev'!

!II class methodsFor: 'operaciones' stamp: 'SAS 3/22/2018 21:56:25'!
* unNumeroDePeano
	^unNumeroDePeano + (unNumeroDePeano * (self previous)).! !

!II class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 17:15:41'!
+ unNumeroDePeano
	^(self previous) + (unNumeroDePeano next).! !

!II class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 19:59:03'!
- unNumeroDePeano
	^unNumeroDePeano restarDe: self.! !

!II class methodsFor: 'operaciones' stamp: 'SAS 3/29/2018 15:07:32'!
/ unNumeroDePeano
	|prev res|
	self >= unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	self = unNumeroDePeano ifTrue: [^I].
	prev := self - unNumeroDePeano.
	prev >= unNumeroDePeano ifFalse: [^I].
	res := prev / unNumeroDePeano.
	^res next.! !

!II class methodsFor: 'operaciones' stamp: 'SAS 3/26/2018 20:27:51'!
>= unNumeroDePeano
	^(unNumeroDePeano == I) or:  [(self previous) >= (unNumeroDePeano previous)]! !


!II class methodsFor: 'errores' stamp: 'SAS 3/26/2018 19:46:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !


!II class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/26/2018 20:19:54'!
next
	myNext ifNil: [
		myNext := self cloneNamed: (self name, 'I').
		myNext previous: self.
		].
	^myNext ! !

!II class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/22/2018 21:39:28'!
previous
	^myPrev! !

!II class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/26/2018 20:18:18'!
previous: unNumeroDePeano
	myPrev := unNumeroDePeano! !

!II class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/22/2018 21:47:36'!
removeAllNext
	myNext ifNotNil: [
		myNext removeAllNext.
		myNext removeFromSystem.
		myNext := nil
	].! !

!II class methodsFor: 'métodos auxiliares' stamp: 'SAS 3/26/2018 19:55:43'!
restarDe: unNumeroDePeano
	^(unNumeroDePeano previous) - (self previous)! !

II instVarNamed: 'myNext' put: nil!
II instVarNamed: 'myPrev' put: I!