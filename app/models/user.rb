class User < ApplicationRecord
    has_many :atendees
    has_many :events, through: :atendees

    validates :username, presence: true, uniqueness: true
end
