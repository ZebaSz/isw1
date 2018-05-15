!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:30:52'!
test21_01TransferIsReachedFromTransacctions

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:27:01'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !


!PortfolioTest methodsFor: 'test support' stamp: 'HAW 9/25/2017 21:44:47'!
accountSummaryLinesOf: aReceptiveAccount 
	
	^aReceptiveAccount accountSummary! !

!PortfolioTest methodsFor: 'test support' stamp: 'SAS 5/14/2018 18:46:11'!
accountTransferNetOf: aReceptiveAccount 
	^aReceptiveAccount transferNet! !

!PortfolioTest methodsFor: 'test support' stamp: 'SAS 5/14/2018 18:45:58'!
investmentEarningsOf: aReceptiveAccount
	^aReceptiveAccount investmentEarnings! !

!PortfolioTest methodsFor: 'test support' stamp: 'SAS 5/14/2018 18:44:47'!
investmentNetOf: aReceptiveAccount
	^aReceptiveAccount investmentNet! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 9/6/2016 19:43'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	self shouldBeImplemented ! !

!PortfolioTest methodsFor: 'test support' stamp: 'HernanWilkinson 9/6/2016 19:43'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	self shouldBeImplemented ! !


!classDefinition: #AccountMethodObject category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountMethodObject
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:23:33'!
initializeFor: aPortfolio
	portfolio := aPortfolio.! !

!AccountMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:22:59'!
portfolioValue: aPortfolio
	self subclassResponsibility.! !

!AccountMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:23:16'!
receptiveAccountValue: aReceptiveAccount
	self subclassResponsibility.! !

!AccountMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:22:45'!
value
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountMethodObject class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountMethodObject class
	instanceVariableNames: ''!

!AccountMethodObject class methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:23:54'!
for: aPortfolio
	^self new initializeFor: aPortfolio.! !


!classDefinition: #PortfolioTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
AccountMethodObject subclass: #PortfolioTreePrinter
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


!classDefinition: #ReversePortfolioTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
AccountMethodObject subclass: #ReversePortfolioTreePrinter
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'SAS 5/14/2018 18:05:12'!
call: aMethodObject
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 19:33:37'!
applyOn: aBalance
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account duration rate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:25:19'!
applyOn: aBalance
	^aBalance - value.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:41:20'!
call: aMethodObject
	aMethodObject certificateOfDepositValue: self.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:39:04'!
duration
	^duration.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 20:43:42'!
initializeFor: aValue during: aNumberOfDays at: aTna 
	value := aValue.
	duration := aNumberOfDays.
	rate := aTna.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:39:11'!
rate
	^rate.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 20:49:51'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'SAS 5/10/2018 20:42:33'!
for: aValue during: aNumberOfDays at: aTna
	^self new initializeFor: aValue during: aNumberOfDays at: aTna.! !

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'SAS 5/14/2018 18:25:48'!
register: aValue during: aNumberOfDays at: aTna on: account
	
	|certificate|
	
	certificate := self for: aValue during: aNumberOfDays at: aTna.
	
	account register: certificate.
	
	^certificate.! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !

!Deposit methodsFor: 'initialization' stamp: 'SAS 5/10/2018 19:53:15'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer.! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 19:35:01'!
applyOn: aBalance 
	^aBalance + value.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:32:19'!
call: aMethodObject
	^aMethodObject depositValue: self.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 19:56:32'!
transfer
	^transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'SAS 5/10/2018 19:53:46'!
for: aValue from: aTransfer

	^ self new initializeFor: aValue from: aTransfer.! !

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:41'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !

!Deposit class methodsFor: 'instance creation' stamp: 'SAS 5/10/2018 19:53:32'!
register: aValue on: account from: aTransfer

	| withdraw |
	
	withdraw := self for: aValue from: aTransfer.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #TransferTransaction category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:07:02'!
initializeFor: aTransfer
	transfer := aTransfer.! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:07:29'!
