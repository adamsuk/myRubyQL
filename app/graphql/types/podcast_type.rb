# frozen_string_literal: true

module Types
  class PodcastType < Types::BaseObject
    field :episode, String, null: true
    field :show, String, null: true
    field :image, String, null: true
    field :url, String, null: true
    field :type, String, null: true
    field :date, String, null: true
  end
end
