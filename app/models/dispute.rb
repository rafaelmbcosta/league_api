class Dispute < ApplicationRecord
  belongs_to :season
  has_many :rounds

  validate :repeated_name
  validates_uniqueness_of :order

  def self.next_order
    return 1 if last.nil?

    return last.order + 1
  end

  def repeated_name
    existing = Dispute.find { |dispute| dispute.name == self.name && dispute.season === self.season }
    raise 'Mês de Disputa já existe nesta temporada' if existing
  end
end
