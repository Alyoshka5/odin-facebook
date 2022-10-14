class Profile < ApplicationRecord
    has_one_attached :profile_image
    belongs_to :user

    validates :email, uniqueness: true
end
