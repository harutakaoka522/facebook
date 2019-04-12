class Blog < ApplicationRecord
    validates :content, presence: true
    validates :image, presence: true
    belongs_to :user, optional: true
    mount_uploader :image, ImageUploader
end
