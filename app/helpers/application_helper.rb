module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    require 'digest'
    
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class:"shadow rounded mx-auto d-block")
  end

  def current_user
    @current_user  ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user # Return true if current_user exists, otherwise return false. The !! is a way to convert any value to a boolean
  end
end
