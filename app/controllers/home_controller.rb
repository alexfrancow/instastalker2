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
		@scripts = doc.css('script')
		@scripts = @scripts.to_s
		startstring = "_sharedData"
		endstring = "</script"
		@x = @scripts[/#{startstring}(.*?)#{endstring}/m, 1]
	end
  end
end
