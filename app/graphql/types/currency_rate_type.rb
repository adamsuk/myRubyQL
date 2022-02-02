# frozen_string_literal: true

module Types
  class CurrencyRateType < Types::BaseObject
    field :to, String, null: true
    field :base, String, null: true
    field :rate, String, null: true
  end
end
