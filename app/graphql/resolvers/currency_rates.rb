module Resolvers
  class CurrencyRates < Resolvers::Base
    include HTTParty

    type Types::CurrencyRatesType, null: false
    description 'Currency Rates'

    argument :to, String, required: false

    def resolve(to: nil)
      params = "latest?access_key=#{ENV['CURRENCY_API_KEY']}"
      response = HTTParty.get("http://data.fixer.io/#{params}", timeout: 10)
      rates = []
      for k, v in response.parsed_response.to_h.slice("rates")['rates']
        if !to.nil? && to != k
          next
        end
        rates.push({
          :base => response.parsed_response.to_h.slice("base")['base'],
          :to => k,
          :rate => v
        })
      end
      return { :rates => rates }
    end
  end
end