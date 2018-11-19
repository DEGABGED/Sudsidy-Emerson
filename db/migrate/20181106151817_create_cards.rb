class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :sid
      t.string :origin
      t.datetime :date_given
      t.datetime :last_ridden, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :last_pumped, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :points
      t.integer :points_total

      t.timestamps
    end
  end
end
