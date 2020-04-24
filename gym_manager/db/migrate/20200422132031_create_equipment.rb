class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.integer :card_id
      t.datetime :start_reservation_time
      t.datetime :end_reservation_time
      t.boolean :is_free

      t.timestamps
    end
  end
end
