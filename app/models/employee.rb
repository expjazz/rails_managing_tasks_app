class Employee < ApplicationRecord
  has_one :user, as: :profile
end
