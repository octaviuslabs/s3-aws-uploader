require 'spec_helper'
require './lib/s3_aws_uploader'


### Required Elements
# Controller
# HTML Helper

module S3AwsUploader

  context "allows you to configure" do
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