require 'sinatra/activerecord'
require 'sinatra'
require './models/element'


RSpec.describe Element, type: :model do
  describe "schema" do
    it "has a Symbol field of type string" do
      expect(Element.columns_hash['Symbol'].type).to eq :string
    end

    it "has a Name field of type string" do
      expect(Element.columns_hash['Name'].type).to eq :string
    end

    it "has an AtomicMass field of type float" do
      expect(Element.columns_hash['AtomicMass'].type).to eq :float
    end

    it "has a Number field of type integer" do
      expect(Element.columns_hash['Number'].type).to eq :integer
    end

    it "has a Group_ field of type integer" do
      expect(Element.columns_hash['Group_'].type).to eq :integer
    end

    it "has a Period field of type integer" do
      expect(Element.columns_hash['Period'].type).to eq :integer
    end

    it "has a Classification field of type string" do
      expect(Element.columns_hash['Classification'].type).to eq :string
    end
  end
end
