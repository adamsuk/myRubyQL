# frozen_string_literal: true

module Types
  class CurrencyRatesType < Types::BaseObject
    field :rates, [CurrencyRateType], null: true
  end
end
