require 'sinatra/activerecord'
require 'sinatra'
require './models/option'

RSpec.describe Option, type: :model do
  describe "schema" do
    it "has a level field of type integer" do
      expect(Option.columns_hash['level'].type).to eq :integer
    end

    it "has a questionNumber field of type integer" do
      expect(Option.columns_hash['questionNumber'].type).to eq :integer
    end

    it "has a correct field of type boolean" do
      expect(Option.columns_hash['correct'].type).to eq :boolean
    end

    it "has an enunciation field of type string" do
      expect(Option.columns_hash['enunciation'].type).to eq :string
    end

    it "has a question_id field of type integer" do
      expect(Option.columns_hash['question_id'].type).to eq :integer
    end

    it "has an index on question_id" do
      index = Option.connection.indexes('options').find { |idx| idx.name == 'index_options_on_question_id' }
      expect(index).not_to be_nil
    end
  end

  describe "associations" do
    it "belongs to a question" do
      association = Option.reflect_on_association(:question)
      expect(association.macro).to eq :belongs_to
    end
  end
end
