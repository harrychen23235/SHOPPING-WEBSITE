class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user,   only: [:edit, :update, :show]
    before_action :my_admin,     only: [:destroy]
	def my_admin
	current_user.name=="upadmin"
	end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
              # Handle a successful update.
              flash[:success] = "Profile updated"
              redirect_to @user
      else
        render 'edit'
      end
    end


  def search
    name = params[:search] + '%'
    @users = User.where(['name LIKE ?', name])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end

  def index
   @users = User.all
 end


  def create
     @user = User.new(user_params)
     if @user.save
       log_in @user
       flash[:success] = "Welcome to our final project!"
       redirect_to @user
       # Handle a successful save.
     else
       render 'new'
     end
   end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end

   # Before filters

   # Confirms a logged-in user.
   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

   # Confirms the correct user.
   def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "You are not authorized to do that."
      redirect_to(root_url)
    end
end

    def admin_user
        if !(current_user.try(:admin?))
          flash[:danger] = "You are not authorized to do that, only an admin can do that."
          redirect_to(root_url)
        end
    end
end
