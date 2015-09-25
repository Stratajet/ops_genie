require 'ops_genie'
require 'webmock/rspec'
require 'rspec/expectations'


def have_sent_alert(&matcher)
  have_requested(:post, OpsGenie.configuration.base_url + "v1/json/alert").with do |request|
    if matcher
      matcher.call JSON.parse(request.body)
      true
    else
      raise "no matcher provided to have_sent_alert (did you use { })"
    end
  end
end