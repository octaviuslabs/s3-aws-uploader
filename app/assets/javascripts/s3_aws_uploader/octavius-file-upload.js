"use strict";

function octaviusUpload(fileInputSelector, progressBarSelector, inputReplacementSelector) {

  $(fileInputSelector).fileupload({ 
    autoUpload: false,
    add: function(e, data) {
      /*
       * !!!
       * Add JavaScript file type validation: .jpg, .png, etc...
       * See Railscast on jquery-fileupload for example code.
       *
       */

      $.ajax({
        url: $(fileInputSelector).data('path'),
        type: 'POST',
        dataType: 'json',
        async: false,
        success: function(retData) {

          $(fileInputSelector).fileupload('option', {
            url: retData.url,
            dataType: 'xml',
            formData: [
              {
                name: 'key',
                value: retData.key
              },
              {
                name: 'acl',
                value: retData.acl
              },
              {
                name: 'policy',
                value: retData.policy
              },
              {
                name: 'signature',
                value: retData.signature
              },
              {
                name: 'AWSAccessKeyId',
                value: retData.AWSAccessKeyId
              },
              {
                name: 'success_action_status',
                value: 201
              }
            ]
          });

          data.submit();

        }
      });
    },
    progress: function(e, data) {
      var fileUploadProgress = parseInt(data.loaded / data.total * 100, 10);

      $(progressBarSelector).css('width', fileUploadProgress+'%').attr('aria-valuenow', fileUploadProgress);
    },
    done: function(e, data) {
      var fileAmazonFullPath = $(data.result).find("PostResponse > Location").text();
      $(inputReplacementSelector).val(fileAmazonFullPath);
    },
    fail: function(e, data) {
      alert('File failed to upload =(');
    }
  });
}