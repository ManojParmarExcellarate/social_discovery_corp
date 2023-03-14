module Scraper
  module Facebook
    class TakeProfileFullScreenshot < FacebookApplicationService
      def initialize(browser, scrapping_dir)
        @browser = browser
        @scrapping_dir = scrapping_dir
      end

      def perform
        (1..5).each do |click|    
          puts "---- Scrolling #{click} ----"
          @browser.send_keys :space
          sleep(2)
        end
        
        @scrapping_dir = "#{@scrapping_dir}/FullProfile"
        Dir.mkdir(@scrapping_dir) unless File.exist?(@scrapping_dir)
        
        FullPageScreenshot.perform(@browser, @scrapping_dir)
      end
    end
  end
end