transfer
	^transfer.! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:17:09'!
value
	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:07:18'!
for: aTransfer
	^self new initializeFor: aTransfer.! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:17:41'!
applyOn: aBalance 
	^aBalance + self value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:33:53'!
call: aMethodObject
	^aMethodObject transferDepositValue: self.! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:16:44'!
applyOn: aBalance
	^aBalance - self value.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:33:30'!
call: aMethodObject
	^aMethodObject transferWithdrawValue: self.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !

!Withdraw methodsFor: 'initialization' stamp: 'SAS 5/10/2018 19:52:47'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer.! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 20:55:57'!
applyOn: aBalance
	^aBalance - value.
	! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:33:00'!
call: aMethodObject
	^aMethodObject withdrawValue: self.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 19:56:37'!
transfer
	^transfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'SAS 5/10/2018 19:51:35'!
for: aValue from: aTransaction

	^ self new initializeFor: aValue from: aTransaction.! !

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !

!Withdraw class methodsFor: 'instance creation' stamp: 'SAS 5/10/2018 19:51:55'!
register: aValue on: account from: aTransaction

	| withdraw |
	
	withdraw := self for: aValue from: aTransaction.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
manages: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
registers: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!
manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'SAS 5/15/2018 18:26:16'!
balance
	^ (Balance for: self) value! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
manages: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
registers: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:27:12'!
accountSummary
	^(AccountSummary for: self) value.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:53:55'!
eachTransactionDo: aMethodObject
	self transactions do: [ :transaction |
		transaction call: aMethodObject ].! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:57:36'!
investmentEarnings
	^(InvestmentEarnings for: self) value! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:49:53'!
investmentNet
	^(InvestmentNet for: self) value.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:51:45'!
transferNet
	^(TransferNet for: self) value.! !


!classDefinition: #TransactionMethodObject category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #TransactionMethodObject
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:16:30'!
account
	^account! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:14:39'!
certificateOfDepositValue: aCertificateOfDeposit
	self subclassResponsibility.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:14:36'!
depositValue: aDeposit
	self subclassResponsibility.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:13:40'!
initializeFor: aReceptiveAccount 
	account := aReceptiveAccount.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:14:14'!
transferDepositValue: aTransferDeposit
	self subclassResponsibility.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:14:10'!
transferWithdrawValue: aTransferWithdraw
	self subclassResponsibility.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:13:57'!
value
	self subclassResponsibility.! !

!TransactionMethodObject methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:14:06'!
withdrawValue: aWithdraw
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionMethodObject class' category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject class
	instanceVariableNames: ''!

!TransactionMethodObject class methodsFor: 'instance creation' stamp: 'SAS 5/15/2018 18:13:40'!
for: aReceptiveAccount 
	^self new initializeFor: aReceptiveAccount.! !


!classDefinition: #AccountSummary category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject subclass: #AccountSummary
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:40:11'!
certificateOfDepositValue: aCertificateOfDeposit
	lines add: 'Plazo fijo por ', aCertificateOfDeposit value printString,
		' durante ', aCertificateOfDeposit duration printString ,
		' dias a una tna de ', (aCertificateOfDeposit rate * 100) printString, '%'.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:35:20'!
depositValue: aDeposit
	lines add: 'Deposito por ', aDeposit value printString! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:35:14'!
transferDepositValue: aTransferDeposit
	lines add: 'Transferencia por ', aTransferDeposit value printString! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:35:05'!
transferWithdrawValue: aTransferWithdraw
	lines add: 'Transferencia por ', aTransferWithdraw value negated printString! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:21:44'!
value
	
	lines := OrderedCollection new.
	
	self account eachTransactionDo: self.
	
	^lines.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:34:49'!
withdrawValue: aWithdraw
	lines add: 'Extraccion por ', aWithdraw value printString! !


!classDefinition: #Balance category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject subclass: #Balance
	instanceVariableNames: 'sum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:25:12'!
