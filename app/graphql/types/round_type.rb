class Types::RoundType < Types::BaseObject
  field :id, ID, null: true
  field :number, Integer, null: false
  field :market_closed, Boolean, null: false, camelize: false
  field :finished, Boolean, null: false
  field :golden, Boolean, null: false
end