class Project < ApplicationRecord
  belongs_to :user
  has_many :groups
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
end
