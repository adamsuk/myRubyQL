module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items, 
          [Types::ItemType],
          null: false, 
          description: "Return a list of items"

    field :item, 
          Types::ItemType,
          description: "Return an item by ID",
          null: true do
            argument :item_id, ID, required: true
          end
      
    field :test_field, resolver: Resolvers::TestField
    field :podcasts, resolver: Resolvers::Podcasts if ENV['PODCAST_URL']
    field :currency_rates, resolver: Resolvers::CurrencyRates if ENV['CURRENCY_API_KEY']

    def items
      Item.all
    end

    def item(item_id:)
      Item.find(item_id)
    end
  end
end
