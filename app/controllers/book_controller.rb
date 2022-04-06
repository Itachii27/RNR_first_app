class BookController < ApplicationController
    def index
        render "root/bookIndex"
    end

    def list
        render "root/bookList"
    end
    
    def show
        # Redirection
        # redirect_to('/bookList')
        render "root/bookShow"
    end

    def apiCall
        @callback = {
            :id => 1,
            :message => "hi",
            :name => "ninu"
        }

        render json: @callback
    end

    def user
        render json: params
        #render json: params[:id]
        #render json: params[:name]

    end 
    def add
        @post = Post.new
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save
        @callback = {
            :status => 200,
            :message => "saved successfully",
        }

        render json: @callback
        #render json: @post

        #render json: params
    end 

end