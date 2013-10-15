class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :flash_to_headers, :store_location

  def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath
	end

	def flash_to_headers
		return unless request.xhr?
		response.headers['X-Message'] = flash_message
		response.headers["X-Message-Type"] = flash_type.to_s

		# Prevents flash from appearing after page reload.
		# Side-effect: flash won't appear after a redirect.
		# Comment-out if you use redirects.
		# flash.discard
	end

  	def flash_message
  		[:error, :warning, :notice].each do |type|
    		return flash[type] unless flash[type].blank?
	    end
   	end
   
    def flash_type
    	[:error, :warning, :notice].each do |type|
    		return type unless flash[type].blank?
    	end
    end
end
