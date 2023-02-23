require 'spec_helper'

describe Classroom do
  describe '#initialize' do
    before :each do
      @lable = Classroom.new('class 1')
    end

    it 'is instane of classroom' do
      expect(@lable).to be_an_instance_of Classroom
    end

    it 'is instane of classroom' do
      expect(@lable.label).to eq('class 1')
    end
  end
end
