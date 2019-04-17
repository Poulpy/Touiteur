module UsersHelper

  # prints html link to login page if user is not connected
  # or link to logout is user is connected
  def login_logout
    if user_signed_in?
      link_to("Logout", destroy_user_session_path, method: :delete, class: "nav-link").html_safe
    else
      link_to("Login", new_user_session_path, class: "nav-link").html_safe
    end
  end

  def avatar user
    return image_tag(current_user.avatar, class: 'img-responsive', width: 210) if user.avatar.attached?
    image_tag asset_path("pas-de-photo.png")
  end

end
