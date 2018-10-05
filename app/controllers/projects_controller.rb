# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  before_action :find_project, only: %i[edit update destroy show]

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
  	@projects = Project.all
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
    respond_to do |format|
        format.js
    end
  end

  private

  def find_project
    @project = Project.find(params[:id]) rescue nil
  end

  def project_params
    params.require(:project).permit(:project_name, :start_date,
                                     :end_date, :rough_order_magnitude,
                                     :client_id, :employee_id)
  end
end
