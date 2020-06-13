require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    # it { should have_many(:active_friends).through(:requests_received) }
    # it { should have_many(:passive_friends).through(:requests_sent) }
    it { should have_many(:tasks) }
    # it { should have_many(:comments) }
    # it { should have_many(:likes) }
  end
end
