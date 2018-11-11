class Pump < ApplicationRecord
  belongs_to :card, optional: true
  belongs_to :scanner
end
