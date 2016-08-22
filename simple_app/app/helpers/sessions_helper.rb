module SessionsHelper

  #Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !@current_user.nil?
  end

  def current_user?(user)
    user == @current_user
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stroes the URL trying to be accesssed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


  # Returns true if the user is logged in, false otherwise.

  # Logs out the current_user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

    def log_in_as(user)
      session[:user_id] = user.id
    end
end
