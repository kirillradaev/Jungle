require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks on 'Add to Cart' button", type: :feature, js: true do

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

  scenario "They see cart updates" do
    visit root_path

    expect(page).to have_css 'article.product', count: 10

    within ('#navbar') do
      expect(page).to have_content('My Cart (0)')
    end

    product = page.first('article.product')
    button = product.first('button')

    button.click

    within ('#navbar') do
      expect(page).to have_content('My Cart (1)')
    end

    save_and_open_screenshot "product.png"
  end
end