certificateOfDepositValue: aCertificateOfDeposit
	sum := sum - aCertificateOfDeposit value! !

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:25:28'!
depositValue: aDeposit
	sum := sum + aDeposit value! !

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:25:42'!
transferDepositValue: aTransferDeposit
	sum := sum + aTransferDeposit value! !

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:25:48'!
transferWithdrawValue: aTransferWithdraw
	sum := sum - aTransferWithdraw value! !

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:24:43'!
value
	
	sum := 0.
	
	self account eachTransactionDo: self.
	
	^sum.! !

!Balance methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:25:57'!
withdrawValue: aWithdraw
	sum := sum - aWithdraw value! !


!classDefinition: #InvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject subclass: #InvestmentEarnings
	instanceVariableNames: 'sum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 19:01:47'!
certificateOfDepositValue: aCertificateOfDeposit
	sum := sum + (aCertificateOfDeposit value * (aCertificateOfDeposit duration * aCertificateOfDeposit rate / 360)).! !

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:54:45'!
depositValue: aDeposit
	"No es una inversion"! !

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:54:45'!
transferDepositValue: aTransferDeposit
	"No es una inversion"! !

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:54:45'!
transferWithdrawValue: aTransferWithdraw
	"No es una inversion"! !

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:21:48'!
value
	
	sum := 0.
	
	self account eachTransactionDo: self.
	
	^sum.! !

!InvestmentEarnings methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:54:45'!
withdrawValue: aWithdraw
	"No es una inversion"! !


!classDefinition: #InvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject subclass: #InvestmentNet
	instanceVariableNames: 'sum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:44:01'!
certificateOfDepositValue: aCertificateOfDeposit
	sum := sum + aCertificateOfDeposit value! !

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:43:46'!
depositValue: aDeposit
	"No es una inversion"! !

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:43:43'!
transferDepositValue: aTransferDeposit
	"No es una inversion"! !

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:43:38'!
transferWithdrawValue: aTransferWithdraw
	"No es una inversion"! !

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:21:52'!
value
	
	sum := 0.
	
	self account eachTransactionDo: self.
	
	^sum.! !

!InvestmentNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:43:35'!
withdrawValue: aWithdraw
	"No es una inversion"! !


!classDefinition: #TransferNet category: #'PortfolioTreePrinter-Ejercicio'!
TransactionMethodObject subclass: #TransferNet
	instanceVariableNames: 'sum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:50:44'!
certificateOfDepositValue: aCertificateOfDeposit
	"No es una transferencia"! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:50:38'!
depositValue: aDeposit
	"No es una transferencia"! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:50:57'!
transferDepositValue: aTransferDeposit
	sum := sum + aTransferDeposit value! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:48:57'!
transferWithdrawValue: aTransferWithdraw
	sum := sum - aTransferWithdraw value! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/15/2018 18:21:56'!
value
	
	sum := 0.
	
	self account eachTransactionDo: self.
	
	^sum.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:48:23'!
withdrawValue: aWithdraw
	"No es una transferencia"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'SAS 5/14/2018 18:48:09'!
from: aReceptiveAccount 
	^self new initializeFrom: aReceptiveAccount.! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:09:57'!
initializeFor: aValue withDeposit: aTransferDesposit withWithdraw: aTransferWithdraw
	value := aValue.
	deposit := aTransferDesposit.
	withdraw := aTransferWithdraw.
! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SAS 5/10/2018 19:57:17'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'SAS 5/14/2018 18:12:59'!
register: aValue from: sourceAccount to: destinationAccount
	
	|transfer deposit withdraw|
	
	transfer := self new.
	
	deposit := TransferDeposit register: transfer on: destinationAccount.
	withdraw := TransferWithdraw register: transfer on: sourceAccount.
	
	transfer initializeFor: aValue withDeposit: deposit withWithdraw: withdraw.
	
	^transfer.! !
