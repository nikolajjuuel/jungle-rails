require 'rails_helper'

RSpec.feature "ProductPages", type: :feature, js: true do

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

  scenario "They click a product" do
    visit root_path

    first('img').click

    save_screenshot 'click-img.png'

    expect(page).to have_css 'article.product-detail'

    save_screenshot 'product-page.png'

  end
end