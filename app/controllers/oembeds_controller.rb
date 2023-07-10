class OembedsController < ApplicationController
  def index
  end

  def search
    provider = Providers::Finder.find_by_url_matching_with_schemes(params[:url])

    if provider
      # provider endpoint와 url param 으로 oembed용 url 빌드
      oembed_endpoint = Oembed::Url::Builder.call(provider.endpoint, params[:url])
      
      @result = Oembed::Fetcher.call(oembed_endpoint)
    else
      raise Oembed::Errors::OembedNotFound
    end

    @result
  rescue => e
    redirect_to root_path, alert: e.message
  end
end
