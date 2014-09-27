class Customer < ActiveRecord::Base
        
    attr_accessible :email, :password, :password_confirmation, :length => { :maximum => 20 }
    has_secure_password


end
