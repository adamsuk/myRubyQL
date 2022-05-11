class StravaClient
  include HTTParty

  class << self

    @@refresh_token = ENV['STRAVA_REFRESH_TOKEN']
    @@access_token = ENV['STRAVA_ACCESS_TOKEN']

    def safe_call(endpoint, body: {})
      if !body.empty?
        combined_options = options.merge(:body => body.to_json)
        response = post("/#{endpoint}", combined_options)
      else
        response = get("/#{endpoint}", options)
      end
    rescue => e
      Rails.logger.error("Fetching Strava data failed: #{e}")
      {}
    end

    def token
      body = {
        "client_id": ENV['STRAVA_CLIENT_ID'],
        "client_secret": ENV['STRAVA_CLIENT_SECRET'],
        "grant_type": "refresh_token",
        "refresh_token": @@refresh_token
      }
      res = safe_call("oauth/token", body: body)
      res ? res.parsed_response : {}
      if res
        @@access_token = res['access_token']
        @@refresh_token = res['refresh_token']
      end
    end

    def athlete
      self.token()
      res = safe_call("athlete")
      res ? res.parsed_response : {}
    end

    def options
      {
        base_uri: 'https://www.strava.com/api/v3',
        format: :json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{@@access_token}"
        }
      }
    end
  end

  private_class_method :options
  private_class_method :safe_call
end
