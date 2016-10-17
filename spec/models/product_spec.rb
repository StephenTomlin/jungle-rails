require 'rails_helper'
require "shoulda/matchers"
RSpec.describe Product, type: :model do
  context 'Can only exist if all fields are filled for a product' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price_cents)}
  #  it { is_expected.to validate_presence_of(:quantity)}
    it { is_expected.to validate_presence_of(:category_id)}
  end
  context 'errors' do
    it "quantity is required" do
      @category = Category.create(id:90)
      @product = Product.create(
        name: 'chair',
        price_cents: 9999,
        quantity: nil,
        category_id: 100,
      )

      expect(@product.errors[:quantity].length).to be >= 1
    end
  end

  before(:each) do
    @category = Category.create(id:100)
    @product = Product.create(name:'chair', price_cents:9999, quantity: 9, category_id:100)
  end
end
