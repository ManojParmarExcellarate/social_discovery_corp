module Scraper
  module Instagram
    class ManageIndividualPost < InstagramApplicationService
      def initialize(scrapping_dir, link)
        @scrapping_dir = scrapping_dir
        @link = link
      end

      def perform
        client = Selenium::WebDriver::Remote::Http::Default.new
        browser = Watir::Browser.new :chrome, http_client: client, options: OPTIONS
        
        # CreateSession.perform(browser, {
        #   email: 'souqhfbtesting@gmail.com',
        #   username: 'souqh_testing',
        #   password: 'Pass@123'
        # })
        browser.goto(@link.href)
        sleep(10)
        puts "----------- visiting #{@link.href} -----------"

        5.times { browser.send_keys(:space) }
        # ExpandViewMoreSection.perform(browser)
        browser.window.maximize
        FullPageScreenshot.perform(browser, @scrapping_dir)
        browser.close
      end
    end
  end
end
