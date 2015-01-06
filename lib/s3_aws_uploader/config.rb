module S3AwsUploader

  # TODO: Document how the defaults work
  class Config
    attr_accessor :storage_path, :access_key, :secret_key, :host, :policy_expiration, :max_filesize, :bucket, :button_style
    def initialize
      @storage_path = "uploads" #  "#{storage_path}/#{random_uuid}/${filename}"
      @policy_expiration = 60 # in minutes
      @max_filesize = 500 # in megabytes
      @bucket = "s3_uploader" # specify the name of your AWS S3 bucket!
      @host = "s3.amazonaws.com"
      @button_style = "btn btn-default btn-xs"
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
      raise "No host location specified" if @host.nil?
      return @host
    end
  end

end