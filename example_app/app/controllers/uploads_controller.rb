class UploadsController < ApplicationController

  helper S3AwsUploader::ViewHelpers

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to uploads_path, notice: 'Upload created!'
    else
      redirect_to new_upload_path, notice: 'Error creating upload!'
    end
  end

  def show
    @upload = Upload.find(params[:id])
  end

  private

  def upload_params
    params.require(:upload).permit(:product_image)
  end

end