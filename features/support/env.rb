require 'capybara/cucumber'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
require 'capybara/rspec'

"""
Capybara.default_driver = :selenium ===>> firefox

To run tests in another browser:
$ bundle exec cucumber browser=chrome
$ bundle exec cucumber browser=phantomjs
                 
"""

Capybara.register_driver :selenium do |app|
    browser = (ENV['browser'] || 'firefox').to_sym
    Capybara::Selenium::Driver.new(app, :browser => browser)
  end
  Capybara.default_driver = :selenium



