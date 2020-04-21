class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :card_id
      t.string :status

      t.timestamps
    end
  end
end
