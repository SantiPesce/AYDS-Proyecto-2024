# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra'
require './models/user'

RSpec.describe User, type: :model do
  # Antes de cada prueba, limpia la tabla de usuarios
  before(:each) do
    User.delete_all
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        username: 'johndoe',
        email: 'john.doe@example.com',
        password: 'password123',
        progress1: 1,
        progress2: 1,
        actualLearningLevel1: 1,
        actualLearningLevel2: 15
      )
      expect(user).to be_valid
    end

    it 'is not valid without a unique email' do
      User.create(
        username: 'johndoe',
        email: 'john.doe@example.com',
        password: 'password123'
      )
      user = User.new(
        username: 'janesmith',
        email: 'john.doe@example.com', # Este email ya existe
        password: 'anotherpassword'
      )
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is not valid without a unique username' do
      User.create(
        username: 'johndoe',
        email: 'john.doe@example.com',
        password: 'password123'
      )
      user = User.new(
        username: 'johndoe', # Este username ya existe
        email: 'jane.smith@example.com',
        password: 'anotherpassword'
      )
      expect(user).to_not be_valid
      expect(user.errors[:username]).to include('has already been taken')
    end

    it 'is not valid without a username' do
      user = User.new(
        email: 'john.doe@example.com',
        password: 'password123'
      )
      expect(user).to_not be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user = User.new(
        username: 'johndoe',
        password: 'password123'
      )
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user = User.new(
        username: 'johndoe',
        email: 'john.doe@example.com'
      )
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'create' do
    it 'creates a new user' do
      user = User.create(
        username: 'johndoe',
        email: 'john.doe@example.com',
        password: 'password123',
        progress1: 1,
        progress2: 1,
        actualLearningLevel1: 1,
        actualLearningLevel2: 15,
        correctAnswerCounter: 0,
        incorrectAnswerCounter: 0
      )

      expect(user.persisted?).to be true # Verifica que el usuario se haya guardado
      expect(User.count).to eq(1)
      expect(user.username).to eq('johndoe')
    end
  end

  # Agrega más pruebas según sea necesario para otros métodos y comportamientos del modelo User
end
