class ApisController < ApplicationController
  def index
    if params[:query].present?
      @apis = Api.search_by_name_and_description(params[:query])
    else
      redirect_to root_url
    end
  end
end