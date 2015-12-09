class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :projects

	def avatar_url
		gravatar_url
	end
	
	def gravatar_url
		gravatar_id = Digest::MD5.hexdigest(self.email.strip.downcase)
		"https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=512"
	end
end
