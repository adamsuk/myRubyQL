class StravaClient
  include HTTParty

  class << self
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

    def athlete
      res = safe_call("athlete")
      puts res
      res ? res : {}
    end

    def custom_podcast(rss_url, filters = {})
      body = { "feed_url": rss_url }
      if !filters.empty?
        body = body.merge("podcast_filter": filters)
      end
      res = safe_call("podcasts", body: body)
      puts res
      res ? res : {}
    end

    def options
      {
        base_uri: 'https://www.strava.com/api/v3',
        format: :json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => 'Bearer 4655390b65a9716cd018e3899379f0d41243acb2'
        }
      }
    end
  end

  private_class_method :options
  private_class_method :safe_call
end
