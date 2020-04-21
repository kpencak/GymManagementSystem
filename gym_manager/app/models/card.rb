class Card < ApplicationRecord
    belongs_to :user
    has_many :memberships, through :user
    has_one :locker
end
