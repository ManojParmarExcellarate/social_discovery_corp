module Scraper
  module Facebook
    class InitiateScraping < FacebookApplicationService
      def initialize(profile_link, credentials = {}, timestamp, date_filter)
        @profile_link = profile_link
        @credentials = {
          email: 'souqhfbtesting@gmail.com',
          password: 'Pass@123'
        }

        # @credentials = {
        #   email: 'manoj.parmar@excellarate.com',
        #   password: 'SOcialDiscovery@2023'
        # }

        @timestamp = timestamp
        @date_filter = date_filter
        @browser = Watir::Browser.new :chrome, options: OPTIONS
        # @browser = Watir::Browser.new :firefox #, options: OPTIONS
        @scrapping_dir = "#{Rails.public_path}/FACEBOOK_SCRAPPING/#{@profile_link.split('/').last}-#{@timestamp}"
        Dir.mkdir(@scrapping_dir) unless File.exist?(@scrapping_dir)
      end

      def perform
        CreateSession.perform(@browser, @credentials)
        @browser.goto(@profile_link)
        # ApplyDateFilter.perform(@browser, @date_filter)
        sleep(3)
        
        TakeProfileFullScreenshot.perform(@browser, @scrapping_dir)
        ScrapAllPostsOfUser.perform(@browser, @scrapping_dir)
        @browser.close
      end
    end
  end
end
