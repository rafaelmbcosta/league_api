class Round < ApplicationRecord
  belongs_to :season
  belongs_to :dispute, optional: true
end
