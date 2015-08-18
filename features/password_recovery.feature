Feature: Forgotten Password

@slow
Scenario Outline: Should receive link to recover the forgotten password
Given I logout
And I am on the signin page
When I click Forgotten password?
And enter "<email>" and submit
And I wait 60 seconds
And I open gmail with "<email>":"<password>", find the email and click the link
And reset password page is returned 
And I enter "<blogpassword>" twice and submit
Then internal page is returned


Examples:
    | email             | password   | blogpassword |
    | nn24086@gmail.com | Qwer123456 | p@ssword     |
	

Scenario Outline: The recovery link should be used only once
Given I logout 
And I open gmail with "<email>":"<password>", find the old email and click the expired link
When reset password page is returned 
And I enter "<blogpassword>" twice and submit
Then reset password page is returned
And "Invalid token" is present on the reset password page 

Examples:
    | email             | password   | blogpassword |
    | nn24086@gmail.com | Qwer123456 | p@ssword     |
