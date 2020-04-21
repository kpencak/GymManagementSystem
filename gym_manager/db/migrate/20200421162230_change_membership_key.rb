class ChangeMembershipKey < ActiveRecord::Migration[6.0]
    def change
        remove_column :cards, :membership_id
        add_column :cards, :user_id, :integer 
    end
end
