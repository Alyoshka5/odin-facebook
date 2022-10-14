class ProfilesController < ApplicationController
    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])

        if @profile.update(profile_params())
            current_user.first_name = @profile.first_name if current_user.first_name != @profile.first_name
            current_user.last_name = @profile.last_name if current_user.last_name != @profile.last_name
            current_user.email = @profile.email if current_user.email != @profile.email
            current_user.save
            redirect_to current_user
        else
            render "edit", status: :unprocessable_entity
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:profile_image, :first_name, :last_name, :email, :about, :hobbies, :city)
    end
end
