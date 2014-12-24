S3AwsUploader::Engine.routes.draw do
  post "/policy/new" => "s3_upload_policies#new"
end
