class AddLastRefilledToScanners < ActiveRecord::Migration[5.2]
  def change
    add_column :scanners, :last_refilled, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
