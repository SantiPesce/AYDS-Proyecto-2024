require 'sinatra/activerecord'
require 'sinatra'
require './models/user'

RSpec.describe User, type: :model do
  # Antes de cada prueba, limpia la tabla de usuarios
  before(:each) do
    User.delete_all
  end

  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(
        username: "johndoe",
        email: "john.doe@example.com",
        password: "password123",
        progress: 1,
        actualLearning: 1,
        actualLearningLevel2: 15,
        lessonMaxProgress: 10
      )
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(
        username: "johndoe",
        email: "john.doe@example.com",
        password: "password123"
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a unique email" do
      User.create(
        username: "johndoe",
        email: "john.doe@example.com",
        password: "password123"
      )
      user = User.new(
        names: "Jane Smith",
        username: "janesmith",
        email: "john.doe@example.com",  # Este email ya existe
        password: "anotherpassword"
      )
      expect(user).to_not be_valid
    end
  end

  describe "create" do
    it "creates a new user" do
      user = User.create(
        username: "johndoe",
        email: "john.doe@example.com",
        password: "password123",
        progress: 1,
        actualLearning: 1,
        actualLearningLevel2: 15,
        lessonMaxProgress: 10
      )
      expect(User.count).to eq(1)
      expect(user.names).to eq("John Doe")
    end
  end

  # Agrega más pruebas según sea necesario para otros métodos y comportamientos del modelo User
end
