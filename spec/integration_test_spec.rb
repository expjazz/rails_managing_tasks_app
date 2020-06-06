require 'rails_helper'
RSpec.describe 'Testing the login', type: :system do
  user = FactoryBot.build(:user)
  user2 = FactoryBot.build(:user)

  feature 'authentication system for Sign up' do
    scenario 'Sign Up with valid params as a Manager' do
      visit root_path
      click_on 'Sign up'
      fill_in 'Name', with: user.name
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      click_on 'Sign up'
      expect(page).to have_content(user.username)
    end

    scenario 'Sign Up with valid params as a Employee' do
      visit root_path
      click_on 'Sign up'
      click_on 'Employee'
      fill_in 'Name', with: user2.name
      fill_in 'Username', with: user2.username
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      click_on 'Sign up'
      expect(page).to have_content(user2.username)
    end

    # scenario 'Sign up with invalid email' do
    #   visit root_path
    #   click_on 'Sign up'
    #   click_on 'Sign up'
    #   expect(page).to have_content("Email can't be blank")
    # end
  end

  feature 'checking content of the main page' do
    user3 = User.first
    scenario 'with a existing user that is a employee' do
      visit root_path
      click_on 'Log in'
      fill_in 'Email', with: user3.email
      fill_in 'Password', with: 'foobar'
      click_on 'Log in'
      expect(page).to have_content('All My Tasks',
                                   'All my external tasks',
                                   'All my groups',
                                   'All my projects')
    end
  end
  # feature 'authentication system for logging in' do
  #   scenario 'Sign Up with valid params' do
  #     visit root_path
  #     click_on 'Log in'
  #     fill_in 'Email', with: user.email
  #     click_on 'Log in'
  #     expect(page).to have_content('List of all Events')
  #   end

  #   scenario 'Sign up with invalid email' do
  #     visit root_path
  #     click_on 'Log in'
  #     click_on 'Log in'
  #     expect(page).to have_content('Forgot your password?')
  #   end
  # end

  # feature 'Event creation' do
  #   scenario 'with valid params' do
  #     visit root_path
  #     fill_in 'Email', with: user.email
  #     click_on 'Log in'
  #     expect(page).to have_content('List of all Events')
  #     visit 'events/new'
  #     fill_in 'Name', with: event.name
  #     fill_in 'Description', with: event.description
  #     fill_in 'Location', with: event.location
  #     fill_in 'Date', with: event.date
  #     fill_in 'invitedlist', with: 'expeditojazz@gmail.com'
  #     click_on 'Create Event'
  #     visit root_path
  #     expect(page).to have_content(event.name)
  #     expect(Event.find_by(name: event.name)).to be_an(Event)
  #   end
  # end
end
