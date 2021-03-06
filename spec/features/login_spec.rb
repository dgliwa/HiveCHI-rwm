require 'rails_helper'

RSpec.feature 'User logs in' do
  let(:user) { create(:user, phone_verified: true, email_verified: true) }

  scenario 'With valid username and password' do
    log_in(user)
    expect(page).to have_content('Dashboard')
    expect(page).to have_content('Logout')
  end

  scenario "With invalid password" do
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: "password1235"
    click_button 'Log in'
    expect(page).not_to have_content('Dashboard')
    expect(page).to have_content('Invalid username or password')
  end

  scenario "With invalid username" do
    visit login_path
    fill_in 'Username', with: "usernameisfake"
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).not_to have_content('Dashboard')
    expect(page).to have_content('Invalid username or password')
  end

end
