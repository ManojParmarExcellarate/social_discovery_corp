module Scraper
  module Instagram
    class CreateSession < InstagramApplicationService
      def initialize(browser, credentials)
        @browser = browser
        @credentials = credentials
      end

      def perform
        @browser.goto('https://www.instagram.com/')
        sleep(2)
        return unless @browser.text_field(name: 'username').present?
        @browser.text_field(name: 'username').set(@credentials[:username])
        @browser.text_field(name: 'password').set(@credentials[:password])
        @browser.buttons[1].click
        sleep(15)
      end
    end
  end
end
