Rails.application.routes.draw do

  mount S3AwsUploader::Engine => "/s3_aws_uploader"

  root to: 'uploads#new'

end
