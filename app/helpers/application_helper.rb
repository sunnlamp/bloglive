module ApplicationHelper
  def user_id_to_email(user_id)
    return User.find(params[:id]).email
  end
end
