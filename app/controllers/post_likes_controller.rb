class PostLikesController < ApplicationController
  before_action :set_post_like, only: %i[create update destroy]
  before_action :authorized, except: %i[index]

  # GET /post_likes
  def index
    @post_likes = PostLike.where(post_id: params[:post_id])

    render json: @post_likes
  end

  def create
    if @post_like
      @post_like.vote == post_like_params[:vote] ? destroy : update

    else
      PostLike.create(post_like_params)
      render json: { status: 'added' }
    end
  end

  # PATCH/PUT /post_likes/1
  def update
    if @post_like.update(post_like_params)
      render json: { status: 'updated' }
    else
      render json: @post_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_likes/1
  def destroy
    @post_like.destroy
    render json: { status: 'removed' }
  end

  private

  def set_post_like
    @post_like = PostLike.find_by({ post_id: post_like_params[:post_id], user_id: post_like_params[:user_id] })
  end

  def post_like_params
    params.require(:post_like).permit(:post_id, :user_id, :username, :vote)
  end
end
