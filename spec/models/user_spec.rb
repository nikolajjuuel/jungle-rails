require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "must be created with a password and password confirmation" do
      @user = User.new(:name => 'test', :email =>'test@test.ca').save
      expect(@user).to eq(false)
    end
    it "must have a unique email" do
      @user = User.new(:name => 'test', :email => 'test@test.ca', :password_digest => 'password').save
      @user = User.new(:name => 'test', :email => 'TEST@test.ca', :password_digest => 'password').save
      expect(@user).to eq(false)
    end
    it "must have name" do
      @user = User.new(:email => 'test@test.ca', :password_digest => 'password').save
      expect(@user).to eq(false)
    end
    it "must have email" do
      @user = User.new(:name => 'test', :password_digest => 'password').save
      expect(@user).to eq(false)
    end
    it "must have password" do
      @user = User.new(:name => 'test', :email => 'test@test.ca').save
      expect(@user).to eq(false)
    end
    it "must have a minimium password of length 8" do
      @user = User.new(:name => 'test', :email => 'test@test.ca', :password_digest => '1234567').save
      expect(@user).to eq(false)
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
