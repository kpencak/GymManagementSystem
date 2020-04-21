class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :surname
      t.string :name
      t.string :sex
      t.integer :card_id
      t.integer :membership_id

      t.timestamps
    end
  end
end
