class PetApplicationsController < ApplicationController
  def create
    pet_app = PetApplication.create(user_application_id: params[:user_application_id], pet_id: params[:pet_id])
    redirect_to user_application_path(params[:user_application_id])
  end

  def update
  end

end
