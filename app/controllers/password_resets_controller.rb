class PasswordResetsController < ApplicationController
  skip_before_action :authorize

	def new
	end

	def create
	  if params[:email].blank?
	  	redirect_to :back, :notice => "No email was entered."
	  else
	  	user = User.find_by_email(params[:email])
	  	user.send_password_reset if user
	  	redirect_to root_url, :notice => "Email sent with password reset instructions"
	  end
	end

	def edit
  		@user = User.find_by_reset_digest!(params[:id])
	end

	def update
	  @user = User.find_by_reset_digest!(params[:id])
	  if @user.reset_sent_at < 1.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @user.update(allowed_params)
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	end

private
    def allowed_params
    	params.require(:user).permit(:password, :password_confirmation)
	end 
end
