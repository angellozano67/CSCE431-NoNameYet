class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 2 }
	
	# Hash digest of string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	
	# Random Token
	def User.new_token
		SecureRandom.urlsafe_base64
	end
	
	# Remember user in db for use in persistent sessions
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	
	# True if token matches digest
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	
	def forget
		self.remember_token = nil
		update_attribute(:remember_digest, remember_token)
	end
	class << self
		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
			BCrypt::Password.create(string, cost:cost)
		end
		
		def new_token
			SecureRandom.urlsafe_base64
		end
	end
end
