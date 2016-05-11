class DashboardController < ApplicationController
	require 'rubygems'
	require 'nokogiri'   
	require 'open-uri'
	require 'spreadsheet'

	def index
	end
	def scrap
		#!/usr/bin/env ruby
		# Begin Test
		print "Spreadsheet Test\n"

		# Create the rows to be inserted
		row_1 = ['AppName', 'Developer']

		# Create a new Workbook
		new_book = Spreadsheet::Workbook.new

		# Create the worksheet
		new_book.create_worksheet :name => 'Sheet Name'

		# Add row_1
		new_book.worksheet(0).insert_row(0, row_1)

		# Write the file
		new_book.write('test.xls')

		# Open the previously created Workbook
		open_book = Spreadsheet.open('test.xls')

		# Get the row index in order to append a new row 
		# after any exisitng rows with data
		new_row_index = open_book.worksheet(0).last_row_index + 1

		#url =  params[:cateogry].to_s
		url = "https://play.google.com/store/apps"
		@page = Nokogiri::HTML(open(url))
		#@data = @page.css("a.dev-link")[0]["href"]
		@data1 = @page.css("a.see-more")
		@category = []
		@app = []
		@email = []
		@data1.each do |d|
			@category << d["aria-label"]
			@url1 = "https://play.google.com" + d["href"]
			@all_apps = Nokogiri::HTML(open(@url1))
			@app_urls = @all_apps.css("a.title")
			
			@app_urls.each do |a|
				@url_app = "https://play.google.com" + a["href"]
				@app_info = Nokogiri::HTML(open(@url_app)) rescue nil
				@app << @app_info.css("div.id-app-title").text
				print @app_info.css("div.id-app-title").text + '\n'
				@dev_link = @app_info.css("a.dev-link")
				@dev_link.each do |dl|
					if dl["href"][0..6] == "mailto:" 
						@email << dl["href"][7..-1]
						print dl["href"][7..-1] + '\n'
						@row_2 = [@app_info.css("div.id-app-title").text, dl["href"][7..-1]]
					end
				end
				open_book.worksheet(0).insert_row(new_row_index, @row_2)

				# Delete the file so that it can be re-written
				File.delete('test.xls')
				
				# Write out the Workbook again
				open_book.write('test.xls')
			end
		end
	end
end
