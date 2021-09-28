# Bank Tech Test
## Makers week 10

### Instructions

The app runs in IRB, load bank.rb from the project root directory
Recommended IRB flags: `irb --simple-prompt --noecho -r './bank.rb'`

Interact with your account using
* `@account.deposit [value]` to make deposits
* `@account.withdraw [value]` to make withdrawals
* `@account.show_statement` to view the current account statement

Exit with `exit`

### Classes

**Account**
* properties
    * -@statement
    * -@balance
* public methods
    * +deposit()
    * +withdraw()
    * +show_statement()
* private methods
    * -check_input()
    * -check_sufficient_funds()
    * -show_welcome_message()

**Transaction**
* properties
    * +@date
    * +@credit
    * +@debit
    * +@balance

**Statement**
* properties
    * -@transactions
* public methods
    * +add()
    * +show()
* private_methods
    * -check_transactions()
    * -decimal()
    * -euro_date()
    * -print_header()
    * -print_row()

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
