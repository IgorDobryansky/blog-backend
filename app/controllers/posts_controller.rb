class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authorized, except: %i[index show]

  # GET /posts
  def index
    @posts = Post.all.sort { |x, y| -(x['created_at'] <=> y['created_at']) }

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: { status: 'created' }
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: { status: 'updated' }
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    render json: { status: 'deleted' }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text, :user_id, :username)
  end
end
