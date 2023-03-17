module Scraper
  module Facebook
    class CreateSession < FacebookApplicationService
      def initialize(browser, credentials)
        @browser = browser
        @credentials = credentials
      end

      def perform
        @browser.goto('https://www.facebook.com/')

        form = @browser.form(id: 'login_form')
        @browser.text_field(name: 'email').set(@credentials[:email])
        @browser.text_field(name: 'pass').set(@credentials[:password])
        @browser.button(name: 'login').click

        sleep(2)
      end
    end
  end
end
