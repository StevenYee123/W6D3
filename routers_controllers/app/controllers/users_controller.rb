class UsersController < ApplicationController
  def index 
    users = User.all

    render json: users #renders our users in json format

    # render plain: "I'm in the index action!"
  end

  def create
    # debugger
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show 
    user = User.find(params[:id]) 

    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_url(user), status:303
    else
      render json: user.errors.full_messages, status:422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, status: 303
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end


end