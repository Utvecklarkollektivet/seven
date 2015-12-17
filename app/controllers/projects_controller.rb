class ProjectsController < ApplicationController
	before_action :set_project, only: [ :edit, :update, :show ]

  def index
		@projects = Project.where(public: true).order("updated_at	DESC")
  end

	def new
		authorize Project
		@project = Project.new
    @project_image = @project.project_images.build
	end

	def create
		authorize Project
    @project = Project.new(project_params)
		@project.user = current_user
		if @project.save
      params[:project_images][:image].each do |image|
        @project.project_images.create!(image: image)
      end
			redirect_to @project, notice: 'Ditt projekt har skapats.'
		else
			render :new
		end
	end

	def edit
		authorize Project
	end

	def update
		authorize Project
	end

	private
	def set_project
		@project = Project.friendly.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :public, :website, :source, project_images_attributes: [:image, :project_id])
	end
end
