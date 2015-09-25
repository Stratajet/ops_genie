require "core_extensions/string"
require "core_extensions/hash"
module OpsGenie
	module Helper

		def should_alert?
      OpsGenie.configuration.release_stage.nil? || 
      OpsGenie.configuration.alert_release_stages.nil? || 
      OpsGenie.configuration.alert_release_stages.include?(OpsGenie.configuration.release_stage)
    end

	  def http_post endpoint, params
	  	uri = URI(File.join(OpsGenie.configuration.base_url, endpoint))
	  	http = Net::HTTP.new(uri.host, uri.port)
	    http.use_ssl = true
	    JSON.parse(http.post(uri.path, ops_params(params)).body)
	  end

	  private 		
	  def ops_params params
	  	params.merge!(api_key: OpsGenie.configuration.api_key)
	  	camelize_keys_recursive!(params).to_json
	  end

		def camelize_keys_recursive!(hash)
	    if hash.is_a?(Array)
	      hash.each {|h| h.camelize_lower_keys!} 
	    else
	      hash.camelize_lower_keys!
	      hash.each { |k, v|  camelize_keys_recursive!(v) if (v.is_a?(Hash) || v.is_a?(Array)) }
	    end
	    hash
  	end

	end
end