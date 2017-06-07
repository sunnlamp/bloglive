class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.user_id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_url}
        format.json { render json: @resource }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).
    end
end
