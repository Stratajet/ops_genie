require "core_extensions/string"
module OpsGenie
	module Helper

	  def http_post uri, params
	  	http = Net::HTTP.new(uri.host, uri.port)
	    http.use_ssl = true
	    JSON.parse(http.post(uri.path, ops_params(params)).body)
	  end

	  private 		
	  def ops_params params
	  	Hash[params.merge({api_key: OpsGenie.configuration.api_key}).map { |k,v| [k.to_s.lcamelize, v] }].to_json
	  end
	end
end