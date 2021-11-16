class User < ActiveRecord::Base

    has_secure_password
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true
    validates :password_confirmation, :presence => true
    validates :email, :uniqueness => { :case_sensitive => false }
    validates :password, :length => { :minimum => 8 }




    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.strip.downcase)
        if user && user.authenticate(password)
          return user
        else
          return nil
        end
    end 

      private

      # def user_params
      #   .require(:user).permit(:name, :email, :password, :password_confirmation)
      # end

end
