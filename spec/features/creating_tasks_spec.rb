require 'rails_helper'
RSpec.describe 'Creating Tasks', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  feature 'With valid params' do
    task = FactoryBot.build(:task)
    scenario 'With all the correct values' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'Add new'
      fill_in 'Name', with: task.name
      find('.amount-to-hide-min').send_keys('2')
      find('.amount-to-hide-hour').send_keys('2')
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
      expect(page).to have_content(task.name)
    end
  end
  feature 'Without a name' do
    scenario 'name' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'Add new'
      find('.amount-to-hide-min').send_keys('3')
      find('.amount-to-hide-hour').send_keys('3')
      find('#task_group_id').find(:xpath, 'option[1]').select_option
      click_on 'submit'
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
    end
  end

  feature 'External task' do
    scenario 'task' do
      task2 = FactoryBot.build(:task)
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all external tasks'
      click_on 'Add new'
      fill_in 'Name', with: task2.name
      find('.amount-to-hide-min').send_keys('4')
      find('.amount-to-hide-hour').send_keys('4')
      find('#task_group_id').find('*', text: 'None').select_option
      click_on 'submit'
      expect(page).to have_content(task2.name)
    end
  end

  feature 'Using the timer' do
    scenario 'timer' do
      task2 = FactoryBot.build(:task)
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all external tasks'
      click_on 'Add new'
      fill_in 'Name', with: task2.name
      find('#set-timer').click
      find('#button-timer').click
      sleep(10)
      find('#task_group_id').find('*', text: 'None').select_option
      click_on 'submit'
      expect(page).to have_content(task2.name)
    end
  end
end
