class Shop < ApplicationRecord
    belongs_to :user

    mount_uploader :img, ImageUploader
    
    geocoded_by :address #追記
    after_validation :geocode, if: :address_changed?
end
