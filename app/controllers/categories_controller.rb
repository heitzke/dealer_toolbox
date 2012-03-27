class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Saved Category'
      redirect_to @category
    else
      flash[:error] = 'Category Not Saved'
      render :action => 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(:params[:category])
      flash[:notice] = 'Saved Category'
      redirect_to @category
    else
      flash[:error] = 'Category Not Saved'
      render :action => 'new'
    end
  end
end
