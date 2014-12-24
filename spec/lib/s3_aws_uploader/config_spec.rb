require 'spec_helper'
require './lib/s3_aws_uploader/config'

module S3AwsUploader
  describe Config, focus: true do
    subject(:config){ Config.new }
    it { is_expected.to respond_to(:storage_path) }
    it { is_expected.to respond_to(:access_key) }
    it { is_expected.to respond_to(:secret_key) }
    it { is_expected.to respond_to(:host) }
    it { is_expected.to respond_to(:policy_expiration) }
    it { is_expected.to respond_to(:max_filesize) }
    context "should be able to the configurations" do
      subject(:config) do
        c = Config.new
        c.storage_path = "FOO PATH"
        c.access_key = "A KEY"
        c.secret_key = "ANOTHER KEY"
        c.host = "A HOST"
        c.policy_expiration = 10
        c.max_filesize = 20
        c.bucket = "My Bucket"
        c
      end

      it { expect(subject.storage_path).to eq "FOO PATH" }
      it { expect(subject.access_key).to eq "A KEY" }
      it { expect(subject.secret_key).to eq "ANOTHER KEY" }
      it { expect(subject.host).to eq "A HOST" }
      it { expect(subject.policy_expiration).to eq 10 }
      it { expect(subject.max_filesize).to eq 20 }
      it { expect(subject.bucket).to eq "My Bucket" }


    end
    context "should configure using defaults" do
      subject(:config){ Config.new }
      it { expect(subject.storage_path).to eql "uploads"}
      it { expect(subject.policy_expiration).to eql 60}
      it { expect(subject.max_filesize).to eql 500}
      it { expect(subject.bucket).to eql "s3_uploader"}
      it { expect{ subject.access_key }.to raise_error("No access key specified") }
      it { expect{ subject.secret_key }.to raise_error("No secret_key specified") }
      it { expect{ subject.host }.to raise_error("No host key specified") }
    end
  end
end