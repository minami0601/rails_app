class Post < ApplicationRecord
    belongs_to :user
    has_many :photos, dependent: :destroy
    has_many :post_items, dependent: :destroy

    accepts_nested_attributes_for :photos
    accepts_nested_attributes_for :post_items

    def self.search(keyword)
        where(["caption like?", "%#{keyword}%"])
    end

end
