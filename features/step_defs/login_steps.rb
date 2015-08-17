require 'capybara'
require File.join(File.dirname(__FILE__), 'pages', 'signin_page')
require File.join(File.dirname(__FILE__), 'pages', 'internal_page')

include Capybara::DSL, Capybara::RSpecMatchers


Given(/^I am on the signin page$/) do
  @internal_page = InternalPage.new(Capybara.current_session)
  @internal_page.logout
  @signin_page = SigninPage.new(Capybara.current_session)
  @signin_page.open
end

When(/^I enter "(.*?)" and "(.*?)" and submit$/) do |email, password|
  @signin_page.signin(email, password)
end

Then(/^internal page is returned$/) do
  @internal_page = InternalPage.new(Capybara.current_session)
  @internal_page.ensure_is_internal_page
end

Then(/^signin page is returned$/) do
  @signin_page = SigninPage.new(Capybara.current_session)
  @signin_page.ensure_is_signin_page
end
 
Then(/^"(.*?)" is present$/) do |text|
  @signin_page.ensure_text_is_present(text)
end

