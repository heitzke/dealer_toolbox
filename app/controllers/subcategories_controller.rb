class SubcategoriesController < ApplicationController

  def index
    @subcategories = Subcategory.all
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])
    if @subcategory.save
      flash[:notice] = 'Saved Subcategory'
      redirect_to category_subcategories_path(@subcategory.category, @subcategory)
    else
      flash[:error] = 'Subcategory Not Saved'
      render :action => 'new'
    end
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @file_attachments = @subcategory.file_attachments
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(:params[:subcategory])
      flash[:notice] = 'Saved Subcategory'
      redirect_to @subcategory
    else
      flash[:error] = 'Subcategory Not Saved'
      render :action => 'new'
    end
  end


end
