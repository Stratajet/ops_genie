require "ops_genie/helper"
require "ops_genie/alert"

module OpsGenie
	class Configuration; attr_accessor :api_key, :base_url, :release_stage, :alert_release_stages; end

  class << self
    attr_accessor :configuration

	  def configure
	    self.configuration ||= Configuration.new
	    self.configuration.release_stage ||= (Rails.env if defined? Rails)
	    yield(configuration)
	  end
	end
end