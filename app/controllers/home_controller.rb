class HomeController < ApplicationController
  def index
    @countries = Country.all
    if params[:country].present?
      @country = Country.find_by_slug(params[:country])
      if @country.present?
        @apis = @country.apis
      else
        redirect_to root_url
      end
    else
      @apis = Api.all
    end
  end
end
