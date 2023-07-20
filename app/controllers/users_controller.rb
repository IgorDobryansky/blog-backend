class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      genereted_token = encode_token({ user_id: @user.id })
      render json: { user: { id: @user.id, username: @user.username, token: genereted_token }, status: 'created' }
    else
      render json: { error: 'User already exist' }, status: :conflict
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      genereted_token = encode_token({ user_id: @user.id })
      render json: { user: { id: @user.id, username: @user.username, token: genereted_token }, status: 'logged_in' }
    else
      render json: { error: 'Invalid username or password' }, status: :conflict
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
