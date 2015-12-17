class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

	def new?
		p @user
		not @user.nil?
	end

	def create?
		not user.nil?
	end
end
