module Scraper
  module Instagram
    class CombineDevidedScreenshots < InstagramApplicationService
      def initialize(path_for_data)
        @path_for_data = path_for_data
      end

      def perform
        no_of_screens = Dir[File.join(@path_for_data, '**', '*')].count
        slots_of_10 = no_of_screens / 10
        slots_of_10 += 1 unless (no_of_screens % 10 ).zero?

        (1..slots_of_10).each do |slot|
          final_file_path = "#{@path_for_data}/full_page_screenshot-#{slot}.png"
          image_no = slot == 1 ? nil : ( slot - 1 )
          if File.exist?("#{@path_for_data}/#{image_no}2.png")
            system "convert #{@path_for_data}/#{image_no}1.png #{@path_for_data}/#{image_no}2.png -append #{final_file_path}"
          end
          remaining_no_of_screens = if (no_of_screens % 10 > 0) && slots_of_10 == slot
            no_of_screens % 10
          else
            10 
          end
              
          (remaining_no_of_screens > 2) && (3..remaining_no_of_screens).each do |screenshot|
            screenshot_number = image_no.present? && (screenshot % 10).zero? ? 0 :screenshot
            system "convert #{final_file_path} #{"#{@path_for_data}/#{image_no}#{screenshot_number}.png"} -append #{final_file_path}"
          end
        end
      end
    end
  end
end