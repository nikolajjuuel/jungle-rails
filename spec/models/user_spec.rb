require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "must be created with a password and password confirmation" do
      @user = User.new(:name => 'test', :email =>'test@test.ca').save
      expect(@user).to eq(false)
    end
    # it "must have a unique email" do
    #   @user = User.new(:name => 'test', :email => 'test@test.ca', :password_digest => 'password').save
    #   @user = User.new(:name => 'test', :email => 'test@test.ca', :password_digest => 'password').save
    #   p 'test2'
    #   expect(user2).to eq(false)
    # end
    it "must have name" do
      @user = User.new( :email => 'test@test.ca', :password_digest => 'password').save
      expect(@user).to eq(false)
    end
    it "must have a password of length 10" do
      @user = User.new
      #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
      p @user
    end
    it "must have email, first name, last name" do
      @user = User.new
      #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
      p @user
    end
    it "must have email, first name, last name" do
      @user = User.new
      #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
      p @user
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
