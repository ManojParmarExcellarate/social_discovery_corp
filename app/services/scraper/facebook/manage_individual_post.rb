module Scraper
  module Facebook
    class ManageIndividualPost < FacebookApplicationService
      def initialize(scrapping_dir, link)
        @scrapping_dir = scrapping_dir
        @link = link
      end

      def perform
        browser = Watir::Browser.new :chrome, options: OPTIONS
        CreateSession.perform(browser, {
          email: 'souqhfbtesting@gmail.com',
          password: 'Pass@123'
        })

        browser.goto(@link.href)
        puts "----------- visiting #{@link.href} -----------"

        5.times { browser.send_keys(:space) }
        ExpandViewMoreSection.perform(browser)
        browser.window.maximize
        FullPageScreenshot.perform(browser, @scrapping_dir)
        browser.close
      end
    end
  end
end
