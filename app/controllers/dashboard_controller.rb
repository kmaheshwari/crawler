class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'

	def index

    end


	def scrap
		#url =  params[:cateogry].to_s
		url = "https://play.google.com/store/apps"
		@page = Nokogiri::HTML(open(url))
		#@data = @page.css("a.dev-link")[0]["href"]
		@data1 = @page.css("a.see-more")

    end

    def downloadexcel
     send_file '/home/rajiv/Rails Apps/crawler/test.xls', :type=>"application/xls", :x_sendfile=>true
    end

end
