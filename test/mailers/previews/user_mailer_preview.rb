# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

	def signup_user
    	UserMailer.signup_user(User.first)
  	end



	def password_reset
		UserMailer.password_reset(User.first)
	end

end
