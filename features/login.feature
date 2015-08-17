Feature: Login
Scenario Outline: Should login with valid credentials
Given I am on the signin page
When I enter "<email>" and "<password>" and submit
Then internal page is returned

Examples:
    | email               | password  |
    | saga9119@gmail.com  | Qwer12345 |
    | nn575073t@gmail.com | password  |



Scenario Outline: Should not login with invalid credentials
Given I am on the signin page
When I enter "<email>" and "<password>" and submit
Then signin page is returned
And "<error message>" is present

Examples:
    | email                | password      | error message                             |
    | incorrect@gmail.com  | incorrectpass | There is no user with that email address. |
    | incorrect@gmail.com  | Qwer12345     | There is no user with that email address. | 
    | saga9119@gmail.com   | incorrectpass | Your password is incorrect.               | 
    | incorrect@gmail.com  |               | Please enter a password                   | 
    |                      | incorrectpass | Invalid Email                             | 
    | saga9119@gmail.com   |               | Please enter a password                   |
    |                      | Qwer12345     | Invalid Email                             | 
    |                      |               | Invalid Email                             |
    |                      |               | Please enter a password                   |



Scenario Outline: Should have 5 attempts to login
Given I am on the signin page
When I enter "<email>" and "<password>" and submit
Then signin page is returned
And "<error message>" is present

Examples:
    | email                 | password       | error message         | 
    | nn575073t@gmail.com   | incorrectpass  | 4 attempts remaining! |
    | nn575073t@gmail.com   | incorrectpass1 | 3 attempts remaining! |
    | nn575073t@gmail.com   | incorrectpass2 | 2 attempts remaining! |
    | nn575073t@gmail.com   | incorrectpass3 | 1 attempt remaining!  |
 


