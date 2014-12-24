require_dependency "s3_aws_uploader/application_controller"

module S3AwsUploader
  class S3UploadPoliciesController < ApplicationController

    def new
      policy = S3AwsUploader::Policy.new
      respond_to do |format|
        format.all { render json: policy.to_json }
      end
    end

  end
end
