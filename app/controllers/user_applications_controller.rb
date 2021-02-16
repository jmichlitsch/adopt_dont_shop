class UserApplicationsController < ApplicationController
  def show
    @app = UserApplication.find(params[:id])
  end

    def new
      @userapp = UserApplication.new
    end

    def create
      app = UserApplication.new(app_params)
      if app.save
        redirect_to "/user_application_path/#{app.id}"
        flash[:sucess] = nil
      else
        flash[:failure] = "Please Fill in all Required Fields"
        render :new
      end
    end

    private
    def app_params
      params.permit(:name, :address, :city, :state, :zip, :description)
    end
end
