require 'rails/generators/base'

module S3AwsUploader
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      def install
        puts "Adding route..."
        route "mount S3AwsUploader::Engine, at: '/s3_uploader'"

        # insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require s3_aws_uploader/octavius-file-upload\n", :after => "jquery_ujs\n"
        # insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "\n#{detect_css_format[1]} require s3_aws_uploader/octavius-file-upload\n", :after => "require_self"

        puts "Creating config/initializers/s3_uploader.rb"
        copy_file 's3_uploader.rb', "config/initializers/s3_uploader.rb"
      end

      # https://github.com/zurb/foundation-rails/blob/master/lib/foundation/rails/generators/install_generator.rb
      # this style seems to miss .js.erb files...
      # def detect_js_format
      #   return ['.coffee', '#='] if File.exist?('app/assets/javascripts/application.coffee')
      #   return ['.js.coffee', '#='] if File.exist?('app/assets/javascripts/application.js.coffee')
      #   return ['.js', '//='] if File.exist?('app/assets/javascripts/application.js')
      # end

      # # https://github.com/zurb/foundation-rails/blob/master/lib/foundation/rails/generators/install_generator.rb
      # def detect_css_format
      #   return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
      #   return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
      #   return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
      #   return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
      #   return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
      # end

    end
end