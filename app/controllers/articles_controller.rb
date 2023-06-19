class ArticlesController < ApplicationController

    before_action :authenticate_user!

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        redirect_to @article
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
        @article.update(title: params[:article][:title], content: params[:article][:content])
        redirect_to @article
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

end