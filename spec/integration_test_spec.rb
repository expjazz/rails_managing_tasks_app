require 'rails_helper'
RSpec.describe 'Testing the login', type: :system do
  user = FactoryBot.build(:user, profile: nil)
  user2 = FactoryBot.build(:user, profile: nil)

  feature 'authentication system for Sign up' do
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
      expect(page).to have_content(user.username)
    end

    scenario 'Sign Up with valid params as a Employee' do
      visit root_path
      find('#test').click
      click_on 'Employee'
      fill_in 'Name', with: user2.name
      fill_in 'Username', with: user2.username
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      within('.manager') { fill_in('profile_manager', with: 'CEO') }
      find('#test').click
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
      fill_in 'Email', with: user3.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      expect(page).to have_content('See al my tasks',
                                   'All my external tasks',
                                   'All my groups',
                                   'All my projects')
    end
  end

  feature 'creating a task' do
    user3 = FactoryBot.create(:user)
    task = FactoryBot.build(:task)
    scenario 'with a existing user that is a employee' do
      visit root_path
      fill_in 'Email', with: user3.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      click_on 'New task'
      fill_in 'Name', with: task.name
      fill_in 'Ammount', with: task.amount
      fill_in 'Group', with: '1'
      click_on 'Submit'
    end
  end

  feature 'checking content of the All my tasks' do
    user3 = FactoryBot.create(:user)
    tasks = user3.tasks
    scenario 'with a existing user that is a employee' do
      visit root_path
      fill_in 'Email', with: user3.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all my tasks'
      expect(page).to have_content('Total Time spent on your tasks', tasks[0].name, tasks[1].name, 'Add new')
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
