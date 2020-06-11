require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProjectsHelper. For example:
#
# describe ProjectsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProjectsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, user: user) }
  let(:group_one) { FactoryBot.create(:group, user: user) }
  let(:group_two) { FactoryBot.create(:group, user: user) }
  let(:task_one) { FactoryBot.create(:task, group_id: group_one.id, user: user) }
  let(:task_two) { FactoryBot.create(:task, group_id: group_two.id, user: user) }
  let(:task_three) { FactoryBot.create(:task, group_id: nil, user: user) }

  describe 'total_project_time' do
    it 'returns the total time of tasks withing this project' do
      group_one.tasks << task_one
      group_two.tasks << task_two
      project.groups << group_two
      project.groups << group_one
      expect(helper.total_project_time(project)).to eq(task_one.amount + task_two.amount)
    end
  end

  describe 'total_time_tasks' do
    it 'returns total time of tasks of an user' do
      user.tasks << task_one
      user.tasks << task_two
      expect(helper.total_time_tasks(user)).to eq(task_one.amount + task_two.amount)
    end
  end

  describe 'total_group_time' do
    it 'returns total time of the tasks from a group' do
      group_one.tasks << task_one
      group_one.tasks << task_two
      expect(helper.total_group_time(group_one.tasks)).to eq(task_one.amount + task_two.amount)
    end
  end

  describe 'group_icon' do
    it 'returns empty sstring if group is nil' do
      expect(helper.group_icon(task_three)).to eq('')
    end
  end

  describe 'user_image' do
    it 'returns empty string if an user does not have an image attached' do
      expect(helper.user_image(user)).to eq('')
    end
  end

  describe 'user_image_small' do
    it 'returns empty string if an user does not have an image attached' do
      expect(helper.user_image_small(user)).to eq('')
    end
  end

  describe 'manage_employee' do
    it 'returns empty string if an user is not a manager' do
      expect(helper.manage_employee(user)).to eq('')
    end
  end

  describe 'group_all' do
    it 'returns a list of all groups' do
      expect(helper.group_all).to eq(Group.all)
    end

    it 'should create a new group with the name of None' do
      helper.group_all(FactoryBot.create(:user))
      group_none = Group.find_by(name: 'None')
      expect(Group.all.include?(group_none)).to be(true)
    end
  end

  describe 'project_all' do
    it 'returns a list of all project' do
      expect(helper.project_all).to eq(Project.all)
    end

    it 'should create a new group with the name of None' do
      helper.project_all(FactoryBot.create(:user))
      project_none = Project.find_by(name: 'None')
      expect(Project.all.include?(project_none)).to be(true)
    end
  end

  describe 'check_tasks_do_do' do
    it 'should return true if an user has a task that he did not completed,
    with status == false' do
      task = FactoryBot.create(:task, status: false, user: user)
      user.tasks << task
      expect(helper.check_tasks_to_do(user)).to be(true)
    end

    it 'should return false if the user does not have a task yet to do' do
      expect(helper.check_tasks_to_do(user)).to be(false)
    end
  end
end
