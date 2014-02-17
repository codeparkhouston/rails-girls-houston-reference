class UsersController < ApplicationController

  def index
    @users = User.all.to_a
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :show
    else
      render :new
    end
  end

end
