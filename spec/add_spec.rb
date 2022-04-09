require_relative "../lib/calculator/public/base"
require_relative "../lib/calculator/public/add"
require_relative "../lib/calculator/parser"
require_relative "../lib/calculator/validator"
require 'rails'
require 'byebug'

RSpec.describe 'Calculator' do
  context 'Add Numbers' do

    it 'When empty string' do
      service = ::Calculator::Public::Add.new('')
      result = service.calculate
      expect(result).to eq 0
    end

    it 'When only 1 number' do
      service = ::Calculator::Public::Add.new('5')
      result = service.calculate
      expect(result).to eq 5
    end

    it 'When 2 numbers(comma separated)' do
      service = ::Calculator::Public::Add.new('2,3')
      result = service.calculate
      expect(result).to eq 5
    end

    it 'When more than 2 numbers(comma separated)' do
      service = ::Calculator::Public::Add.new('1,2,3,4,5')
      result = service.calculate
      expect(result).to eq 15
    end

    it 'When 2 numbers(line separated)' do
      service = ::Calculator::Public::Add.new('2\n3')
      result = service.calculate
      expect(result).to eq 5
    end

    it 'When line and comma separated' do
      service = ::Calculator::Public::Add.new('1\n2,3')
      result = service.calculate
      expect(result).to eq 6
    end

    it 'When negative numbers' do
      service = ::Calculator::Public::Add.new('1\n2,-3')
      service.calculate
      expect(service.errors.present?).to eq true
    end
  end
end
