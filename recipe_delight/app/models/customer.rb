class Customer < ActiveRecord::Base
    before_save :encrypt_password
    

		has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    attr_accessor :password, :password_confirmation
    VALID_EMAIL_REGEX = /.+@.+/
    #VALID_DOB_REGEX = /\d\d-\d\d-\d\d\d\d/
    validates_format_of :email, :with => VALID_EMAIL_REGEX 
    #validates_format_of :dob, :with => VALID_DOB_REGEX

    validates_presence_of :email
    validates_presence_of :name
    validates_presence_of :dob
    validates_presence_of :gender
    validates_presence_of :password

    validates :email, :length => { :minimum => 5 }, :uniqueness => true
    validates :password, :length => { :minimum => 6 }, :confirmation => true

    def self.authenticate(email, password)
        user = find_by_email(email)
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


		def find_location(location)
#			hash = JSON.parse(open("http://api.target.com/v2/location/geocode?place=#{location}&key=J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF&limit=5"))
#			lat_long =[]
			logger.info("Location Hash*****#{hash}")
			#determine lat and long
			#lat_long << 			
			#lat_long << 

#<<<<<<< HEAD
			hash2 = JSON.parse(open("http://api.target.com/v2/store?nearby=#{lat_long[0]},#{lat_long[1]}&range=10&limit=100&locale=en-US&key=J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF"))
			return lat_long
#=======
#			hash2 = JSON.parse(open("http://api.target.com/v2/store?nearby=#{lat_long[0]},#{lat_long[1]}&range=10&limit=100&locale=en-US&key=J5PsS2XGuqCnkdQq0Let6RSfvU7oyPwF"
#			return lat_long
#>>>>>>> ade803eb526e4ae1777791df3673c7a4d5f494d0
		end

end
