class Station < ApplicationRecord
    has_many :scanners

    def pumps
        @pumps = []
        self.scanners.each do |scanner|
            @pumps = @pumps + scanner.pumps
        end
        @pumps
    end
end