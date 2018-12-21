require 'pry'
class Helpers

  def self.current_user(session)
    user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    user = User.find_by(id: session[:user_id])
    result = nil
    if session[:user_id] == user.id
      result = true
    else
      result = false
    end
    result
  end

end
