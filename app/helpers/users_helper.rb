module UsersHelper
  def login_logout
    if session[:connected]
      output = "<a class='nav-link' href='/logout'>Logout</a>".html_safe
    else
      output = "<a class='nav-link' href='/login'>Login</a>".html_safe
    end
    output
  end
end
