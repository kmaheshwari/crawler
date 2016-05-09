class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	#require 'market_bot'
	def index
		url = "https://play.google.com/store/apps"
		@page = Nokogiri::HTML(open(url))
		#@data = @page.css("a.dev-link")[0]["href"]
		@data1 = @page.css("a.see-more")
		@data = []
		@data1.each do |d|
			@data << d["href"]
			@url1 = "https://play.google.com" + d["href"]
			@all_apps = Nokogiri::HTML(open(@url1))
			@app_urls = @all_apps.css("a.card-click-target")
			@app_name = []
			@app_urls.each do |a|
				@app_name << a["href"]
				@url_app = "https://play.google.com" + a["href"]
				@app_info = Nokogiri::HTML(open(@url1))
				@all_names = @app_info.css("div.id-app-title")
				@all_emails = @app_info.css("a.dev-link")[0]["href"]
			end
		end
		#@test=
	end
end
