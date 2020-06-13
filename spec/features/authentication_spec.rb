require 'rails_helper'
RSpec.describe 'Testing the login', type: :system do
  let(:user) { FactoryBot.build(:user, profile: nil) }
  let(:user2) { FactoryBot.build(:user, profile: nil) }

  feature 'Sign up' do
    scenario 'Sign Up with valid params as a Manager' do
      visit root_path
      # find('nav ul li:nth-child(2) a').click
      find('#test').click
      fill_in 'Name', with: user.name
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      find('#test').click
      expect(page).to have_content(user.name)
      expect(page).to have_content('Manager')
    end
  end

  feature 'Sign Up with valid params as a Employee' do
    scenario 'with valid params' do
      visit root_path
      find('#test').click
      click_on 'Employee'
      fill_in 'Name', with: user2.name
      fill_in 'Username', with: user2.username
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.employee') { fill_in('profile_employee', with: 'Rails developer') }
      find('#test').click
      expect(page).to have_content(user2.name)
      expect(page).to have_content('Employee')
    end
  end

  feature 'Sign Up with invalid name' do
    scenario 'invalid name' do
      visit root_path
      find('#test').click
      fill_in 'Name', with: '12'
      fill_in 'Username', with: user2.username
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      find('#test').click
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
    end
  end

  feature 'Sign Up with invalid email' do
    scenario 'with invalid email' do
      visit root_path
      find('#test').click
      fill_in 'Name', with: user2.name
      fill_in 'Username', with: user2.username
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      find('#test').click
      expect(page).to have_content("Email can't be blank")
    end
  end
end
