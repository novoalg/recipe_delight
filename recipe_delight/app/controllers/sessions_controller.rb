class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.authenticate(params[:email], params[:password])
    if customer
        flash[:success] = "Welcome!"
        session[:customer_id] = customer.id
        redirect_to root_path 
    else
        flash[:error] = "Sorry but the email/password does not mach."
        render 'new'
    end
  end

  def destroy
    current_user = nil
    session[:customer_id] = nil
  end

  private

  def session_params
    params.require(:session).permit!
  end
end
