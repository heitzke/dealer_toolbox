class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :require_admin
  
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(:per_page => 20, :page => params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to users_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id]) # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User Deleted!"
    redirect_to users_path
  end
end

