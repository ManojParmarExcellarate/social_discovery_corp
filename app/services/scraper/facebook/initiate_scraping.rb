module Scraper
  module Facebook
    class InitiateScraping < FacebookApplicationService
      def initialize(profile_link, credentials = {}, timestamp, date_filter)
        @profile_link = profile_link
        @credentials = {
          email: 'souqhfbtesting@gmail.com',
          password: 'Pass@123'
        }
        @timestamp = timestamp
        @date_filter = date_filter
        @browser = Watir::Browser.new :chrome, options: OPTIONS
      end

      def perform
        CreateSession.perform(@browser, @credentials)
        @browser.goto(@profile_link)
        ApplyDateFilter.perform(@browser, @date_filter)
        sleep(3)
        
        (1..5).each do |click|    
          puts "---- Scrolling #{click} ----"
          @browser.send_keys :space
          sleep(2)
        end
        
        FullPageScreenshot.perform(@browser, 'FullProfile')
        @browser.close
      end
    end
  end
end
