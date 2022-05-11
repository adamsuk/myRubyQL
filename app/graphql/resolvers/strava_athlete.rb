module Resolvers
  class StravaAthlete < Resolvers::Base
    type [Types::StravaAthleteType], null: true
    description 'Strava Athlete'

    argument :type, String, required: false

    def resolve(type: 'athlete')
      if type == 'athlete'
        [StravaClient.athlete]
      end
    end
  end
end
