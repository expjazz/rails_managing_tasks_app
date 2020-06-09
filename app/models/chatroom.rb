class Chatroom < ApplicationRecord
  has_many :notices
  validates uniqueness: true
end
