# frozen_string_literal: true

require 'bcrypt'
# Estructura de los usuarios
class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
