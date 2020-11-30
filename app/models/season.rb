class Season < ApplicationRecord
  include Season::Active

  # def self.active
  #   Season.find { |season| season.year == Time.now.year }
  # end
end
