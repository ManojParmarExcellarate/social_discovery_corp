module Scraper
  module Facebook
    class ExpandViewMoreSection < FacebookApplicationService
      def initialize(browser)
        @browser = browser
      end

      def perform
        begin
          while @browser.div(css: '.x1w0mnb').present?
            @browser.div(css: '.x1w0mnb').click
          end
        rescue => exception
          puts '---------- Exception ExpandViewMoreSection ----------'
          puts exception.message
          puts '---------- Exception ExpandViewMoreSection ----------'
        end
      end
    end
  end
end
