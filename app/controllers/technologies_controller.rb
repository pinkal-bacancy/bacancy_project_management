# frozen_string_literal: true

# technology controller
class TechnologiesController < ApplicationController
  before_action :find_technology, only: %i[edit update destroy show]
  before_action :breadcrumb_path, only: %i[new show]

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      redirect_to technologies_path
    else
      render 'new'
    end
  end

  def index
    add_breadcrumb "Home", root_path
    add_breadcrumb "Technologies", technologies_path
    @technologies = Technology.all
  end

  def edit; end

  def update
    if @technology.update(technology_params)
      redirect_to technologies_path
    else
      render 'edit'
    end
  end

  def destroy
    @technology.destroy
    redirect_to technologies_path
  end

  private

  def breadcrumb_path
    add_breadcrumb "Home", root_path
    add_breadcrumb "Technologies", technologies_path
    add_breadcrumb "Add Technology", new_technology_path
  end

  def find_technology
    @technology = Technology.find(params[:id])
  end

  def technology_params
    params.require(:technology).permit(:name)
  end
end
