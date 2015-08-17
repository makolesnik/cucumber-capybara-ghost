require File.join(File.dirname(__FILE__), 'pages', 'signin_page')
require File.join(File.dirname(__FILE__), 'pages', 'internal_page')
require File.join(File.dirname(__FILE__), 'pages', 'recovery_page')

include Capybara::DSL, Capybara::RSpecMatchers



When(/^I click Forgotten password\?$/) do
  @signin_page = SigninPage.new(Capybara.current_session)
  @signin_page.click_recovery_password
end

When(/^enter "(.*?)" and submit$/) do |email|
  @signin_page.enter_recovery_credentials(email)
end

Then(/^then I open gmail with "(.*?)":"(.*?)", find the email and click the link$/) do |email, password|
  @recovery_page = RecoveryPage.new(Capybara.current_session)
  @recovery_page.open(@recovery_page.get_link_from_gmail(email, password))
end

Then(/^then reset password page is returned$/) do
  @recovery_page.ensure_is_recovery_page
end

When(/^I open gmail with "(.*?)":"(.*?)", find the email and click the link$/) do |email, password|
  @recovery_page = RecoveryPage.new(Capybara.current_session)
  @recovery_page.open(@recovery_page.get_link_from_gmail(email, password))
end

When(/^reset password page is returned$/) do
  @recovery_page.ensure_is_recovery_page
end


When(/^I enter "(.*?)" twice and submit$/) do |blogpassword|
  @recovery_page.change_password(blogpassword)
end
	
