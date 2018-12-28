class User < ApplicationRecord
	before_create { generate_token(:reset_digest) }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	validates :password, allow_nil: true, length: { minimum: 6 }, confirmation: true, on: :update

	has_many :orders, dependent: :destroy

	has_many :boxes

	has_secure_password

	def generate_token(column)
  		begin
    		self[column] = SecureRandom.urlsafe_base64
  		end while User.exists?(column => self[column])
	end

	def send_password_reset
	  generate_token(:reset_digest)
	  self.reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

	def incre(attribute, by)
		self[attribute] ||= 0
	 	newval = self[attribute] += by
	  	update_attribute(attribute, newval)
	end
	
end
