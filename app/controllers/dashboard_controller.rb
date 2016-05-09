class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	
	def index
		@all=[]
		url = "https://play.google.com/store/apps"
		@page = Nokogiri(open(url))
		@data = @page.css("a.see-more")
		@data.each do |d|
			@all.append(d['href'])
		end
		app_info=[]
		@all.each do |n|
			@u= "https://play.google.com"+n
			@page1 = Nokogiri(open(url))
			#@app_info.append(@page1.css("div.id"app-title"))
		end
	end
	def show
	end
end
