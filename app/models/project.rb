class Project < ActiveRecord::Base
  belongs_to :user
	has_many :project_images, dependent: :destroy
	accepts_nested_attributes_for :project_images

  extend FriendlyId
  friendly_id :title, use: :slugged

	before_save :fix_urls

	def owner?(user)
		return false if (self.user.nil? or user.nil?)
		return self.user.id === user.id
	end

	def excerpt(len=40)
		self.description.split(/\s/).first(len).join(" ")
	end

	def github?
		return (self.source and self.source.include?("github"))
	end
	
	def bitbucket?
		return (self.source and self.source.include?("bitbucket"))
	end

	def fix_urls
		reg = /^.+:\/\//
		if self.website and not reg.match(self.website)
			self.website = "http://#{self.website}"
		end
    if self.source and not reg.match(self.source)
      self.source = "http://#{self.source}"
    end

	end

end
