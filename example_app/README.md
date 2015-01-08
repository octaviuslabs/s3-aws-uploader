# Demo Application for S3 AWS Uploader

To get this application to work, you will need a valid AWS S3 account. You also must enable CORS on your AWS S3 bucket.

Fill in the config file located at `config/initializers/s3_uploader.rb` with the information for your S3 bucket. At the minimum, you will want to change the line `c.bucket = "responsive-creative-development"` to instead feature the name of your S3 bucket.

You will also need to set the environmental variables for your S3 access key and secret access key. In this particular application, the names of these variables are specified in `config/initializers/s3_uploader.rb` as `ENV["rc_aws_access_key_id"]` and `ENV["rc_aws_secret_access_key"]`. These can be set at your terminal with the following commands

    export rc_aws_access_key_id=your_aws_access_key
    export rc_aws_secret_access_key=your_aws_secret_access_key