# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  before_action :find_project, only: %i[edit update destroy show]
  before_action :breadcrumb_path, only: %i[new show]

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		params[:project][:technology_ids].each do |technology|
  			@technology = Technology.find(technology) rescue nil
  			@project.technologies << @technology if @technology.present?
  		end
  		redirect_to projects_path
  	else
  		render 'new'
  	end
  end

  def index
    add_breadcrumb "Home", root_path
    add_breadcrumb "Projects", projects_path, :title => "Back to the Index"
  	@filterrific = initialize_filterrific(
      Project,
      params[:filterrific]
    ) or return
    @projects = @filterrific.find.eager_load(:technologies).page(params[:page])
    
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def update
    if @project.update(project_params)
      #delete all project technolgies and then add 
      @project&.technologies.delete_all 
      params[:project][:technology_ids].each do |technology|
        @technology = Technology.find(technology) rescue nil
        @project.technologies << @technology if @technology.present?
      end
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def breadcrumb_path
    add_breadcrumb "Home", root_path
    add_breadcrumb "Projects", projects_path, :title => "Back to the Index"
    add_breadcrumb "Add Project", new_project_path, :title => "Back to the Index"
  end

  def find_project
    @project = Project.find(params[:id]) rescue nil
  end

  def project_params
    params.require(:project).permit(:project_name, :start_date,
                                     :end_date, :rough_order_magnitude,
                                     :client_id, :employee_id, :price)
  end
end
