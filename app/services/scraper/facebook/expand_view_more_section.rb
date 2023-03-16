module Scraper
  module Facebook
    class ExpandViewMoreSection < FacebookApplicationService
      def initialize(browser)
        @browser = browser
      end

      def perform
        5.times do
          begin
            @browser.div(css: '.x1w0mnb').click
          rescue => exception
            puts '---------- Exception while clicking View More----------'
            puts exception.message
            puts '---------- Exception ----------'
          end
        end
      end
    end
  end
end
