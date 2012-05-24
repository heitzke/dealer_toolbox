class SubcategoriesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:new, :create, :update]

  def index
    @subcategories = Subcategory.find_all_by_category_id(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])
    if @subcategory.save
      flash[:notice] = 'Saved Subcategory'
      redirect_to category_subcategory_path(@subcategory.category, @subcategory)
    else
      flash[:error] = 'Subcategory Not Saved'
      render :action => 'new'
    end
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @folders = @subcategory.folders
    @file_attachments = @subcategory.file_attachments
    @file_attachments = @file_attachments.paginate(:per_page => 20, :page => params[:page])
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

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
    @subcategory.destroy
    flash[:notice] = "Folder Deleted!"
    redirect_to category_subcategories_path(@category, @subcategory)
  end


end
