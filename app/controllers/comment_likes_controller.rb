class CommentLikesController < ApplicationController
  before_action :set_comment_like, only: %i[create update destroy]
  before_action :authorized, except: %i[index]

  # GET /comment_likes
  def index
    @comment_likes = CommentLike.where(comment_id: params[:comment_id])

    render json: @comment_likes
  end

  def create
    if @comment_like
      @comment_like.vote == comment_like_params[:vote] ? destroy : update
    else
      CommentLike.create(comment_like_params)
      render json: { status: 'added' }
    end
  end

  # PATCH/PUT /comment_likes/1
  def update
    if @comment_like.update(comment_like_params)
      render json: { status: 'updated' }
    else
      render json: @comment_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comment_likes/1
  def destroy
    @comment_like.destroy
    render json: { status: 'removed' }
  end

  private

  def set_comment_like
    @comment_like = CommentLike.find_by({ comment_id: comment_like_params[:comment_id],
                                          user_id: comment_like_params[:user_id] })
  end

  def comment_like_params
    params.require(:comment_like).permit(:comment_id, :user_id, :username, :vote)
  end
end
