require Rails.root.join("app/lib/seeder")

file = File.read('./data/providers.json')

providers = JSON.parse(file)

# 데이터 멱등성을 위해 해당 클래스를 통해서만 데이터 등록
seeder = Seeder.new

seeder.create_if_none(Provider) do
	providers.each do |data|
		data["endpoints"].each do |endpoint|
			provider = Provider.create!(
				name: data["provider_name"],
				endpoint: endpoint["url"]
			)

			if endpoint["schemes"].nil? 
				Scheme.create!(
					url: data["provider_url"],
					provider: provider
				)
			else
				endpoint["schemes"].each do |url|
					Scheme.create!(
						url: url,
						provider: provider
					)
				end
			end
		end
	end
end


