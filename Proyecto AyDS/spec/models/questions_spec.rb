# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra'
require './models/question'

RSpec.describe Question, type: :model do
  describe 'schema' do
    it 'has a number field of type integer' do
      expect(Question.columns_hash['number'].type).to eq :integer
    end

    it 'has an enunciation field of type string' do
      expect(Question.columns_hash['enunciation'].type).to eq :string
    end

    it 'has a slice_index field of type integer' do
      expect(Question.columns_hash['slice_index'].type).to eq :integer
    end
  end

  describe 'associations' do
    it 'has many options' do
      association = Question.reflect_on_association(:options)
      expect(association.macro).to eq :has_many
    end
  end
end
