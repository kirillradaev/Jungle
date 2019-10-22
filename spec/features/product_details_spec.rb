require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks on a product", type: :feature, js: true do

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

  scenario "They see all products" do
    visit root_path

    expect(page).to have_css 'article.product', count: 10
    
    first("a[href='/products/1']").click

    sleep 2

    expect(page).to have_css 'article.product-detail', count: 1

    save_and_open_screenshot "product.png"
  end
end