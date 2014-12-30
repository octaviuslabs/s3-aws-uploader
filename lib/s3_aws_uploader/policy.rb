require 'base64'
require 'json'

module S3AwsUploader

  class Policy < SimpleDelegator
    attr_reader :acl, :success_action_status

    def initialize
      raise "No config provided on module!" if S3AwsUploader.config.nil?
      @success_action_status = "201"
      @acl = "public-read"
      super(S3AwsUploader.config)
    end

    def policy
      Base64.encode64(policy_payload.to_json).gsub("\n", "")
    end

    def policy_payload
      {
        expiration: policy_time_out,
        conditions: [
          #["starts-with", "$utf8", ""],
          ["starts-with", "$key", ""],
          ["content-length-range", 0, max_filesize],
          {bucket: bucket},
          {success_action_status: success_action_status},
          {acl: acl}
        ]
      }
    end

    def to_h
      {
        "url" => url,
        "key" => slug,
        "acl" => acl,
        "policy" => policy,
        "signature" => signature,
        "AWSAccessKeyId" => access_key
      }
    end
    alias_method :to_hash, :to_h

    def to_json
      to_h.to_json
    end

    def url
      "https://#{bucket}.#{host}/"
    end

    def slug
      "#{storage_path}/#{random_uuid}/${filename}"
    end

  private

    def random_uuid
      @random_uuid ||= SecureRandom.uuid
    end

    # Calculates the time that the policy will expire
    #
    #
    def policy_time_out
      @policy_time_out ||= (Time.new.utc+(policy_expiration*60)).strftime("%Y-%m-%dT%H:%M:%SZ")
    end

    # Calculates the signature from the policy and secret ket
    # 
    def signature
      @signature ||= Base64.encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest::Digest.new('sha1'),
          secret_key, policy
        )
      ).gsub("\n", "")
    end

  end

end