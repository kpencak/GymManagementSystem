class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :locker_id
      t.integer :membership_id
      t.string :status

      t.timestamps
    end
  end
end
