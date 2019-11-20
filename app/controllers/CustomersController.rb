# require_relative './application_controller.rb'
class CustomersController < Sinatra::Base
    
    set :views, "app/views/customers"

    get '/customers' do
        @customers = Customer.all 
        erb :index
    end

    get '/customers/new' do
        erb :new
    end

    get '/customers/:id' do
        @customers = Customer.find(params[:id])
        erb :show
    end

    get '/customers/:id/edit' do
        @customers = Customer.find(params[:id])
        erb :edit
    end

    get '/customers/delete' do
        erb :delete
    end

    patch '/customers/:id' do
        customer_name = params[:customer_name]
        customer = Customer.find(params[:id])
        customer.update(name: customer_name)
        redirect "/customers/#{customer.id}"
    end

    post '/customers' do
        name = params[:name]
        Customer.create(name: name)
        redirect "/customers"
    end

    

end