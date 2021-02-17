class UserApplicationsController < ApplicationController
  def show
    @app = UserApplication.find(params[:id])
    @pets = Pet.all.search_pet(params[:pet_search]) if params[:pet_search]
  end

  def new
    @user_application = UserApplication.new
  end

  def create
    app = UserApplication.new(app_params)
    if app.save
      redirect_to user_application_path(app.id)
    else
      flash[:error] = "Please Fill in all Required Fields"
      render :new
    end
  end

  def update
    app = UserApplication.find(params[:id])
    app.update(status: "Pending")
    redirect_to user_application_path(app.id)
  end

  private
  def app_params
    binding.pry
    params.permit(:name, :address, :city, :state, :zip, :description, :status)
  end
end
