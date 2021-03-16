class Event < ApplicationRecord
    has_many :atendees
    has_many :users, through: :atendees

    validates :title, presence: true, length: { minimum: 5 }
    validates :description, presence: true, length: { minimum: 10 }
end
