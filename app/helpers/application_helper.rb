module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    gravatar_id = 'https://www.gravatar.com/avatar/#test@testtest.com.jpg?d=identical&s=150'
    if user.image?
      user.image
    else
      'https://www.gravatar.com/avatar/#test@testtest.com.jpg?d=identical&s=150'
    # "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end
end
