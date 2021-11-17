require 'rails_helper'

RSpec.feature "TestingAddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add item to their cart " do
    visit root_path

    first('.btn-primary').click

    save_screenshot 'cart.png'

    expect(page).to have_content('My Cart (1)')
  end
end