class Event < ApplicationRecord
  has_many :atendees, foreign_key: :event_id
  has_many :users, through: :atendees
  belongs_to :user, class_name: 'User'

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :date, presence: true

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ? ', DateTime.now) }
end
