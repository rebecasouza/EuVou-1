class RegistrationsController < ApplicationController
	#protect_from_forgery with: :null_session

	def create
		@user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
		
		if @user.save
			render json: @user
		else
			render json: @user.errors, status: 422
		end
	end
end

