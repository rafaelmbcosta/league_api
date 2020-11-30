module Season::Active extend ActiveSupport::Concern
  included do
    def self.active
      find { |season| season.year == Time.now.year }
    end
  end
end