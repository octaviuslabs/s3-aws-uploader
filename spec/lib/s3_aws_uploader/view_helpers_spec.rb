require 'spec_helper'
require './lib/s3_aws_uploader/view_helpers'

module S3AwsUploader

  describe ViewHelpers do

    before(:all) do
      S3AwsUploader.configure do |c|
        c.storage_path = "FOO PATH"
        c.access_key = "A KEY"
        c.secret_key = "ANOTHER KEY"
        c.host = "A HOST"
        c.policy_expiration = 10
        c.max_filesize = 20
        c.bucket = "MyBucket"
      end
    end

    subject(:upload_form) do 
      obj = Object.new
      obj.extend(S3AwsUploader::ViewHelpers)
      obj
    end

    # The following fails
    #
    # it 'should have a button style defined on S3AwsUploader.config' do
    #   expect(S3AwsUploader.config.button_style).to be_a String
    # end

    it "generates HTML for a file form" do 
      expect(upload_form.s3_upload_field(:product_image, 'localhost/s3_upload')).to eql '<input id="product_image" name="file" type="file" data-path="localhost/s3_upload" style="display: none;" />'
    end

    it "generates a progress bar" do
      outcome = %[<div class="progress">\n<div id="product_image_progress" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">\n</div>\n</div>]
      expect(upload_form.progress_bar(:product_image)).to eql outcome
    end

    it "generates fields needed for upload" do
      expect(upload_form.bootstrap_s3_upload(:product_image, 'localhost/s3_upload')).to be_a String
    end

    it "generates a styled button that triggers upload on click"
    it "makes a GET request for the policy"
    it "posts the file and policy to AWS"
    it "streams back progress"
    it "writes the location back into the users form"

    # Failed states
    it "notify the user of a failed upload via flash hash update"
  end

end