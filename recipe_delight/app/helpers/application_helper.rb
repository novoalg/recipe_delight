module ApplicationHelper
    def current_user
        if !session[:customer_id].nil?
            @current_user ||= Customer.find(session[:customer_id])
        else
            nil
        end
    end
    
    def current_user?(user)
        user == current_user
    end
end
