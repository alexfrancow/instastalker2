class HomeController < ApplicationController
  def index
  	@user = params[:search_user]

  	if @user
		require 'net/http'
		require 'json'
		url = 'https://www.instagram.com/'+@user+'/?hl=en'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		doc = Nokogiri::HTML(response)
		script = doc.css('script')
		script = script.to_s
		startstring = "window._sharedData"
		endstring = ";</script>"
		@json_data = script[/#{startstring}(.*?)#{endstring}/m, 1].gsub("=", "")
		#@y = ActiveSupport::JSON.decode(@x)
	end
  end
end
