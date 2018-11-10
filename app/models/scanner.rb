class Scanner < ApplicationRecord
  belongs_to :station
  has_many :pumps
end
