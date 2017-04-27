module ApplicationHelper
  def avatar_url
      if current_user.nil?
        "http://placehold.it/30x30"
      else
        current_user.facebook_picture_url
      end
  end
end
