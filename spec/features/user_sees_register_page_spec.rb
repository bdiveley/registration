require 'rails_helper'

describe 'user sees new registration page' do
  it 'can register as a new user' do

    visit new_user_path

    fill_in "user[name]", with: "bdiveley"
    fill_in "user[email]", with: "bailey@bailey.com"
    fill_in "user[password]", with: "password"
    click_on "Create User"

    expect(User.last.name).to eq("bdiveley")
    expect(User.last.email).to eq("bailey@bailey.com")
    expect(User.last.password).to eq("password")
    expect(current_path).to eq(user_path(User.last))
  end
  it 'cannot register as a new user if all info isnt completed' do

    visit new_user_path

    fill_in "user[name]", with: "bdiveley"
    fill_in "user[password]", with: "password"
    click_on "Create User"
    expect(current_path).to eq(new_user_path)
  end
  it 'cannot register as a new user if email already exists' do
    user = User.create(name: "bailey", email: "bailey@gmail.com", password: "password")

    visit new_user_path

    fill_in "user[name]", with: "bdiveley"
    fill_in "user[email]", with: "bailey@gmail.com"
    fill_in "user[password]", with: "password"
    click_on "Create User"
    expect(current_path).to eq(new_user_path)
  end
end
