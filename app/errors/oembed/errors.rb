module Oembed
	module Errors
		class Error < StandardError
    end

    class HTTPNotFound < Error
    	def initialize
	      msg = "HTTP 요청에 실패했습니다."
	      super(msg)
	    end
    end

    class OembedNotFound < Error
    	def initialize
	      msg = "요청하신 url의 OEmbed 데이터가 없습니다."
	      super(msg)
	    end
    end
	end
end