class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'

	def index

                  

	end


	def scrap


        @all_emails = [] 

        @all_apps = [] 

		url =  params[:cateogry].to_s
		@page = Nokogiri::HTML(open(url))

		@page.css("div.details").each do |item| 
	 
     	 app_name =  item.css("a").text 
	     @all_apps.push(app_name) 
          
         url_developer =  item.css("a")[1]["href"] 

	     url2 = "https://play.google.com#{url_developer}"  
	

		 email = Nokogiri::HTML(open(url2)) 
	     email_value =  email.css("a.dev-link")[1].to_s 
	     
	     index_chop = email_value.index(">").to_i      
		 email_value[index_chop+6..-5] 
		 @all_emails.push(email_value[index_chop+6..-5])

          end


end


end