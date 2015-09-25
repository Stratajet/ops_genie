module OpsGenie
	module Generators
		class InstallGenerator < Rails::Generators::Base
	    source_root File.expand_path("../../templates", __FILE__)
	    desc "Creates OpsGenie initializer for your application"

	    def copy_initializer
	      template "ops_genie_initializer.rb", "config/initializers/ops_genie.rb"

	      puts "Created a configuration file in config/initializers/ops_genie.rb. Don't forget to set your API key!"
	    end
	  end
	end
end