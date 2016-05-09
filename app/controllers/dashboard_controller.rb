class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	def index
		url = "https://play.google.com/store/apps/details?id=com.inditex.zara"
		@page = Nokogiri::HTML(open(url))
		#@data = @page.css("a.dev-link")[0]["href"]
	end
end
