class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'

	def index

                  

	end


	def scrap

	
		url =  params[:cateogry].to_s


		@page = Nokogiri::HTML(open(url))

	end
end
