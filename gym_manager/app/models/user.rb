class User < ApplicationRecord
    has_one :card
    has_many :memberships
end
