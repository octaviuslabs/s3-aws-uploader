require './spec/rails_helper'
require './app/controllers/s3_aws_uploader/s3_upload_policies_controller'
require './spec/lib/s3_aws_uploader/test_utils'

module S3AwsUploader
  describe S3UploadPoliciesController, type: :controller do
    routes { S3AwsUploader::Engine.routes }

    context "should respond successfully" do
      subject(:response) do
        TestUtils.setup_config
        get :new, format: :json
      end
      it{ is_expected.to have_http_status(200) }
      it{ is_expected.to be_successful }
    end
    it "should not work if you are not authenticated"
  end
end
