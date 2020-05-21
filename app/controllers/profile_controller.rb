class ProfileController < ApplicationController
    def show
        if doctor_signed_in?
            @user=current_doctor
        else
            @user=current_patient
        end
    end
end
