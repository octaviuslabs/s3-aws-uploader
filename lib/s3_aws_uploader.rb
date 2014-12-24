require "s3_aws_uploader/engine"
require 's3_aws_uploader/config'
require 's3_aws_uploader/policy'

module S3AwsUploader

  def self.configure
    yield @configure ||= Config.new
  end

  def self.config
    return @configure
  end

  def self.reset
    @configure = nil
  end

end
