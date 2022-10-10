class Post < ApplicationRecord
    belongs_to :user

    validates :content, presence: true, length: { maximum: 63206 }
end
