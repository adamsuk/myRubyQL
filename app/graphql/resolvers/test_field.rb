module Resolvers
  class TestField < Resolvers::Base
    type String, null: false
    description 'Test Field'

    def resolve
      'My custom resolver test field!'
    end
  end
end