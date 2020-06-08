require 'rails_helper'
RSpec.describe 'Testing the login', type: :system do
  feature 'creating a task' do
    user = FactoryBot.create(:user)
    task = FactoryBot.build(:task)
    group = FactoryBot.create(:group)
    scenario 'With all the correct values' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'Add new'
      fill_in 'Name', with: task.name
      fill_in 'Amount', with: task.amount
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
    end

    scenario 'Without a name' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'Add new'
      fill_in 'Amount', with: task.amount
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
    end

    scenario 'Without an amount' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'Add new'
      fill_in 'Amount', with: ''
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
      expect(page).to have_content("Amount can't be blank")
    end
  end
end
