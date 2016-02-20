class UsersController < ApplicationController
def new
	@user = User.new
end

def edit
	@user = User.find(params[:id])
end

def create
	@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Testing App #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
end


	

def update
	@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Account was sucessfully updated #{@user.username}"
			redirect_to articles_path
		else
			render 'edit'
		end
end	

def user_params
	params.require(:user).permit(:username, :email, :password)
end
end