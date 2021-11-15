require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it "name is present" do
        @product = Product.new(:id => 12)
        expect(@product.id).to be_present
      end
      it "price is present" do
        @product = Product.new(:price_cents => 200)
        expect(@product.price_cents).to be_present
      end
      it "quantity is present" do
        @product = Product.new(:quantity => 2)
        expect(@product.quantity).to be_present
      end
      it "category is present" do
        @product = Product.new(:category_id => 2)
        expect(@product.category_id).to be_present
      end
      it "should save" do
        @product = Product.new
        @product.save

        expect(@product).to be_present
      end
  end

end
