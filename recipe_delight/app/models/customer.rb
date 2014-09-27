class Customer < ActiveRecord::Base
    before_save :encrypt_password
        
    attr_accessor :email, :password, :password_confirmation
    VALID_EMAIL_REGEX = /.+@.+/
    validates :email, :presence => true, :length => { :minimum => 5 }, :uniqueness => true
    validates_format_of :email, :with => VALID_EMAIL_REGEX 
    validates :password, :presence => true, :length => { :minimum => 6 }, :confirmation => true

    def self.authenticate(email, password)
        user = find_by_email(email)
        Rails.logger.info "****************************** #{user.inspect}"
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_digest)
            user
        else
            nil
        end
    end

    def encrypt_password
        if password.present? && password == password_confirmation
            self.password_digest = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_digest)
        end
    end


end
