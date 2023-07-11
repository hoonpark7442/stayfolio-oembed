require "rails_helper"

RSpec.describe Oembed::Url::Builder, type: :service do
	let(:endpoint) { "https://www.youtube.com/oembed" }
	let(:param) { "https://www.youtube.com/watch?v=dBD54EZIrZo" }

	describe "#call" do
		it "oembed 요청용 endpoint url을 빌드한다." do
			result = described_class.call(endpoint, param)
			expected_url = "https://www.youtube.com/oembed?url=#{CGI.escape(param)}&format=json"

			expect(result).to eq(URI.parse(expected_url))
		end
	end
	
end