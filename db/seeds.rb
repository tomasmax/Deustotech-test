# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'uri'
require 'net/http'

#Load Canada British Columbia datasets related with "water" word

datasets_url = "http://apis.gov.bc.ca/bcdc/3/action/package_search?q=%22water%22&rows=355"
resp = Net::HTTP.get_response URI.parse(datasets_url)
result = JSON.parse resp.body

datasets = result["result"]["results"]

datasets.each do |d|
	dataset = Dataset.new
	dataset.object_name = d["object_name"]
	dataset.name = d["title"]
	dataset.license_title = d["license_title"]
	dataset.license_url = d["license_url"]
	dataset.save
	puts "Created Dataset #{dataset.object_name}"
end

puts "Datasets created"
