module S3AwsUploader

  # TODO: Document how the defaults work
  class Config
    attr_accessor :storage_path, :access_key, :secret_key, :host, :policy_expiration, :max_filesize, :bucket
    def initialize
      @storage_path = "uploads"
      @policy_expiration = 60 #in minutes
      @max_filesize = 500 #in megabytes
      @bucket = "s3_uploader"
    end

    def access_key
      raise "No access key specified" if @access_key.nil?
      return @access_key
    end


    def secret_key
      raise "No secret_key specified" if @secret_key.nil?
      return @secret_key
    end

    def host
      raise "No host key specified" if @host.nil?
      return @host
    end
  end

end