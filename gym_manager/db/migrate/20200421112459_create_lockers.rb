class CreateLockers < ActiveRecord::Migration[6.0]
  def change
    create_table :lockers do |t|
      t.integer :card_id
      t.boolean :is_free
      t.string :room

      t.timestamps
    end
  end
end
 