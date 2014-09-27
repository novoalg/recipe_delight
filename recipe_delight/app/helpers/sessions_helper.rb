module SessionsHelper
    def current_user
        if !session[:customer_id].nil?
            @current_user ||= Customer.find(session[:customer_id])
        else
            nil
        end
    end

end
