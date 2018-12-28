class UserMailer < ApplicationMailer
	default from: "Planet's Meal <userservices@planetsmeal.com>"

	def signup_user(user)
		attachments.inline["PlanetsMealLogo.png"] = File.read("#{Rails.root}/app/assets/images/PlanetsMealLogo.png")
		@user = user
		mail(to: @user.email, subject: "Welcome to Planet's Meal")
	end

	def password_reset(user)
	  @user = user
	  mail(to: @user.email, subject: 'Password Reset')
	end

end



