class CustomersController < ApplicationController
    include ApplicationHelper
    before_filter :check_user, :except => [:new, :create]
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    logger.info "***************** #{params.inspect}"
    if @customer.save
        flash[:success] = "Welcome to Recipe Delight!"
        session[:customer_id] = @customer.id
        redirect_to @customer
    else
        flash[:error] = @customer.errors.full_messages.to_sentence
        @customer.destroy
        render 'new'
    end
  end

  def destroy
  end

	def show 
		@customer = Customer.find(params[:id])
<<<<<<< HEAD
		@recipes = Recipe.all
=======
>>>>>>> 6ddcd94d97b41b70766dccbccb968ea53a12cf4d
	end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    logger.info "******************** #{params.inspect}"
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params) 
        flash[:success] = "Your profile has been successfully updated."
        redirect_to @customer
    else
        flash[:error] = "There was a problem updating your profile."
        render 'edit'
    end
  end

  private
    def customer_params
        params.require(:customer).permit!
    end

    def check_user
        if params[:id].nil?
            redirect_to root_url unless !current_user.nil?
        else
            customer = Customer.find(params[:id])
            redirect_to root_url unless current_user?(customer)
        end
    end
end
