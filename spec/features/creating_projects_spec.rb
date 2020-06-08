require 'rails_helper'
RSpec.describe 'Creating Projects', type: :system do
  let (:user) { FactoryBot.create(:user) }
  let (:project) { FactoryBot.build(:project) }
  feature 'With Valid params' do
    scenario 'With all the correct values' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all projects'
      click_on 'Add new'
      fill_in 'Name', with: project.name
      click_on 'submit'
      expect(page).to have_content(project.name)
    end

    scenario 'With all the correct values' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all projects'
      click_on 'Add new'
      fill_in 'Name', with: ''
      click_on 'submit'
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
    end
  end
end
