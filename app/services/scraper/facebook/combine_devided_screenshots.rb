module Scraper
  module Facebook
    class CombineDevidedScreenshots < FacebookApplicationService
      def initialize(path_for_data)
        @path_for_data = path_for_data
      end

      def perform
        no_of_screens = Dir[File.join(@path_for_data, '**', '*')].count
        final_file_path = "#{@path_for_data}/full_page_screenshot.png"
        system "convert #{@path_for_data}/1.png #{@path_for_data}/2.png -append #{final_file_path}"

        (no_of_screens > 2) && (3..no_of_screens).each do |screenshot|
          system "convert #{final_file_path} #{"#{@path_for_data}/#{screenshot}.png"} -append #{final_file_path}"
        end
      end
    end
  end
end
