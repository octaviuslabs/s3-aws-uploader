class RemoveBackgroundImageFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :background_image, :text
  end
end
