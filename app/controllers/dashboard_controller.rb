class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	def index
		url = "https://play.google.com/store/apps/category/LIFESTYLE"
		@page = Nokogiri::HTML(open(url))
		@data = @page.css("a.see-more")
	end
end
