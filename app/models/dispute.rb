class Dispute < ApplicationRecord
  belongs_to :season
  has_many :rounds

  validate :repeated_name

  def repeated_name
    existing = Dispute.find { |dispute| dispute.name == self.name && dispute.season === self.season }
    raise 'Mês de Disputa já existe nesta temporada' if existing
  end
end
