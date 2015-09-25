OpsGenie.configure do |config|
  config.api_key = "your api key"
  config.base_url = 'https://api.opsgenie.com/'

  # Optional : 
  # config.release_stage = "something" # Will automatically be setup to Rails.env if you use Rails
  # config.alert_release_stages = ["production", "staging"] # Only send alerts on those release stages. If not set, it will always send alerts
end