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

**Bank**
* App entrypoint, only
    * requires other classes
    * instantiates a new account

### Testing / Code Quality

**Achieved**
* unit and feature tests with rspec
* 100% coverage according to simplecov
* linted with rubocop
* test driven
* tested behaviour as far as possible
* classes are quite discreet
* tests used mocking where necessary
* naming is decent and semantic I think
* methods are short - refactored in to private methods where needed

**To improve**
* I did find I was testing a lot of exact strings, which, while not "state", doesn't exactly seem _good_, but I found it a bit difficult to avoid with an IRB-based program
* The line between unit and feature tests is definitely blurred
* a bit of duplication between statement.show() and account.show_statement methods, but:
    * considered it the price to pay for minimizing accessors and keeping class responsibilities clear

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
