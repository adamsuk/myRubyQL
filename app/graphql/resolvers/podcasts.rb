module Resolvers
  class Podcasts < Resolvers::Base
    type [Types::PodcastType], null: true
    description 'Podcasts'

    argument :type, String, required: false
    argument :rss_url, String, required: false
    argument :filters, Types::PodcastFilterType, required: false

    def resolve(type: 'random', rss_url: nil, filters: {})
      puts "type: #{type}"
      puts "rss_url: #{rss_url}"
      puts "filters: #{filters}"
      
      if type == 'random'
        [PodcastClient.random_podcast]
      elsif type == 'all'
        PodcastClient.all_podcasts
      elsif type == 'custom' && rss_url
        PodcastClient.custom_podcast(rss_url, filters)
      end
    end
  end
end