class ArticlesController < ApplicationController

    before_action :authenticate_user!
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def new
        @article = Article.new
        @categories = Category.all
    end
    
    def create
        @article = current_user.articles.create(article_params)
        @article.save_categories
        redirect_to @article
    end

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update

        if @article.user == current_user
            @article.update(article_params)
            @article.save_categories
            redirect_to @article
        else
            redirect_to @article, alert: "No puedes editar un articulo que no te pertenece"
        end
        
    end

    def destroy

        if @article.user == current_user
            @article.destroy
            redirect_to articles_path
        else
            redirect_to @article, alert: "No puedes eliminar un articulo que no te pertenece"
        end
        
    end

    def find_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :content, category_elements: [])
    end

    def user_articles
        
    end

end