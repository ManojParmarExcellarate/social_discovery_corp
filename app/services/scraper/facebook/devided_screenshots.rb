module Scraper
  module Facebook
    class DevidedScreenshots < FacebookApplicationService
      def initialize(browser, dirname)
        @browser = browser
        @dirname = dirname
      end

      def perform
        @browser.execute_script('
          const collection = document.getElementsByClassName("xixxii4");
          for(var i = 0; i < collection.length; i++) { collection[i].classList.remove("xixxii4") }
          for(var i = 0; i < collection.length; i++) { collection[i].classList.remove("xixxii4") }
          for(var i = 0; i < collection.length; i++) { collection[i].classList.remove("xixxii4") }')
        
        begin
          @browser.execute_script('document.getElementsByClassName("x9f619 x1ja2u2z x1xzczws x7wzq59")[0].remove()')
        rescue => exception
          puts '---------- Exception DevidedScreenshots ----------'
          puts exception.message
          puts '---------- Exception DevidedScreenshots ----------'
        end

        screen_width = @browser.execute_script("return screen.width;")
        screen_height = @browser.execute_script("return Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);")

        image_browser_height = 1000

        no_of_screens = screen_height / image_browser_height;
        no_of_screens += 1 unless (screen_height % image_browser_height).zero?

        desired_height = screen_height / no_of_screens
        @browser.window.resize_to(screen_width, desired_height) 

        screen_width = @browser.execute_script("return window.scrollBy(0, -#{screen_height})")
        path_for_data = @dirname
        Dir.mkdir(path_for_data) unless File.exist?(path_for_data)

        puts "---------- Started taking #{no_of_screens} divided screenshots ----------"
        (1..no_of_screens).each do |no_of_screen|
          png = @browser.screenshot.base64
          File.open("#{path_for_data}/#{no_of_screen}.png", 'wb') { |f| f.write(Base64.decode64(png)) }
          sleep(2)
          @browser.execute_script("return window.scrollBy(0, #{desired_height})")
        end
        puts "Screenshots saved at #{path_for_data}"
        puts "---------- Done taking #{no_of_screens} divided screenshots ----------"
        path_for_data
      end
    end
  end
end
