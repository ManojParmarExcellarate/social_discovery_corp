module Scraper
	module Facebook
		class InitiateScraping < ApplicationService
			def initialize(profile_link, credentials = {}, timestamp)
				@profile_link = profile_link
				@credentials = credentials
				@timestamp = timestamp
			end

			def perform
			end
		end
	end
end
