class Card < ApplicationRecord
    has_many :pumps

    def has_redeemable
      self.last_ridden && self.last_pumped && self.last_ridden - self.last_pumped > 30
    end

    def points_spent
      self.points_total - self.points
    end

    def sanitize_hands
        self.last_pumped = DateTime.now()
        self.points += 1
        self.points_total += 1
        self.save
    end
end
