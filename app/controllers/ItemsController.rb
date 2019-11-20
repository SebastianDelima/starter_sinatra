# require_relative './application_controller.rb'
class ItemsController < Sinatra::Base

    set :views, 'app/views/items'
    set :method_override, true

    get '/items' do 
        @items = Item.all 
        erb :index
    end

    get '/items/new' do
        erb :new
    end

    get '/items/:id' do 
        # item_id = params[:id]
        @item = Item.find(params[:id])
        erb :show
    end

    get '/items/:id/edit' do 
        @item = Item.find(params[:id])
        erb :edit
    end

    patch '/items/:id' do 
        name = params[:name]
        item = Item.find(params[:id])
        item.update(name: name)
        redirect "/items/#{item.id}"
    end


    post '/items' do 
       name = params[:name]
       Item.create(name: name)
       redirect '/items'
    end

    delete '/items/:id' do 
        item = Item.find(params[:id])
        item.delete
        redirect '/items'
    end


   
end

