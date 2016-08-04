#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index			
end

get '/about' do
	erb :about
end

post '/cart' do
	orders_input = params[:orders]
	erb "Hello World #{orders_input}"
end

def parse_orders_line orders_input

	s1 = orders_input.split(',')

	arr=[]

	s1.each do |string|
		arr2=[]
		s2 = string.split('=')
		s3 = s2[0].split('_')
	
		id = s3[1]
		value = s2[1]
		arr2.push(id)
		arr2.push(value)
		arr.push(arr2)
	

	end

	return arr

end