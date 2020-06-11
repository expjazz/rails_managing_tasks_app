require 'rails_helper'
RSpec.describe 'Creating Groups', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.build(:group) }
  feature 'With Valid params' do
    scenario 'With all the correct values' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all groups'
      click_on 'Add new'
      fill_in 'Name', with: group.name
      # find("#group_icon_adress-card").check
      page.find(:xpath, '//*[@id="group_icon_address-book"]').click
      click_on 'submit'
      expect(page).to have_content(group.name)
    end

    scenario 'Without the name' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#testlog').click
      click_on 'See all groups'
      click_on 'Add new'
      fill_in 'Name', with: ''
      # find("#group_icon_adress-card").check
      page.find(:xpath, '//*[@id="group_icon_address-book"]').click
      click_on 'submit'
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_content("Name can't be blank")
    end
  end
end
