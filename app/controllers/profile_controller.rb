class ProfileController < ApplicationController
    def show
        begin
            @user=Doctor.find_by_username(params[:id])
            if @user == nil
                @user=Patient.find_by_username(params[:id])
                if @user == nil
                    redirect_to(root_path) and return
                else
                    if current_patient
                        if @user != current_patient
                            redirect_to(root_path) and return
                        end
                    end
                end
            end
            rescue ActiveRecord::RecordNotFound => e
            redirect_to(root_path) and return
        end
    end
end
