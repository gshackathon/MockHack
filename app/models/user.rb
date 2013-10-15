class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :products

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, 
  :uid, :avatar, :username, :confirmation_token, :confirmed_at
  # attr_accessible :title, :body

   
   	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    # JeventzLogger.debug "#{access_token.inspect}"
    # JeventzLogger.debug "#{signed_in_resource.inspect}"

    user = User.where(:email => access_token.info.email).first

    unless user
      user = User.create(
        provider:access_token.provider,
        uid:access_token.uid,
        username: access_token.info.name,
        email: access_token.info.email,
        avatar: access_token.info.image,
        password: Devise.friendly_token[0,20],
        confirmation_token: nil,
		confirmed_at: Time.now.utc
        )
    end

    user
  end

#def self.find_for_google_oauth2(auth, signed_in_resource=nil)
#		if user = User.find_by_email(auth.info.email)
#			user.provider = auth.provider
#			user.uid = auth.uid
#			user
#		else
#			where(auth.slice(:provider, :uid)).first_or_create do |user|
#				user.provider = auth.provider
#				user.uid = auth.uid
#				user.username = auth.info.name
#				user.email = auth.info.email
#				user.avatar = auth.info.image
#			end
#		end
#	end

	def self.new_with_session(params, session)
  		super.tap do |user|
  			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  				user.email = data["email"] if user.email.blank?
  			end
  	end
  end

  letsrate_rater
end
