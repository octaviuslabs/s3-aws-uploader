# S3 AWS Uploader

S3 AWS Uploader provides form helpers to easily allow uploads directly to Amazon S3. The gem is intended to be used with Bootstrap and jQuery-fileupload and avoids excessive magic.

See some_url for an example application.

## Installation
Add the gem to your gemfile.

**Gemfile**

    gem 's3_aws_uploader'
    
You'll also likely want to include the gems 'jquery-fileupload-rails' and 'bootstrap-sass', or you can include these two elements manually. Include a more thorough explanation for this...

Include the gem's JavaScript helper functions for your forms.

**application.js**

    //= require s3_aws_uploader/octavius-file-upload


Add an initializer with your AWS credentials. In the following example, the credentials are provided as environmental variables. You need to set these variables on your machine.

**config/initializers/s3_uploader.rb**

    S3AwsUploader.configure do |c|
      c.access_key = ENV["aws_access_key_id"]
      c.secret_key = ENV["aws_secret_access_key"]
      c.host = 's3.amazonaws.com'
      c.storage_path = "uploads"
      c.policy_expiration = 60
      c.max_filesize = 500 # max filesize in megabytes
      c.bucket = "your-aws-bucket-name" # the name of your bucket
    end
    
Enable CORS on your AWS S3 bucket by changing the settings on AWS to something like this (review how to change these settings!)

    Provide example CORS settings...

**Mount the gem: /config/routes.rb**

    mount S3AwsUploader::Engine, at: '/s3_uploader'

- Provide a better explanation of this...

**Include view helper in the appropriate controller(s)**

In the controller that serves the views/forms for your uploads, include the following helper method `helper S3AwsUploader::ViewHelpers`.

Example

    class UploadsController < ApplicationController
        helper S3AwsUploader::ViewHelpers
    end

**Set up your form/view**

For your view, there are two main elements. Your view will end up looking like the following example:

    <%= form_for(@upload) do |f| %>
        <%= f.text_field :product_image, style: "display:none" %>
        <%= bootstrap_s3_upload(:product_image, '/s3_uploader/policy/new') %>
    <% end %>

The form helper `bootstrap_s3_upload` generates a file attachment field and a progress bar. The helper takes two parameters: (1) the string/text field name on your model/form that will store the path of the uploaded file and (2) the path to your controller that serves AWS S3 policies -- which is located at `'/s3_uploader/policy/new'` by default.

You also need to enable these elements with JavaScript. For example

    script
        octaviusUpload('#product_image_upload', '#product_image_progress', '#upload_product_image');
    /script

The JavaScript helper method octaviusUpload takes three parameters: (1) fileInputSelector, (2) progressBarSelector, (3) inputReplacementSelector. [Explain this better...]



## S3 Configuration

As stated above, make sure your AWS S3 CORS Settings for your bucket look like this: ...

(http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html)

## Example application

An application that demonstrates the usage of the gem has been included. See `path/to/example` for clarification.

## How does the gem work?

Once a file is attached to the form, jQuery-file-upload will make an AJAX request to a controller provided by the gem to retrieve a fresh S3 policy (i.e., credentials you need to upload a file to S3). Once these credentials are retrieved, jQuery-file-upload makes a second request to send the file to S3.

If the file is successfully saved to S3, a callback will catch the full path of the file stored on S3. The JavaScript helper function `octaviusUpload` is used to update the progress bar as the file uploads and set the location of the uploaded file on your form. For each file that you want to upload on your form, you will need a (hidden) text_field to store the file's location.

## Thanks

## License