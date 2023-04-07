module Scraper
  module Instagram
    class FullPageScreenshot < InstagramApplicationService
      def initialize(browser, dirname)
        @browser = browser
        @dirname = dirname
      end

      def perform
        path_for_data = DevidedScreenshots.perform(@browser, @dirname)
        CombineDevidedScreenshots.perform(path_for_data)
        path_for_data
      end
    end
  end
end
