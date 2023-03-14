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
        while scroll_again do
          no_of_scrolls += 1
          puts "---- Scrolling #{no_of_scrolls} ----"
          @browser.send_keys :space
          sleep(3)
          screen_height_new = @browser.execute_script("return Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);")
          scroll_again = (screen_height_new > screen_height_old && no_of_scrolls >= 100)
          screen_height_old = screen_height_new
        end
        
        @scrapping_dir = "#{@scrapping_dir}/FullProfile"
        Dir.mkdir(@scrapping_dir) unless File.exist?(@scrapping_dir)
        
        FullPageScreenshot.perform(@browser, @scrapping_dir)
      end
    end
  end
end
