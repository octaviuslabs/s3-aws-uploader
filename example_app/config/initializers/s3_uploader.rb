S3AwsUploader.configure do |c|
  c.access_key = ENV["rc_aws_access_key_id"]
  c.secret_key = ENV["rc_aws_secret_access_key"]
  c.host = 's3.amazonaws.com'
  c.storage_path = "uploads"
  c.policy_expiration = 60 # in minutes
  c.max_filesize = 2 # in megabytes
  c.bucket = "responsive-creative-development" # change this to the name of your bucket
end