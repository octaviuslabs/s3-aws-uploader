# S3 AWS Uploader

This gem provides form helpers to facilitate direct uploads to Amazon S3. The gem is intended to be used with Bootstrap and jQuery-File-Upload.

An example application demonstrating the gem's usage has been included for your convenience at `/example_app`.

## Installation

**Gemfile**

Add the gem to your gemfile.

    gem 's3_aws_uploader'

You will want to include the gems `jquery-fileupload-rails` and `bootstrap-sass`, or you can add these two libraries to your asset pipeline manually.

    //= require jquery-fileupload/basic

**/app/assets/javascripts/application.js**

Include the gem's JavaScript helper functions for your forms.

    //= require s3_aws_uploader/octavius-file-upload

**/app/assets/stylesheets/application.css.scss**

Include the gem's lightweight styling for file uploads.

    @import "s3_aws_uploader/octavius-file-upload";

If you're not using Sass (and instead you have a application.css file), use the following line.

    //= s3_aws_uploader/octavius-file-upload

**config/initializers/s3_uploader.rb**

Add an initializer with your AWS credentials. In the following example, the credentials are provided as environmental variables. You need to set these variables on your machine.

```ruby
S3AwsUploader.configure do |c|
  c.access_key = ENV["aws_access_key_id"]
  c.secret_key = ENV["aws_secret_access_key"]
  c.host = 's3.amazonaws.com'
  c.storage_path = "uploads"
  c.policy_expiration = 60
  c.max_filesize = 500 # max filesize in megabytes
  c.bucket = "your-aws-bucket-name" # the name of your bucket
end
```

You will need to set the environmental variables for `aws_access_key_id` and `aws_secret_access_key`. For example, you can set the environmental variable for aws_access_key_id from the command line with the following.

    export aws_access_key_id=your_aws_acces_key_id

**Enable CORS on your AWS S3 bucket**

Make sure the AWS S3 CORS settings for your bucket look similar to the following:

```xml
<CORSConfiguration>
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```

For more information see the following resource http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html.

**Mount the gem: config/routes.rb**

    mount S3AwsUploader::Engine, at: '/s3_uploader'

**Include view helper in the appropriate controller(s)**

In the controller that serves the views/forms for your uploads, include the following helper method `helper S3AwsUploader::ViewHelpers`.

Example:

```ruby
class UploadsController < ApplicationController
    helper S3AwsUploader::ViewHelpers
end
```

**Set up your form/view**

For your view, there are two main elements. Your view will look similar to the following:

```ruby
<%= form_for(@upload) do |f| %>
    <%= f.text_field :product_image, style: "display:none" %>
    <%= bootstrap_s3_upload(:product_image, '/s3_uploader/policy/new') %>
    <%= f.button :submit, class: "btn btn-default" %>
<% end %>
```

The form helper `bootstrap_s3_upload` generates a file attachment field and a progress bar. The helper takes two parameters: (1) the text field name on your model that will store the path of the uploaded file and (2) the path to your controller that serves AWS S3 policies -- which is located at `/s3_uploader/policy/new` by default.

You also need to enable these elements with JavaScript. For example:

```javascript
    <script>
        octaviusUpload('upload', 'product_image');
    </script>
```

The JavaScript helper method `octaviusUpload` takes two parameters: (1) the name of your Rails model and (2) the name of the text field on that model to store the location of uploaded files.

## Example application

An application that demonstrates the usage of the gem has been included. See `/example_app` for clarification.

## How does the gem work?

Once a file is attached to the form, `jQuery-file-upload` will make an AJAX request to a controller provided by the gem to retrieve a fresh S3 policy (i.e., credentials you need to upload a file to S3). Once these credentials are retrieved, `jQuery-file-upload` makes a second request to upload the file directly from the client to S3.

If the file is successfully saved to S3, a callback on the client's JavaScript will catch the full path of the file stored on S3. The JavaScript helper function `octaviusUpload` is used to update the progress bar as the file uploads and set the location of the uploaded file on your form. For each file that you want to upload on your form, you will need a (hidden) text_field to store the file's location.

## Thanks

* [Railscast #383](http://railscasts.com/episodes/383-uploading-to-amazon-s3)
* [S3DirectUpload](https://github.com/waynehoover/s3_direct_upload)
* [S3 Uploader](https://github.com/pk4media/s3_uploader)

## License

This repository is MIT-licensed.
