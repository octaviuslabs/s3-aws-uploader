require 'spec_helper'
require './lib/s3_aws_uploader/view_helpers'

module S3AwsUploader

  describe ViewHelpers do

    subject(:upload_form) do 
      obj = Object.new
      obj.extend(S3AwsUploader::ViewHelpers)
      obj
    end

    it "generates HTML for a file form" do 
      expect(upload_form.s3_upload_field(:product_image, 'localhost/s3_upload')).to eql '<input id="product-image-upload" name="file" type="file" data-path="localhost/s3_upload" />'
    end

    it "generates a progress bar" do
      outcome = %[<div class="progress">\n<div id="product-image-progress" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">\n</div>\n</div>]
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