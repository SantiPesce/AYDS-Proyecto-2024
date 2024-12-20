# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra'
require './models/learning'

RSpec.describe Learning, type: :model do
  describe 'schema' do
    it 'has a lesson field of type string' do
      expect(Learning.columns_hash['lesson'].type).to eq :string
    end

    it 'has a levelImage field of type string' do
      expect(Learning.columns_hash['levelImage'].type).to eq :string
    end

    it 'has a slice_index field of type integer' do
      expect(Learning.columns_hash['slice_index'].type).to eq :integer
    end
  end
end
