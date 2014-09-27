class ShoppingCartsController < ApplicationController
    
  def show

  end

  def checkout
    @cart = ShoppingCart.new(shopping_cart_params) 
    if @cart.save_with_payment
        flash[:success] = "Your payment was successful! Thank you, come again!"
        redirect_to root_path
    else
        flash[:error] = "There was an issue processing the payment"
        redirect_to @cart
    end
  end

    private
        def shopping_cart_params
            params.require(:shopping_cart).permit!
        end
end
