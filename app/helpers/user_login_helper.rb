module UserLoginHelper

  def check_login(user, cocktail)
    if user.id == cocktail.user.id
      return true
    else
      return false
    end
  end
end
