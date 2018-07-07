class HomeController < ApplicationController
  def index
  	@user = params[:search_user]
  end
end
