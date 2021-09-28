# Bank Tech Test
## Makers week 10

### Instructions

The app runs in IRB, load bank.rb from the project root directory
Recommended IRB flags: `irb --simple-prompt --noecho -r './bank.rb'`

Interact with your account using
* `@account.deposit [value]` to make deposits
* `@account.withdraw [value]` to make withdrawals
* `@account.statement.show` to view the current account statement

Exit with `exit`

### Classes

**Account**
* +@statement
* -@balance
* +deposit()
* +withdraw()

**Transaction**
* +@date
* +@credit
* +@debit
* +@balance

**Statement**
* -@transactions
* +show()

### User journey

* A user opens a **new Account** with a **balance** (default: 0)
* The account **balance** is set to `balance`, and a **new Statement** is created
* They **deposit** an integer amount of `100`
* `100` is added to the account `@balance`
* A **new Transaction** is created with:
    * @date = `Date.now`
    * @credit = `100`
    * @debit = nil
    * @balance = `account @balance`
* The **transaction** is added to the **account @statement**
* The user asks to **print** their **account.statement**
* Each transaction of **@transactions** is shown in table 

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date        || credit       || debit        || balance
14/01/2023  ||              || 500.00       || 2500.00
13/01/2023  || 2000.00      ||              || 3000.00
10/01/2023  || 1000.00      ||              || 1000.00
```
