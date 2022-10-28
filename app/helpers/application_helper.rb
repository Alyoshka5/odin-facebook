module ApplicationHelper
    def user_profile_image(user, size=40, borderRadius="50%")
        profile = user.profile
        if profile.profile_image.attached?
            image_tag profile.profile_image.variant(resize_to_fill: [size, nil]), style: "border-radius: #{borderRadius}"
        else
            image_tag "https://protechlighting.com/wp-content/uploads/sites/101/2019/12/profile-placeholder-square.png", width: size, height: size, style: "border-radius: 50%"
        end
    end
end

