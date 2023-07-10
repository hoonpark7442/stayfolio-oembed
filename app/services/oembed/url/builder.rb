module Oembed
	module Url
		class Builder
			SUPPORTED_FORMAT = "json"

			def initialize(endpoint, raw_url)
				@endpoint = endpoint
				@raw_url = raw_url
			end

			def self.call(...)
				new(...).call
			end

			def call
				query={}
				query[:format] = SUPPORTED_FORMAT
				query[:url] = CGI.escape(@raw_url)

				query = "?" + query.inject("") do |memo, (key, value)|
	        "#{key}=#{value}&#{memo}"
	      end.chop

	      if @endpoint.include?("{format}")
	      	@endpoint.gsub!("{format}", SUPPORTED_FORMAT)
	      end

	      URI.parse(@endpoint + query)
			end
		end
	end
end