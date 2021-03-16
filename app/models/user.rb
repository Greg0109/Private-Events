class User < ApplicationRecord
    has_many :atendees
    has_many :events, through: :atendees
end
