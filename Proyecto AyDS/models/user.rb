# frozen_string_literal: true

require 'bcrypt'
# clase usuario
class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
