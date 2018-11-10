class Pump < ApplicationRecord
  belongs_to :card
  belongs_to :scanner
end
