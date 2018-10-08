# frozen_string_literal: true

# client controller
class ClientsController < ApplicationController
  before_action :find_client, only: %i[edit update destroy show]
  before_action :breadcrumb_path, only: %i[new show]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end
  end

  def index
    add_breadcrumb "Home", root_path
    add_breadcrumb "Clients", clients_path
    @clients = Client.all
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to clients_path
    else
      render 'edit'
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def breadcrumb_path
    add_breadcrumb "Home", root_path
    add_breadcrumb "Clients", clients_path
    add_breadcrumb "Add Client", new_client_path
  end

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:client_name,
                                   :client_email,
                                   :client_contact,
                                   :country)
  end
end
