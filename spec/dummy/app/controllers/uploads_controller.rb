class UploadsController < ApplicationController

  helper S3AwsUploader::ViewHelpers

  def new
    @upload = 'test'
  end

end