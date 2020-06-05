class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  belongs_to :profile, polymorphic: true
  has_many :tasks
  has_many :groups
  has_many :projects
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :profile

  def global_entity
    profile&.to_global_id
  end

  def global_entity=(entity)
    self.profile = GlobalID::Locator.locate entity
  end

  def tos_global_id(arr)
    arr[1].to_global_id
  end
end
