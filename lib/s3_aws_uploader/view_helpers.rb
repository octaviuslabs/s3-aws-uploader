module S3AwsUploader
  module ViewHelpers

    def s3_upload_field(input_field, s3_upload_controller_path)
      input_field = input_field.to_s.gsub('_', '-')
      input_field = input_field + '-upload'
      %[<input id="#{input_field}" name="file" type="file" data-path="#{s3_upload_controller_path}" />]
    end

    def progress_bar(input_field)
      input_field = input_field.to_s.gsub('_', '-')
      input_field = input_field + '-progress'

      %[<div class="progress">\n<div id="#{input_field}" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">\n</div>\n</div>]
    end

    def bootstrap_s3_upload(input_field, s3_upload_controller_path)
      output = s3_upload_field(input_field, s3_upload_controller_path)
      output += progress_bar(input_field)
    end


  end
end