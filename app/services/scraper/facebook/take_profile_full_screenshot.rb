module Scraper
  module Facebook
    class TakeProfileFullScreenshot < FacebookApplicationService
      def initialize(browser, scrapping_dir)
        @browser = browser
        @scrapping_dir = scrapping_dir
      end

      def perform
        screen_height_old = @browser.execute_script("return Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);")
        no_of_scrolls = 0
        scroll_again = true
        puts "---- Scrolling started to fetch posts ----"
        while scroll_again do
          no_of_scrolls += 1
          (3 + ((no_of_scrolls / 2))).times { @browser.send_keys(:space) }
          sleep(3)
          screen_height_new = @browser.execute_script("return Math.max(
            document.body.scrollHeight,
            document.body.offsetHeight,
            document.documentElement.clientHeight,
            document.documentElement.scrollHeight,
            document.documentElement.offsetHeight
          );")
          scroll_again = (screen_height_new > screen_height_old && no_of_scrolls <= 100)
          screen_height_old = screen_height_new
        end
        puts "---- Scrolling done for #{no_of_scrolls} of times ----"
        
        @scrapping_dir = "#{@scrapping_dir}/FullProfile"
        Dir.mkdir(@scrapping_dir) unless File.exist?(@scrapping_dir)
        
        FullPageScreenshot.perform(@browser, @scrapping_dir)
      end
    end
  end
end
