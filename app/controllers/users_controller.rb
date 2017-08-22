class UsersController < ApplicationController
  def index
    render plain: "I'm in the index action!"
  end

  def create
      user = User.new(params[:user].permit(:name, :email))
      if user.save
        render json: user
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
  end
end
