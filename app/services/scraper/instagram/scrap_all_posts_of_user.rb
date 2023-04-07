module Scraper
  module Instagram
    class ScrapAllPostsOfUser < InstagramApplicationService
      def initialize(browser, scrapping_dir)
        @browser = browser
        @scrapping_dir = scrapping_dir
      end

      def perform
        @scrapping_dir = "#{@scrapping_dir}/Posts"
        Dir.mkdir(@scrapping_dir) unless File.exist?(@scrapping_dir)

        browser_links = @browser.links
        post_links = browser_links.select{|l| l.href.include?("/p/") }

        post_details = ["------------ Total #{browser_links.length} Links Found ------------"]
        post_details << "------------ Total #{post_links.length} Links are related to Posts ------------"
        post_details << "------------ Processes Links ------------"

        post_links.each_with_index{ |link, index| post_details.push("#{ index + 1 }) #{link.href}") }
        File.open("#{@scrapping_dir}/posts-link-details.txt", 'wb') { |f| f.write(post_details.join("\n")) }

        post_links.each_with_index do |link, index|
          post_dir = "#{@scrapping_dir}/Post-#{ index + 1 }"
          Dir.mkdir(post_dir) unless File.exist?(post_dir)
          ManageIndividualPost.perform(post_dir, link)
        end
      end
    end
  end
end
