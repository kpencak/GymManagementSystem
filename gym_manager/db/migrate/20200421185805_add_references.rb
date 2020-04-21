class AddReferences < ActiveRecord::Migration[6.0]
    def change
        add_foreign_key :cards, :lockers
        add_foreign_key :cards, :users

        add_foreign_key :lockers, :cards
        
        add_foreign_key :memberships, :users
        add_foreign_key :memberships, :cards

        add_foreign_key :users, :cards
        add_foreign_key :users, :memberships
    end
end
