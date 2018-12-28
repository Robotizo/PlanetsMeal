namespace :emailer do
  desc "TODO"
  task email_newsletter: :environment do
  	user  = User.find(12)
  	puts "Winner: #{user.name}"
  end

end
