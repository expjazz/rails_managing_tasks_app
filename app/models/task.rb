class Task < ApplicationRecord
  belongs_to :user
  belongs_to :group
  scope :most_recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
