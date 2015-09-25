require "spec_helper"

describe OpsGenie do
  describe "#configure" do
    before do
      OpsGenie.configure do |config|
        config.api_key = "key"
        config.base_url = 'https://api.opsgenie.com/'
      end
    end

    describe OpsGenie::Alert do

      before do
        stub_request(:post, "https://api.opsgenie.com/v1/json/alert").with(:body => "{\"message\":\"hello\",\"apiKey\":\"key\"}").to_return(:status => 200, :body => "{\"status\":\"successful\"}", :headers => {})
        
        stub_request(:post, "https://api.opsgenie.com/v1/json/alert")
          .with(:body => "{\"message\":\"hello\",\"randomField\":\"hello\",\"details\":{\"someDetails\":\"hello\"},\"apiKey\":\"key\"}")
          .to_return(:status => 200, :body => "{\"status\":\"successful\"}", :headers => {})
      end

      context "the alert_release_stages is not configured" do
        it "should send a request to the api with a message and an api_key" do
          OpsGenie::Alert.create({message: "hello"})

          expect(OpsGenie).to have_sent_alert{ |payload|
            expect(payload["apiKey"]).to eq("key")
            expect(payload["message"]).to eq("hello")
          }
        end

        it "should send a request to the api with camelized keys" do
          OpsGenie::Alert.create({message: "hello", random_field: "hello", details: {some_details: "hello"}})
          expect(OpsGenie).to have_sent_alert{ |payload| expect(payload["randomField"]).to eq("hello") }
        end


      end

      context "the release_stage is not in the alert_release_stages" do
        before do 
          OpsGenie.configuration.release_stage = "dev"
          OpsGenie.configuration.alert_release_stages = ["staging", "production"]
        end

        it "shouldn't send alerts" do
          expect(OpsGenie::Alert.create({message: "hello"})).not_to have_requested(:post, "https://api.opsgenie.com/v1/json/alert")
        end
      end

    end

  end
end