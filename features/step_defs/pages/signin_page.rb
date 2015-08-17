require 'capybara'

class SigninPage
	include Capybara::DSL, Capybara::RSpecMatchers

    URL = 'https://test-ruby.ghost.io/ghost/signin/'   
  
    def initialize(session)
        @session = session
    end

    def open(url=URL)
	@session.visit url
    end

    def click_recovery_password
        click_button('Forgotten password?')
    end

    def enter_recovery_credentials(email)
        fill_in('email', :with => email)
	click_button('Send new password') 
    end
 
    def signin(email, password)
        fill_in('identification', :with => email)
	fill_in('password', :with => password)
	click_button('Log in') 
    end

    def ensure_is_signin_page
        using_wait_time 5 do
            page.should have_content('Forgotten password?')
        end
    end

    def ensure_text_is_present(text)
        using_wait_time 5 do
            page.should have_content(text)
        end
    end

end


