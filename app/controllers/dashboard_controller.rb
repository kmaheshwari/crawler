class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	#require 'market_bot'
	def index
		url = "https://play.google.com/store/apps/category/LIFESTYLE"
		@page = Nokogiri::HTML(open(url))
		@data = @page.css("a.see-more")
		#@test=
	end
	def show
	end
end
