require 'spec_helper'

describe Rental do
  let(:book) { { 'title' => 'book 1' } }
  let(:person) { { 'name' => 'Zuhra', 'id' => '123' } }
  describe '#initialize' do
    before :each do
      @rentals = Rental.new('2023/02/22', book, person)
    end

    it 'return a new book object' do
      expect(@rentals).to be_an_instance_of Rental
    end
    it 'takes more than expected parameter' do
      expect { Rental.new('2023/02/22', 'book 1') }.to raise_exception ArgumentError
    end

    it 'check add rental method with empty array' do
      expect(@rentals.date).to eq('2023/02/22')
    end
    it 'Return json representation' do
      expect(@rentals.to_json).to eq({ 'date' => '2023/02/22', 'title' => 'book 1', 'name' => 'Zuhra', 'id' => '123' })
    end
  end
end
