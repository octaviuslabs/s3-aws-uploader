class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :background_image
      t.text :logo_image
      t.text :product_image

      t.timestamps
    end
  end
end
