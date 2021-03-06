class PostsController < ApplicationController

  before_action :check_if_logged_in, only: [:new, :create, :destroy]

  def new
  end

  def create

    if params[:image].present?
    # upload to Cloudinary
      res = Cloudinary::Uploader.upload(params[:image])
      p = Post.create user: @current_user, image: res["public_id"]

      redirect_to post_path( p )
    end

    # ???? error?
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params["id"]
  end

  def destroy
    @post = Post.find params["id"]
    @post.destroy
    redirect_to user_path(@current_user)
  end
end
