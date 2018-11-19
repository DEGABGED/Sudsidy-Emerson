class Pump < ApplicationRecord
  belongs_to :card, optional: true
  belongs_to :scanner

  def self.to_csv
    head = %w{id card_id scanner_id is_valid created_at}

    CSV.generate(headers: true) do |csv| 
      csv << head
      all.each do |pump|
        csv << head.map{|attr| pump.send(attr)}
      end
    end

  end
end
