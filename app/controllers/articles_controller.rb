class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.create(title: params[:article][:title])
        render json: @article
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(title: params[:article][:title])
        redirect_to @article
    end

end