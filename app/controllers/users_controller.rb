class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
  	@user=User.new

  end
  def show 
  	user_id = params[:id]
  	@user=User.find(user_id)
  end
  def create
  	@user=User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success]="Welcome to the Sample App!"
  		redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success]="Profile Successfully updated !"
        redirect_to user_url(@user)
      else
        flash[:danger]="Something went Wrong!"
        render 'edit'

      end

  end

  private

  		def user_params

  			params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		end  	

      def logged_in_user
        if logged_in?
        else
          flash[:danger] = "please log in."
          redirect_to login_url
        end
      end
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless  @user == current_user
      end
end
