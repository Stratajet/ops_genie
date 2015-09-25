require "json"
require "net/http"
require "uri"

module OpsGenie
	class Alert
		extend Helper

		class << self 
			def create params
				uri = URI(File.join(OpsGenie.configuration.base_url, "/v1/json/alert"))
				http_post(uri, params)
			end
		end

	end
end

# OpsGenie.configure { |config| config.api_key = '44cb8c4e-1215-47fa-8284-dd1a74fdc454'; config.base_url = 'https://api.opsgenie.com/'; }
# OpsGenie::Alert.create ({message:"Hello !", description:"blabla"})