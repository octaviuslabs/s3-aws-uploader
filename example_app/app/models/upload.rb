class Upload < ActiveRecord::Base
  validates :product_image, presence: true
end