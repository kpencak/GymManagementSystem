class Card < ApplicationRecord
    belongs_to :user
    has_many :memberships
    has_one :locker
end
