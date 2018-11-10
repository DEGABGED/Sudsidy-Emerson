class CreateScanners < ActiveRecord::Migration[5.2]
  def change
    create_table :scanners do |t|
      t.string :key
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
