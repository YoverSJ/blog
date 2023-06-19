class ArticlesController < ApplicationController

    before_action :authenticate_user!
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = Article.new
    end
    
    def create
        @article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])
        redirect_to @article
    end

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
    end

    def update
        @article.update(title: params[:article][:title], content: params[:article][:content])
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    def find_article
        @article = Article.find(params[:id])
    end

end