require 'bcrypt'
class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
