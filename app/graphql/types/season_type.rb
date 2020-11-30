module Types
  class SeasonType < Types::BaseObject
    field :id, ID, null: true
    field :year, Integer, null: false
  end
end