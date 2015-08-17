require 'capybara'

class InternalPage
	include Capybara::DSL, Capybara::RSpecMatchers

    def initialize(session)
        @session = session
    end

    def logout
	@session.visit 'https://test-ruby.ghost.io/ghost/signout/'
    end

    def ensure_is_internal_page
        using_wait_time 5 do
            page.should have_css('nav.global-nav')
        end
    end
end


