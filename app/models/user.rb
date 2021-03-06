class User < ApplicationRecord
	has_many :microposts, dependent: :destroy
	attr_accessor :remember_token

	validates:name , presence:true, length:{maximum:50}
	validates:name , presence:true, length:{maximum:255}, uniqueness: {case_sensitive:false}
	has_secure_password
	validates :password, presence:true, length: {minimum: 6}

	def User.new_token
		return SecureRandom.urlsafe_base64
	end
	def User.digest(string)
		cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	def remember
		self.remember_token =User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	def forget
		update_attribute(:remember_digest, nil)
	end

end