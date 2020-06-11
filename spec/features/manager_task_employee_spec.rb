require 'rails_helper'
RSpec.describe 'Managing Tasks', type: :system do
  let(:user) { FactoryBot.create(:user, profile: Manager.create(function: 'CEO')) }
  let(:user2) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  feature 'Create a new task' do
    task = FactoryBot.build(:task)
    scenario 'With all the correct values' do
      user.save
      user2.save
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'Manage your employees task'
      expect(page).to have_content(user2.name)
      find(:xpath, '/html/body/div/div[1]/div[2]/div/div/div/div[1]/p[2]/a').click
      click_on 'Add new'
      fill_in 'Name', with: task.name
      find('.amount-to-hide-min').send_keys('4')
      find('.amount-to-hide-hour').send_keys('4')
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
      expect(page).to have_content('Total Time spent on your tasks')
    end

    scenario 'employee notification task' do
      task = FactoryBot.create(:task, user: user2, status: false)
      task.save
      visit root_path
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'You have 1 assigned tasks from your manager'
      expect(page).to have_content(task.name)
    end
  end
end
