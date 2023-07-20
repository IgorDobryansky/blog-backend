class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :authorized, except: %i[index show]

  # GET /comments
  def index
    @comments = Comment.where(post_id: params[:post_id]).sort { |x, y| -(x['created_at'] <=> y['created_at']) }

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: { status: 'created' }
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id, :username)
  end
end
