class Customer < ActiveRecord::Base
        
    attr_accessible :email, :password, :password_confirmation, :length => { :maximum => 20 }
    validates :email, :presence => true, :length => { :minimum => 5 }
    validates :password, :presence => true, :length => { :minumum => 6 }
    validates :password_confirmation, :presence => true
    has_secure_password

    def self.authenticate(email, password)
        user = find_by_email(email)
    end


end
