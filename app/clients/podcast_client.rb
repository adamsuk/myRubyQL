class PodcastClient
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
      Rails.logger.error("Fetching random podcast failed: #{e}")
      {}
    end

    def random_podcast
      res = safe_call("random-podcast")
      puts res
      extract_podcast(res)
    end

    def all_podcasts
      res = safe_call("all-podcasts")
      extract_podcast(res)
    end

    def custom_podcast(rss_url, filters = {})
      body = { "feed_url": rss_url }
      if !filters.empty?
        body = body.merge("podcast_filter": filters)
      end
      res = safe_call("podcasts", body: body)
      extract_podcast(res)
    end

    def options
      {
        base_uri: ENV['PODCAST_URL'],
        format: :json,
        headers: { 'Content-Type' => 'application/json' }
      }
    end

    private 
    def extract_podcast(res)
      res ? res.parsed_response : {}
    end
  end

  private_class_method :options
  private_class_method :safe_call
end
