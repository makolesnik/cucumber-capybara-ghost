Feature: Forgotten Password
Scenario Outline: Should receive link to recover the forgotten password
Given I am on the signin page
When I click Forgotten password?
And enter "<email>" and submit
Then "Please check your email for instructions." is present
And then I open gmail with "<email>":"<password>", find the email and click the link
And then reset password page is returned 

Examples:
    | email             | password    |
    | nn24086@gmail.com | Qwer123456  |



Scenario Outline: Should change password 
Given I am on the signin page
When I click Forgotten password?
And enter "<email>" and submit
And I open gmail with "<email>":"<password>", find the email and click the link
And reset password page is returned 
And I enter "<blogpassword>" twice and submit
Then internal page is returned

Examples:
    | email             | password   |blogpassword |
    | nn24086@gmail.com | Qwer123456 | p@ssword    |


