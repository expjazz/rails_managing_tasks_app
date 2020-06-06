class Group < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  def self.font_awesome_list
    file = File.open('font_awesome_list.txt')
    file_data = file.read
    file_data.split(',')
  end
end
