class PostsController < ApplicationController
  def new
    @post = Post.new

    @users = User.all.to_a
    @user_list = @users.map do |user|
      [ user.name, user.id ]
    end
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to user_path(@post.user)
    else
      render :new
    end
  end
end
