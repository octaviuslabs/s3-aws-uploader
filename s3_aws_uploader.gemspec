$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "s3_aws_uploader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "s3_aws_uploader"
  s.version     = S3AwsUploader::VERSION
  s.authors     = ["Jack Cody"]
  s.email       = ["jack@octaviuslabs.com"]
  s.homepage    = "https://github.com/octaviuslabs/s3-aws-uploader"
  s.summary     = "Supports direct uploads to AWS S3."
  s.description = "S3 AWS Uploader facilitates direct uploads to Amazon S3. This gem is inteded to be used with Bootstrap and jQuery-File-Upload."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"
  s.add_dependency "jquery-fileupload-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "capybara-webkit"
end