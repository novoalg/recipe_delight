class CustomersController < ApplicationController
    
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

  def edit
    @customer = Customer.find(params[:customer])
  end

  def update
    @customer = Custumer.find(params[:customer])
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

end
