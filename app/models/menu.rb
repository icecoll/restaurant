class Menu < ActiveRecord::Base
  paginates_per 5
  mount_uploader :image, ImageUploader


end
