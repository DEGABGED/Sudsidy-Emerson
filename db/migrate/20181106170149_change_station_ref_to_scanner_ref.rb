class ChangeStationRefToScannerRef < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pumps, :station, index: true
    add_reference :pumps, :scanner, index: true, foreign_key: true
  end
end
