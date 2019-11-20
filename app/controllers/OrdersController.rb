# require_relative './application_controller.rb'
class OrdersController < Sinatra::Base
    # set :views, 'app/views/order'

    get '/orders' do
        @orders = Order.all
        erb :'/orders/index'
    end
end