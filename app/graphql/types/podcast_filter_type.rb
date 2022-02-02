# frozen_string_literal: true

module Types
  class PodcastFilterType < Types::BaseInputObject
    description "Filter items used for custom podcast feeds"
    argument :key, String, required: false
    argument :value, String, required: false
    argument :match, String, required: false
  end
end
