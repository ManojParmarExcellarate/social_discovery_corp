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

        screen_width  = browser.execute_script("return Math.max(document.body.scrollWidth,document.body.offsetWidth,document.documentElement.clientWidth,document.documentElement.scrollWidth,document.documentElement.offsetWidth);")
        screen_height = browser.execute_script("return Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);")
        browser.window.resize_to(screen_width + 250, screen_height + 250) 
        File.open("#{@scrapping_dir}/screenshot.png", 'wb') { |f| f.write(Base64.decode64(browser.screenshot.base64)) }
        browser.close
      end
    end
  end
end
