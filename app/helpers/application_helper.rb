module ApplicationHelper
    def user_profile_image(user, size=40)
        if user.profile_image.attached?
            image_tag user.profile_image.variant(resize_to_fill: [size, nil])
        else
            image_tag "https://protechlighting.com/wp-content/uploads/sites/101/2019/12/profile-placeholder-square.png", width: size, height: size
        end
    end
end

