# cucumber-capybara-ghost

Some tests for Ghost (blogging plathorm) using Cucumber, Capybara, Page Object.
Test object: Ghost is an open source publishing platform (https://ghost.org/)


# Requirements:

Ruby
bundle
Browser drivers added to your Path or at least the last version of Firefox is installed.

# How to get started:

$ git clone https://github.com/mkpythonanywhereblog/cucumber-capybara-ghost.git

$ cd cucumber-capybara-ghost

$ bundle install

$ bundle exec cucumber                       // to run with firefox

$ bundle exec cucumber browser=chrome        // to run with chrome, you can use another browser If you wish

$ bundle exec cucumber --tags @slow          // to run tests marked with tags

$ bundle exec cucumber --tags @slow          // to run tests marked with tags


generate test results report in html format:

$ bundle exec cucumber browser=chrome features --format html --out reports.html --format pretty

