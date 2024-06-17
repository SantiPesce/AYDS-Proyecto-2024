require 'bcrypt'
class User < ActiveRecord::Base
  validates :names, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
