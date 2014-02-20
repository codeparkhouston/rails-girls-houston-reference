class PostsController < ApplicationController
  def new
    @post = Post.new

    @user_list = User.all.map do |user|
      [ user.name, user.id ]
    end
    render :new
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
