class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: %i[create]
before_action :set_user, only: [:show, :update, :destroy]

  def profile
      logged_in ? (render json: { user: UserSerializer.new(current_user) }, status: :accepted) : (render json:{ message: 'User not found' }, status: :not_found)
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def index
    users = User.all
    render json: users, status: 200
  end

  def update
    @user.update(user_params)
    render json: @user, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def destroy
    userId = @user.id
    @user.destroy
    render json: {message:"User has been deleted.", userId:userId}
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
