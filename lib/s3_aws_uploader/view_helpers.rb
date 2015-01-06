module S3AwsUploader
  module ViewHelpers

    def s3_upload_field(input_field, s3_upload_controller_path)
      input_field = input_field.to_s.gsub('-', '_')
      
      input_field = input_field.to_s # + '_upload'
      return output = %[<input id="#{input_field}" name="file" type="file" data-path="#{s3_upload_controller_path}" style="display: none;" />]
    end

    def progress_bar(input_field)
      input_field = input_field.to_s.gsub('-', '_')
      input_field = input_field.to_s + '_progress'

      return output = %[<div class="progress">\n<div id="#{input_field}" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">\n</div>\n</div>]
    end

    def bootstrap_s3_upload(input_field, s3_upload_controller_path)
      output = %[<div id="#{input_field}_container" class="file-input-container">]
      output += %[<div id="#{input_field}_status">]
      output += %[<button id="#{input_field}_choose_file" type="button" class="#{S3AwsUploader.config.button_style}">choose file</button><div class="file-upload-filename">No file selected.</div>]
      output += %[</div>]
      output += s3_upload_field(input_field, s3_upload_controller_path)
      output += progress_bar(input_field)
      output += %[</div>]
      return output.html_safe
    end

  end
end