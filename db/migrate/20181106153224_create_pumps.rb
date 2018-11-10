class CreatePumps < ActiveRecord::Migration[5.2]
  def change
    create_table :pumps do |t|
      t.integer :is_valid
      t.references :card, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
