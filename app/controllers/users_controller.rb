class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      # render :text => "here"
      render action: "new"
    end
  end

  def show
  	@user = User.find(params[:id])
    @comment = @user.comments.new
    @user_comments = @user.comments.order("created_at DESC")
  end

  def edit
    @user=User.find(params[:id])
  end

  def udpate
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: "User was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end