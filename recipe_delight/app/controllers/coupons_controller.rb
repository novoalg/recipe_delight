class CouponsController < ApplicationController

  def index
		@coupons = Coupon.all
  end
 

	def new
	 @coupon = Coupon.new 
  end

	def create 
		@coupon = Coupon.create(coupon_params)
	  logger.info "***************** #{params.inspect}"
    if @coupon.save
        flash[:success] = "Coupon created"
        redirect_to @coupon
    else
        flash[:error] = @coupon.errors.full_messages.to_sentence
        @coupon.destroy
        render 'new'
    end
	
	end 

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    logger.info "******************** #{params.inspect}"
    @coupon = Coupon.find(params[:id])
    if @coupon.update_attributes(customer_params) 
        flash[:success] = "This coupon has been successfully updated."
        redirect_to @coupon
    else
        flash[:error] = "There was a problem updating this coupon"
        render 'edit'
    end
  end

  def show
  	@coupon = Coupon.find(params[:id])
	end

	private 

	def coupon_params
		params.require(:coupon).permit!
	end

end
