class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :sid
      t.string :origin
      t.datetime :date_given
      t.datetime :last_ridden
      t.datetime :last_pumped
      t.integer :points
      t.integer :points_total

      t.timestamps
    end
  end
end
