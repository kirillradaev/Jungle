require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.new(:name => "coolThings", :created_at => DateTime.now - 1.week,
   :updated_at => DateTime.now) }
  subject {
    described_class.new(name: "superComputer", description: "The faster PC ever created",
    price_cents: 1000000, quantity: '3', category: category )
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid if name is nil' do
      subject.name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
      expect(subject).not_to be_valid
    end

    it 'is invalid if price is nil' do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
      expect(subject).not_to be_valid
    end

    it 'is invalid if quantity is nil' do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
      expect(subject).not_to be_valid
    end

    it 'is invalid if category is nil' do
      subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
      expect(subject).not_to be_valid
    end
  end
end