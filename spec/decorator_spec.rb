require 'spec_helper'

describe Decorator do
  describe '#initialize' do
    before :each do
      @name = Decorator.new('girma Tarekegn')
    end

    it 'create a new instanc object' do
      expect(@name).to be_an_instance_of Decorator
    end

    it 'return the nammable object' do
      expect(@name.correct_name).to eq('girma Tarekegn')
    end
  end
end

describe TrimmerDecorator do
  describe '#initialze' do
    before :each do
      @name = TrimmerDecorator.new(TestNameable.new)
    end

    it 'Return Trimmer correct name' do
      expect(@name.correct_name).to eq('girmatarek')
    end
  end
end

describe CapitalizeDecorator do
  let(:decorator) { CapitalizeDecorator.new(TestNameable.new) }

  describe '#correct_name' do
    it 'capitalize the correct name' do
      expect(decorator.correct_name).to eq('Girmatarekegn')
    end
  end
end

class TestNameable < Nameable
  def correct_name
    'girmatarekegn'
  end
end
