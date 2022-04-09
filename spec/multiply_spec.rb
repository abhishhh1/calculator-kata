require_relative "../lib/calculator/public/base"
require_relative "../lib/calculator/public/multiply"
require_relative "../lib/calculator/parser"
require_relative "../lib/calculator/validator"
require 'rails'

RSpec.describe 'Calculator' do
  context 'Multiply Numbers' do

    it 'When only 1 number' do
      service = ::Calculator::Public::Multiply.new('5')
      result = service.calculate
      expect(result).to eq 5
    end

    it 'When 2 numbers(comma separated)' do
      service = ::Calculator::Public::Multiply.new('2,3')
      result = service.calculate
      expect(result).to eq 6
    end

    it 'When more than 2 numbers(comma separated)' do
      service = ::Calculator::Public::Multiply.new('1,2,3,4,5')
      result = service.calculate
      expect(result).to eq 120
    end

    it 'When 2 numbers(line separated)' do
      service = ::Calculator::Public::Multiply.new('2\n3')
      result = service.calculate
      expect(result).to eq 6
    end

    it 'When line and comma separated' do
      service = ::Calculator::Public::Multiply.new('4\n2,3')
      result = service.calculate
      expect(result).to eq 24
    end
  end
end

