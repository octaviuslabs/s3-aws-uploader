# require 'rails_helper'
# require 'capybara-webkit'
# Capybara.javascript_driver = :webkit

# feature 'javascript' do 

#   describe 'upload' do

#     before(:all) do
#       S3AwsUploader.configure do |c|
#         c.storage_path = "uploads"
#         c.access_key = ENV["rc_aws_access_key_id"]
#         c.secret_key = ENV["rc_aws_secret_access_key"]
#         c.host = 's3.amazonaws.com'
#         c.policy_expiration = 60
#         c.max_filesize = 2
#         c.bucket = "responsive-creative-development"
#       end
#     end

#     it "should upload", :js => true do
#       visit('/')
#       expect(page).to have_content 'New'

#       # product_image = page.find('#product_image', :visible=>false)
#       page.execute_script("$('#product_image').show()")
#       attach_file('product_image', "#{Rails.root}/spec/sample_images/sample_image.jpg")

#       sleep 3

#       expect('upload_product_image').to start_with "http"
#     end
#   end
# end