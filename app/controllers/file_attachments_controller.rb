class FileAttachmentsController < ApplicationController
  before_filter :require_admin, :only => [:new, :create]
  before_filter :require_user, :only => [:show]

  def new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @folder = Folder.find(params[:folder_id])
    @file_attachment = FileAttachment.new
  end

  def create
    if params[:file_attachment][:folder_id]
      @folder = Folder.find(params[:file_attachment][:folder_id])
      @file_attachment = FileAttachment.new(params[:file_attachment])
      if @file_attachment.save
        flash[:notice] = "File Saved!"
        redirect_to category_subcategory_folder_path(@folder.subcategory.category, @folder.subcategory, @folder)
      else
        flash[:error] = "File Not Saved!"
        render :action => 'new'
      end
    else
      @subcategory = Subcategory.find(params[:file_attachment][:subcategory_id])
      @file_attachment = FileAttachment.new(params[:file_attachment])
      if @file_attachment.save
        flash[:notice] = "File Saved!"
        redirect_to category_subcategory_path(@subcategory.category, @subcategory)
      else
        flash[:error] = "File Not Saved!"
        render :action => 'new'
      end
    end
  end

  def show
    @file_attachment = FileAttachment.find(params[:id])
    send_file(@file_attachment.attachment_file.path, :disposition => 'attachment')
  end

  def index
    if params[:folder_id]
      @folder = Folder.find(params[:folder_id])
      @file_attachments = @folder.file_attachments
      @file_attachments = @file_attachments.paginate(:per_page => 20, :page => params[:page])
    else
      @subcategory = Subcategory.find(params[:subcategory_id])
      @file_attachments = @subcategory.file_attachments
      @file_attachments = @file_attachments.paginate(:per_page => 20, :page => params[:page])
    end
  end

  def destroy
    @file_attachment = FileAttachment.find(params[:id])
    if @file_attachment.folder.present?
      @folder = Folder.find(@file_attachment.folder)
      if @file_attachment.destroy
        flash[:notice] = "File Deleted!"
        redirect_to category_subcategory_folder_path(@folder.subcategory.category, @folder.subcategory, @folder)
      else
        flash[:error] = "File Not Deleted!"
        render :action => 'index'
      end
    else
      @subcategory = Subcategory.find(@file_attachment.subcategory_id)
      if @file_attachment.destroy
        flash[:notice] = "File Deleted!"
        redirect_to category_subcategory_path(@subcategory.category, @subcategory)
      else
        flash[:error] = "File Not Deleted!"
        render :action => 'index'
      end
    end
  end

end
