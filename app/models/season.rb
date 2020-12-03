class Season < ApplicationRecord
  include Season::Active
  include Season::CreateRounds

  has_many :rounds
  has_many :disputes

  before_create :set_year
  after_create :create_rounds

  validate :active_exist?

  def set_year
    self.year = Time.now.year
  end
end
