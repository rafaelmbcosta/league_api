module Season::Active extend ActiveSupport::Concern

  included do
    def self.active
      find { |season| season.year == Time.now.year }
    end

    def self.active?
      active.present?
    end

    def active_exist?
      raise "Temporada já cadastrada" if self.class.active?
    end
  end
end