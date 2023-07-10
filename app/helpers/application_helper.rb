module ApplicationHelper

	def html_sanitizer(html)
		return "" if html.nil?
		sanitize(html)
	end
end
