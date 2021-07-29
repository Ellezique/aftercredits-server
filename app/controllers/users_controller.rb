class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.username, jwt: auth_token.token}, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
