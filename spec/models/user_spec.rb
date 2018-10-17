require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  end

describe 'class methods' do
  it 'authenticates user and password' do
    user = User.create(name: "Bailey", email: "email@gmail.com", password: "password")

    expect(User.authenticate(user.name, user.password)).to eq(user)
    expect(User.authenticate(user.name, "faker")).to eq(nil)
    end
  end
end
