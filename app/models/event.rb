class Event < ApplicationRecord
    has_many :atendees
    has_many :users, through: :atendees
end
