class Project < ActiveRecord::Base
  belongs_to :user
	has_many :project_images, dependent: :destroy
	accepts_nested_attributes_for :project_images

  extend FriendlyId
  friendly_id :title, use: :slugged

	def owner?(user)
		return false if (self.user.nil? or user.nil?)
		return self.user.id === user.id
	end
end
