require "json"
require "net/http"
require "uri"

module OpsGenie
	class Alert
		extend Helper

		class << self 
			def create params
				http_post("/v1/json/alert", params) if should_alert?
			end
		end

	end
end