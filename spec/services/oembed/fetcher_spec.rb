require "rails_helper"
require 'webmock/rspec'

RSpec.describe Oembed::Fetcher, type: :service do
	let(:oembed_endpoint) { URI.parse("https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=dBD54EZIrZo&format=json") }
	let(:response_body) { File.open('./spec/fixtures/oemed_response_body.json') }

	describe "#call" do
		it "oembed endpoint로 request를 보낸다." do
			stub_request(:get, oembed_endpoint).to_return(status: 200, body: response_body)

			resp = described_class.call(oembed_endpoint) 
			expect(resp["title"]).to eq("test")
		end
	end
	
end