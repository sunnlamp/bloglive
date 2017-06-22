module ApplicationHelper
  def user_id_to_email(user_id)
    return User.find(params[:user_id]).email
  end

  def user_id_to_username(user_id)
    return User.find(user_id).username
  end
end
