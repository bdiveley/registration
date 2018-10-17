class User < ApplicationRecord
  validates_presence_of :name, :email, :password

  def self.authenticate(name, password)
    user = find_by(name: name)
    if user.password == password
      user
    else
      nil
    end
  end
end
