module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    require 'digest'
    
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class:"shadow rounded mx-auto d-block")
  end
end
