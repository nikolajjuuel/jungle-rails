class User < ActiveRecord::Base

    has_secure_password
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true
    validates :password_confirmation, :presence => true
    validates :email, :uniqueness => { :case_sensitive => false }
    validates :password, :length => { :minimum => 8 }



    def new
    end

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to '/'
        else
          redirect_to '/signup'
        end
      end 

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

end
