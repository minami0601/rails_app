class PostItem < ApplicationRecord
    belongs_to :post

    mount_uploader :img, ImageUploader
end
