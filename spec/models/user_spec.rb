require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Bob", last_name: "Johns",
    email: "bob.johns@gmail.com", password: '1234', password_confirmation: '1234')
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a first name' do
      subject.name = nil
      subject.valid?
      expect(subject).to_not be_valid
    end

    it 'is invalid without a last name' do
      subject.last_name = nil
      subject.valid?
      expect(subject).to_not be_valid
    end

    it 'is invalid without an email' do
      subject.email = nil
      subject.valid?
      expect(subject).to_not be_valid
    end

    it 'is invalid when password is less than minimum' do
      subject.password = '123'
      subject.valid?
      expect(subject).to_not be_valid
    end

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    
  end

  describe '.authenticate_with_credentials' do
    it 'is valid with valid email and password' do
     subject.save
     user = User.authenticate_with_credentials('bob.johns@gmail.com', '1234')
     expect(user).to be == user
    end

    it 'is valid with an invalid password' do
      subject.save
      user = User.authenticate_with_credentials('bob.johns@gmail.com', '0000')
      expect(user).to be == nil
     end

     it 'is valid with spaces around email' do
      subject.save
      user = User.authenticate_with_credentials(' bob.johns@gmail.com ', '1234')
      expect(user).to be == user
     end

     it 'is valid with wrond case in email' do
      subject.save
      user = User.authenticate_with_credentials(' boB.jOhnS@gmail.com ', '1234')
      expect(user).to be == user
     end

  end

end
