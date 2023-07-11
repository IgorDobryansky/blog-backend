class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      my_app_token = encode_token({ user_id: @user.id })
      render json: { user: { id: @user.id, username: @user.username }, token: my_app_token, status: 'created' }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      my_app_token = encode_token({ user_id: @user.id })
      render json: { user: { id: @user.id, username: @user.username }, token: my_app_token, status: 'logged_in' }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end
end
