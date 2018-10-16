class LeaveListsController < ApplicationController
  before_action :authenticate_employee!
	before_action :find_leave_list, only: %i[edit update destroy show]
  before_action :breadcrumb_path, only: %i[new show]

  def new
  	@leave_list = LeaveList.new
  end

  def create
  	@leave_list = LeaveList.new(leave_list_params)
  	if @leave_list.save
  		redirect_to leave_lists_path
  	else
  		render 'new'
  	end
  end

  def index
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'LeaveList', leave_lists_path
    @filterrific = initialize_filterrific(
      LeaveList,
      params[:filterrific]
    ) or return
    @leave_lists = @filterrific.find.page(params[:page])
  end

  def edit; end

  def update
    if @leave_list.update(leave_list_params)
      redirect_to leave_lists_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
  	@leave_list.destroy
  	redirect_to leave_lists_path
  end

  private

  def breadcrumb_path
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'LeaveList', leave_lists_path
    add_breadcrumb 'Add Client', new_leave_list_path
  end

  def find_leave_list
    @leave_list = LeaveList.find(params[:id]) rescue nil
  end

  def leave_list_params
  	params.require(:leave_list).permit(:employee_id, :start_date,
                                     :end_date,:project_id)
  end
end
