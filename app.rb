#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index			
end

get '/about' do
	erb :about
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
end

post '/cart' do
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

# выводим, когда корзина пуста

	if @items.length == 0
		return erb :cart_is_empty	
	end

	erb :cart
end

def parse_orders_input orders_input

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