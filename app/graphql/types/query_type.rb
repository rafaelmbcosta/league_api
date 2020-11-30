module Types
  class QueryType < Types::BaseObject
    field :seasons, [SeasonType], null: false, description: "Season list"

    def seasons
      Season.all
    end

    field :active_season, SeasonType, null: true, description: "Checks if there is an active Season", camelize: false

    def active_season
      # Verificar a possibilidade de mudar isso para dentro do SeasonType.
      Season.active
    end
  end
end
