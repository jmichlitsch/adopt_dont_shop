class PetApplicationsController < ActionController::Base

  def index
    @pet_applications = PetApplications.all
  end

  def update
    @pet_app = PetApplication.where(pet_id: params[:pet_id] ,user_application_id: params[:user_application_id])
    if params[:approved] == "true"
      @pet_app.update(approved: true)
    else params[:approved] == "false"
      @pet_app.update(approved: false)
    end
    redirect_to admin_user_application_path
  end
end
