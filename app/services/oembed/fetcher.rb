require 'async'
require 'net/http'

module Oembed
	class Fetcher
		def initialize(oembed_endpoint)
			@oembed_endpoint = oembed_endpoint
		end

		def self.call(...)
			new(...).call
		end

		def call
			resp = fetch_async()

			JSON.parse(resp.result)
		end

		private 

		# async http request
		def fetch_async
			Async do
				res = Net::HTTP.get_response(@oembed_endpoint)
				
				case res
				when Net::HTTPSuccess
					res.body
				else
					raise Oembed::Errors::HTTPNotFound
				end
			end
		end
	end
end