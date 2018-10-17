require 'rails_helper'

describe 'user visits welcome page' do
  it 'can click a link to register as a new user' do

    visit root_path
    click_on "Sign Up to Be a User"

    expect(current_path).to eq(new_user_path)
  end
  it 'can click a link to log in' do
    user = User.create(name: "bdiveley", email: "gmail.com", password: "password")

    visit root_path
    click_on "I already have an account"

    fill_in "name", with: user.name
    fill_in "password", with: user.password
    click_on "Log In"

    expect(page).to have_content("Welcome #{user.name}")
    expect(page).not_to have_link("I already have an account")
    expect(page).to have_link("Log out")
  end
end
