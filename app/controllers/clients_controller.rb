class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params.require(:client).permit(:company_name, :email, :sector, :size, :can_contact))
    if @client.save
      session[:client_id] = @client.id
      redirect_to '/quiz/sections/strategy'
    end
  end
end
