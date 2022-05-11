# frozen_string_literal: true

module Types
  class StravaAthleteType < Types::BaseObject
    field :id, ID, null: true
    field :firstname, String, null: true
    field :lastname, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :profile, String, null: true
  end
end
