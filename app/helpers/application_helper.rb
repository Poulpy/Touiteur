module ApplicationHelper
    def current_user
        User.find(session[:user]["id"])
    end
end
