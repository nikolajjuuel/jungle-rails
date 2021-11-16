require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "must be created with a password and password confirmation" do
      @user = User.new(:name => 'test', :email =>'test@test.ca').save
      expect(@user).to eq(false)
    end
    it "must have a unique email" do
      @user = User.new(:name => 'test', :email => 'test@test.ca', :password => 'password', :password_confirmation => 'password').save
      @user = User.new(:name => 'test', :email => 'TEST@test.ca', :password => 'password', :password_confirmation => 'password').save
      expect(@user).to eq(false)
    end
    it "must have name" do
      @user = User.new(:email => 'test@test.ca', :password => 'password', :password_confirmation => 'password').save
      expect(@user).to eq(false)
    end
    it "must have email" do
      @user = User.new(:name => 'test', :password => 'password', :password_confirmation => 'password').save
      expect(@user).to eq(false)
    end
    it "must have password" do
      @user = User.new(:name => 'test', :email => 'test@test.ca').save
      expect(@user).to eq(false)
    end
    it "must have a minimium password of length 8" do
      @user = User.new(:name => 'test', :email => 'test@test.ca',:password => '1234567', :password_confirmation => '1234567').save
      expect(@user).to eq(false)
    end
    it "must have a minimium password of length 8" do
      @user = User.new(:name => 'new', :email => 'new@test.ca', :password => 'password', :password_confirmation => 'password').save
      expect(@user).to eq(true)
    end
  end

  describe '.authenticate with credentials' do
    # validation examples here
      it "must have an existing email" do 
        @user = User.new(:name => 'test', :email => 'test@Newtest.ca',  :password => 'password', :password_confirmation => 'password').save
        User.authenticate_with_credentials('test@Newtest.ca', 'password')

        expect(@user).to eq(@user)
      end
      it "must login user if spaces around email" do 
        @user = User.new(:name => 'test', :email => 'test@Newtest.ca',  :password => 'password', :password_confirmation => 'password').save
        User.authenticate_with_credentials('    test@Newtest.ca', 'password')

        expect(@user).to eq(@user)
      end
      it "must login user if email is uppercase" do 
        @user = User.new(:name => 'test', :email => 'test@Newtest.ca',  :password => 'password', :password_confirmation => 'password').save
        User.authenticate_with_credentials('    TEST@NEWTEST.CA', 'password')

        expect(@user).to eq(@user)
      end
  end

  
end
