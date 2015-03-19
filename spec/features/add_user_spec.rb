require 'rails_helper'

describe 'adding a user' do
  it 'adds a new user' do
    visit new_user_path
    fill_in 'Email', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'ilovemuffins'
    fill_in 'Password confirmation', with: 'ilovemuffins'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome to the site!'
  end
end
describe 'logging in' do
  it 'logs in an existing user' do
    User.create(email: "gabe@finchler.com", password: "ilovemuffins")
    visit log_in_path
    fill_in 'Email', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'ilovemuffins'
    click_button 'Log in'
    expect(page).to have_content "You've been logged in."
  end
end
describe 'failed log in' do
  it 'wont log in a non-user' do
    visit log_in_path
    fill_in 'Email', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'ilovemuffins'
    click_button 'Log in'
    expect(page).to have_content "There was a problem logging you in."
  end
end
describe 'logging out' do
  it 'ends session for user' do
    User.create(email: "gabe@finchler.com", password: "ilovemuffins")
    visit log_in_path
    fill_in 'Email', with: 'gabe@finchler.com'
    fill_in 'Password', with: 'ilovemuffins'
    click_button 'Log in'
    click_on 'Log out'
    expect(page).to have_content "You've been logged out successfully."
  end
end
