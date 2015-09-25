require "ops_genie/helper"
require "ops_genie/alert"

module OpsGenie
	class Configuration; attr_accessor :api_key, :base_url; end

  class << self
    attr_accessor :configuration

	  def configure
	    self.configuration ||= Configuration.new
	    yield(configuration)
	  end
	end
end