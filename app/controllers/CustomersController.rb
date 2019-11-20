# require_relative './application_controller.rb'
class CustomersController < Sinatra::Base
    
    set :views, "app/views/customers"
    set :method_override, true

    get '/customers' do
        @customers = Customer.all 
        erb :index
    end

    get '/customers/new' do
        erb :new
    end

    get '/customers/:id' do
        @customer = Customer.find(params[:id])
        erb :show
    end

    get '/customers/:id/edit' do
        @customer = Customer.find(params[:id])
        erb :edit
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

    delete '/customers/:id' do 
      @customer = Customer.find(params[:id])
      @customer.delete
        redirect '/customers'
    end

    

end