class AdminUserApplicationsController < UserApplicationController
  class Admin::UserApplicationsController < ApplicationController

    def index
      @apps = UserApplication.all
    end

    def show
      @app = UserApplication.find(params[:id])
      if params[:search]
        @selected = Pet.search(params[:search])
      end
      if params[:adopt]
        chosen = Pet.find(params[:pet_id])
        @pet_app = PetApplication.create!(pet_id: chosen.id, app_id: @app.id)
      end
      if params[:description] != nil
        @app.update(status: "Pending")
      end
    end


    def new
    end

    def create
      app = UserApplication.new(app_params)
      if app.save
        redirect_to user_apps_show_path(app.id)
      else
        flash.now[:notice] = "UserApplication not created: Required information missing."
        render :new
      end
    end

    private
    def app_params
      params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
    end
  end
