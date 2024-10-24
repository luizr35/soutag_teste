require 'rspec'
require_relative 'price_service'

RSpec.describe PriceService do
  subject(:call) { PriceService.new(product: product, user: user).call }

  let(:product) { { id: 1, base_price: 100, tax_percentage: 0, category: 'other' } }
  let(:user) { { id: 1, birthday_month: 5 } }

  it 'calculates the total price without discounts or taxes' do
    expect(call).to eq(100.0)
  end

  context 'when product has tax' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10, category: 'other' } }

    it 'calculates the total price with tax' do
      expect(call).to eq(110.0)
    end
  end

  context 'when product is food' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 0, category: 'food' } }

    it 'applies a 5% discount' do
      expect(call).to eq(95.0)
    end
  end

  context 'when it is the user\'s birthday month' do
    let(:user) { { id: 1, birthday_month: Time.now.month } }

    it 'applies a 10% birthday discount' do
      expect(call).to eq(90.0)
    end
  end

  context 'when product is food and it is the user\'s birthday month' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 0, category: 'food' } }
    let(:user) { { id: 1, birthday_month: Time.now.month } }

    it 'applies both a 5% category discount and a 10% birthday discount' do
      expect(call).to eq(85.5) 
    end
  end
end