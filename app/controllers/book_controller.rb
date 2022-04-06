class BookController < ApplicationController
    def index
        @posts = Post.all
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
        @posts = Post.all
        render "root/bookIndex"
        #render json: @callback
        #render json: @post
        #render json: params
    end 
    def delete
        @post = Post.find(params[:id])
        @post.destroy
        @posts = Post.all
        render "root/bookIndex"
    end 

    def search
        @query = params[:query]
        @posts = Post.where("posts.title LIKE ?",["%#{@query}%"])
        render "root/bookIndex"
    end

    def update
        @post = Post.find(params[:id])
        @id = params[:id]
        @title= @post.title
        @description= @post.description
        render "root/update"
    end

    def updateform
        @post = Post.find(params[:id])
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save
        @posts = Post.all
        render "root/bookIndex"
    
    end


end