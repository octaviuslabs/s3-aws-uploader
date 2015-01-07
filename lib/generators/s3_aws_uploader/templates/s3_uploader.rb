S3AwsUploader.configure do |c|
  c.access_key = ENV["aws_access_key_id"]
  c.secret_key = ENV["aws_secret_access_key"]
  c.host = 's3.amazonaws.com'
  c.storage_path = "uploads"
  c.policy_expiration = 180 # minutes
  c.max_filesize = 500 # megabytes
  c.bucket = "your_bucket_name" # the name of your bucket
end