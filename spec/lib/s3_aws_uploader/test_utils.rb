module S3AwsUploader
  module TestUtils

    def self.current_time
      @current_time ||= Time.now
    end

    def self.setup_config
      S3AwsUploader.configure do |c|
        c.storage_path = "FOO PATH"
        c.access_key = "A KEY"
        c.secret_key = "ANOTHER KEY"
        c.host = "A HOST"
        c.policy_expiration = 60
        c.max_filesize = 1024
        c.bucket = "thebucket"
      end
    end

    def self.example_policy_payload
      {
          expiration: self.current_time+60,
          conditions: [
            #["starts-with", "$utf8", ""],
            ["starts-with", "$key", ""],
            ["content-length-range", 0, 1024],
            {bucket: "thebucket"},
            {success_action_status: "201"},
            {acl: "public-read"}
          ]
        }
    end

    def self.example_policy_hash
      {
        "url" => "https://thebucket.A HOST/",
        "key" => "FOO PATH/RANDOMSTRING/${filename}",
        "acl" => "public-read",
        "policy" => "THISISMYPOLICY",
        "signature" => "THISISMYSIGNATURE",
        "AWSAccessKeyId" => "A KEY"
      }
    end
  end
end