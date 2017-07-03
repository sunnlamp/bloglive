class FeedController < ApplicationController
  def index
    @posts = Post.find(current_user.following_ids)
  end
end
