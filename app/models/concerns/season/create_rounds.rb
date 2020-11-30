module Season::CreateRounds extend ActiveSupport::Concern
  included do
    def create_rounds
      numbers = (1..38).to_a
      numbers.map! { |n| { number: n, season_id: self.id } }
      Round.create!(numbers)
    end
  end
end