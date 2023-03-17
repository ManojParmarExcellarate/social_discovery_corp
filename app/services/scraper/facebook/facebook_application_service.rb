module Scraper
  module Facebook
    class FacebookApplicationService < ApplicationService
      PREF = {
        download: {
          prompt_for_download: false,
          prompt_for_notification: false,
          default_directory: '/path/to/dir'
        }
      }

      OPTIONS = {prefs: PREF, args: %w[--disable-notifications --start-maximized --headless]} #--headless
    end
  end
end
