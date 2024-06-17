require 'sinatra/activerecord'
require 'sinatra'
require './models/question'


RSpec.describe Question, type: :model do
  describe "schema" do
    it "has a number field of type integer" do
      expect(Question.columns_hash['number'].type).to eq :integer
    end

    it "has a level field of type integer" do
      expect(Question.columns_hash['level'].type).to eq :integer
    end

    it "has an enunciation field of type string" do
      expect(Question.columns_hash['enunciation'].type).to eq :string
    end
  end

  describe "associations" do
    it "has many options" do
      association = Question.reflect_on_association(:options)
      expect(association.macro).to eq :has_many
    end
  end
end
