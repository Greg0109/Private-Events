class User < ApplicationRecord
  has_many :atendees, foreign_key: :atendee_id
  has_many :events, through: :atendees, foreign_key: :creator_id

  validates :username, presence: true, uniqueness: true
end
