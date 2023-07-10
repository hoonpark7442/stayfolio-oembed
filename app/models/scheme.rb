class Scheme < ApplicationRecord
  belongs_to :provider

  scope :scheme_column_select, -> {
    select(:id, :url, :provider_id)
  }

  def regexed_url
    full, scheme, domain, path = *self.url.match(%r{([^:]*)://?([^/?]*)(.*)})

    return nil if domain.nil? || path.nil?
    
    domain = Regexp.escape(domain).gsub("\\*", "(.*?)").gsub("(.*?)\\.", "([^\\.]+\\.)?")
    path = Regexp.escape(path).gsub("\\*", "(.*?)")
    
    Regexp.new("^#{Regexp.escape(scheme)}://#{domain}#{path}")
  end
end
