class RemoveLogoImageFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :logo_image, :text
  end
end
