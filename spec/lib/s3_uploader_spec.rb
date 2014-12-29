require 'spec_helper'
require './lib/s3_aws_uploader'

### Required Elements
# HTML
# There is a styled Button that says upload
# On click it triggers the upload
# Get REQUEST happens for the policy (to our server)
# POST To AWS happens
# Progress happens
# File location is placed into the application form

module S3AwsUploader

  context "HTML Helper" do

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

    it "generates bootstrap HTML" do
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

  context "Configuration" do
    subject(:my_module) do
      S3AwsUploader.configure do |c|
        c.storage_path = "FOO PATH"
        c.access_key = "A KEY"
        c.secret_key = "ANOTHER KEY"
        c.host = "A HOST"
        c.policy_expiration = 10
        c.max_filesize = 20
        c.bucket = "MyBucket"
      end
      S3AwsUploader
    end
    it { expect(my_module.config.storage_path).to eql "FOO PATH" }
    it { expect(my_module.config.access_key).to eql "A KEY" }
    it { expect(my_module.config.secret_key).to eql "ANOTHER KEY" }
    it { expect(my_module.config.host).to eql "A HOST" }
    it { expect(my_module.config.policy_expiration).to eql 10 }
    it { expect(my_module.config.max_filesize).to eql 20 }
    it { expect(my_module.config.bucket).to eql "MyBucket" }
  end

end