module Types
  class DisputeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :finished, Boolean, null: false
    field :season, SeasonType, null: false
    field :rounds, [RoundType], null: false
  end
end