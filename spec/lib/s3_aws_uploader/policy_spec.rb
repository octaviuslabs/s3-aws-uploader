require 'spec_helper'
require './lib/s3_aws_uploader'
require './spec/lib/s3_aws_uploader/test_utils'

module S3AwsUploader

  describe Policy do
    before(:each){TestUtils.setup_config}
    subject(:new_cred){ Policy.new }
    it { expect(subject.storage_path).to eql "FOO PATH" }
    it { expect(subject.access_key).to eql "A KEY" }
    it { expect(subject.secret_key).to eql "ANOTHER KEY" }
    it { expect(subject.host).to eql "A HOST" }
    it { expect(subject.policy_expiration).to eql 60 }
    it { expect(subject.max_filesize).to eql 1024 }
    it { expect(subject.bucket).to eql "thebucket" }
    it { is_expected.to_not respond_to(:signature) }
    it { is_expected.to respond_to(:policy) }

    it "should have a properly formatted payload" do
      allow(subject).to receive(:policy_time_out){ TestUtils.current_time+60 }
      expect(subject.policy_payload).to eql TestUtils.example_policy_payload
    end

    it "should convert max_filesize from megabytes to bytes" do
      subject.max_filesize = 10
      expect(subject.max_filesize_in_bytes).to eql 10485760
    end

    it "should have a properly formatted hash" do
      allow(subject).to receive(:policy){ "THISISMYPOLICY" }
      allow(subject).to receive(:signature){ "THISISMYSIGNATURE" }
      allow(subject).to receive(:slug){ "FOO PATH/RANDOMSTRING/${filename}" }
      allow(subject).to receive(:host){ "A HOST" }
      expect(subject.to_h).to eql TestUtils.example_policy_hash
    end

    context "should complain if no config is provided" do
      before(:each){ S3AwsUploader.reset }
      it{ expect{ Policy.new }.to raise_error "No config provided on module!" }
    end

    it "should build the url" do
      url_expectation = %[https://thebucket.A HOST/]
      expect(subject.url).to eql url_expectation
    end

    it "should build the slug" do
      allow(subject).to receive(:random_uuid){ "RANDOMSTRING" }
      expectation = "FOO PATH/RANDOMSTRING/${filename}"
      expect(subject.slug).to eql expectation
    end
    it "may be able to change the name of the file on upload"

  end
end