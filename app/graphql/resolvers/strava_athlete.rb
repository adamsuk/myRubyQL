module Resolvers
  class StravaAthlete < Resolvers::Base
    type [Types::StravaAthleteType], null: true
    description 'Strava Athlete'

    def resolve
      [StravaClient.athlete]
    end
  end
end