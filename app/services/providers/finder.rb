module Providers
	class Finder
		BATCH_SIZE = 100
		class << self
			def find_by_url_matching_with_schemes(url)
				# 굳이 provider.all로 모든 provider를 갖고 와 메모리에 로드할 필요없다. 어차피 url param으로 비교해서 찾을 건 schemes에 있는 url들이고, 하나 찾으면 그때 provider 갖고 오면 충분하다.
				# batch로 메모리 consumption 최대한 줄인다.
				scheme = Scheme.scheme_column_select.find_each(batch_size: BATCH_SIZE).detect{ |sch| sch.regexed_url&.match?(url) }

				scheme&.provider
			end
		end
	end
end