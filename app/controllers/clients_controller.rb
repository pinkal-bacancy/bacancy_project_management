# frozen_string_literal: true

# client controller
class ClientsController < ApplicationController
  before_action :find_client, only: %i[edit update destroy show]

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
