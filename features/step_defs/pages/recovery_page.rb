require 'capybara'



class RecoveryPage
	include Capybara::DSL, Capybara::RSpecMatchers

 
    def initialize(session)
        @session = session
    end

    def get_link_from_gmail(email, password)
	sleep 20
	    require 'mail'
	    require 'gmail'
            gmail = Gmail.new(email, password)
	    email = gmail.inbox.emails(:unread, :from => "hello@email.ghost.org").first 
	    message = email.html_part
	    mail = Mail.new(message)
	    mail.body.decoded
	    html = mail.decoded
	    links = /<a.*?href="(.+?)".*?>Click here to reset your password<\/a>/m.match(html)[0].gsub(/\s/, '')
	    link = links.split("ahref")[-1].split("\"")[1]
	    puts link
            return link
    end


    def open(url)
	@session.visit url
    end

 
    def change_password(blogpassword)
        fill_in('newpassword', :with => blogpassword)
	fill_in('ne2password', :with => blogpassword)
	click_button('Reset Password') 
    end

    def ensure_is_recovery_page
        using_wait_time 5 do
	    page.should have_css('form#reset.reset-form')
        end
    end

    def ensure_text_is_present(text)
        using_wait_time 5 do
            page.should have_content(text)
        end
    end

end


