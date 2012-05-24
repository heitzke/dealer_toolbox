class FoldersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:new, :create, :update]

  def index
    @folders = Folder.find_all_by_subcategory_id(params[:subcategory_id])
  end

  def new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(params[:folder])
    if @folder.save
      flash[:notice] = 'Saved Folder'
      redirect_to category_subcategory_folder_path(@folder.subcategory.category, @folder.subcategory, @folder)
    else
      flash[:error] = 'Folder Not Saved'
      render :action => 'new'
    end
  end

  def show
    @folder = Folder.find(params[:id])
    @file_attachments = @folder.file_attachments
    @file_attachments = @file_attachments.paginate(:per_page => 20, :page => params[:page])
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update_attributes(:params[:folder])
      flash[:notice] = 'Saved folder'
      redirect_to @folder
    else
      flash[:error] = 'Folder Not Saved'
      render :action => 'new'
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @subcategory = @folder.subcategory
    @folder.destroy
    flash[:notice] = "Folder Deleted!"
    redirect_to category_subcategory_folders_path(@subcategory.category, @subcategory, @folder)
  end

end
