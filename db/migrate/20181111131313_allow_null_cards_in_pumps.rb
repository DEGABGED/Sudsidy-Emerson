class AllowNullCardsInPumps < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pumps, :card_id, true
  end
end
