module UsersHelper
  def login_logout
    if session[:connected]
      output = "<a href='/logout'>Logout</a>".html_safe
    else
      output = "<a href='/login'>Login</a>".html_safe
    end
    output
  end
end
