module Scraper
  module Instagram
    class InstagramApplicationService < ApplicationService
      PREF = {
        download: {
          prompt_for_download: false,
          prompt_for_notification: false,
          default_directory: '/path/to/dir'
        }
      }

      OPTIONS = {
        prefs: PREF,
        args: [
            '--disable-notifications',
            '--start-maximized',
            # '--user-data-dir=/home/synerzip/projects/sdc/social_discovery_corp/public/FACEBOOK_SCRAPPING/USER_DATA',
            # '--headless'
          ]
        }
    end
  end
end
