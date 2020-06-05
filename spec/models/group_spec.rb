require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name) }
  end

  describe 'associations' do
    # it { should have_many(:active_friends).through(:requests_received) }
    # it { should have_many(:passive_friends).through(:requests_sent) }
    it { should have_many(:tasks) }
    it { should belong_to(:user) }
    # it { should have_many(:comments) }
    # it { should have_many(:likes) }
  end
end
