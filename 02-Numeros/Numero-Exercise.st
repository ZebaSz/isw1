!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
  instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

  self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

  self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

  self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

  self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

  self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

  self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

  self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
   
  a/b + c/d = (a.d + c.b) / (b.d)
   
  SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
  TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
  | sevenTenths |

  sevenTenths := (Entero with: 7) / (Entero with: 10).

  self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
   
  (a/b) * (c/d) = (a.c) / (b.d)
"

  self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
   
  (a/b) / (c/d) = (a.d) / (b.c)
"

  self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
  Ahora empieza la diversion!!
"

  self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

  self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

  self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

  self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

  self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

  self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

  self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

  self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

  self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

  self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

  self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

  self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

  self 
    should: [ one / zero ]
    raise: Error
    withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

  self 
    should: [ oneHalf / zero ]
    raise: Error
    withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

  self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

  self deny: oneHalf isOne! !


!NumeroTest methodsFor: 'setup' stamp: 'HernanWilkinson 5/7/2016 20:56'!
setUp

  zero := Entero with: 0.
  one := Entero with: 1.
  two := Entero with: 2.
  four := Entero with: 4.
  five := Entero with: 5.
  
  oneHalf := one / two.
  oneFifth := one / five.
  twoFifth := two / five.
  twoTwentyfifth := two / (Entero with: 25).
  fiveHalfs := five / two.
  ! !



!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

  self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

  self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

  self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

  self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

  self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

  self subclassResponsibility ! !


!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:31:51'!
addFraction: aFraccion 
  self subclassResponsibility.! !

!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:35:55'!
addInteger: anEntero 
  self subclassResponsibility.! !

!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:40:44'!
divideFraction: aFraccion 
  self subclassResponsibility.! !

!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:41:01'!
divideInteger: anEntero 
  self subclassResponsibility.! !

!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:41:23'!
multiplyFraction: aFraccion 
  self subclassResponsibility.! !

!Numero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:41:14'!
multiplyInteger: anEntero 
  self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
  instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

  ^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
  ^ 'Tipo de numero invalido'! !



!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
  instanceVariableNames: 'value'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:41:50'!
* aMultiplier 
  
  ^aMultiplier multiplyInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:28:20'!
+ anAdder 
  
  ^anAdder addInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:20:37'!
/ aDivisor 
  ^aDivisor divideInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
  
  ^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
  
  ^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

  ^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

  ^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initializeWith: aValue 
  
  value := aValue! !


!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:35:20'!
addFraction: aFraccion 
  ^aFraccion class with: (aFraccion numerator + (self * aFraccion denominator)) over: aFraccion denominator.! !

!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:29:59'!
addInteger: anEntero 
  ^self class with: (value + anEntero integerValue).! !

!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:20:03'!
divideFraction: aFraccion
  ^Fraccion with: aFraccion numerator over: (self * aFraccion denominator).! !

!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:21:40'!
divideInteger: anEntero
  ^Fraccion with: anEntero over: self.! !

!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:45:45'!
multiplyFraction: aFraccion 
  ^(self * aFraccion numerator) / (aFraccion denominator)
  ! !

!Entero methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:43:53'!
multiplyInteger: anEntero 
  ^self class with: value * anEntero integerValue.! !


!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
  
  ^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
  
  ^value = 0! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

  "Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
  
  ^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
  instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
  
  "Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
  aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
  
  ^self new initializeWith: aValue! !



!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
  instanceVariableNames: 'numerator denominator'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Numero-Exercise'!

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
  
  ^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
  
  ^false! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

  "Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
  aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
  aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
  
  numerator := aNumerator.
  denominator := aDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

  ^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

  ^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:43:10'!
* aMultiplier 
  
  ^aMultiplier multiplyFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:28:44'!
+ anAdder 
  
  ^anAdder addFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SAS 4/19/2018 20:22:46'!
/ aDivisor 
  
  ^aDivisor divideFraction: self.! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

  ^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

  ^ numerator! !


!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:37:19'!
addFraction: aFraccion 

  | newNumerator newDenominator |
  
  newNumerator := (numerator * aFraccion denominator) + (denominator * aFraccion numerator).
  newDenominator := denominator * aFraccion denominator.
  
  ^newNumerator / newDenominator! !

!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:36:39'!
addInteger: anEntero 
  | newNumerator newDenominator |
  
  newNumerator := numerator + (denominator * anEntero).
  newDenominator := denominator.
  
  ^newNumerator / newDenominator! !

!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:21:24'!
divideFraction: aFraccion
  ^Fraccion with: (self denominator * aFraccion numerator) over: (self numerator * aFraccion denominator).! !

!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:38:03'!
divideInteger: anEntero
  ^Fraccion with: (self denominator * anEntero) over: self numerator.! !

!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:44:28'!
multiplyFraction: aFraccion 

  ^(numerator * aFraccion numerator) / (denominator * aFraccion denominator)
  ! !

!Fraccion methodsFor: 'polymorphism' stamp: 'SAS 4/19/2018 20:44:58'!
multiplyInteger: anEntero 
  
  ^(numerator * anEntero) / denominator
  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
  instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 20:41'!
with: aDividend over: aDivisor

  | greatestCommonDivisor numerator denominator |
  
  aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
  aDividend isZero ifTrue: [ ^aDividend ].
  
  greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
  numerator := aDividend // greatestCommonDivisor.
  denominator := aDivisor // greatestCommonDivisor.
  
  denominator isOne ifTrue: [ ^numerator ].

  ^self new initializeWith: numerator over: denominator
  ! !