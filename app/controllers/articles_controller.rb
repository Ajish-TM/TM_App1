class ArticlesController < ApplicationController
    before_action :set_article, only:[:show,:edit,:update,:destroy]
    before_action :login_requried, except:[:show,:index]
    before_action :require_same_user, only:[:edit,:update,:destroy]
    def show
      
    end
    def index
        @articles=Article.paginate(page: params[:page], per_page: 5)
    end
    def new
        @article=Article.new
    end
    def edit
      
      
    end
    def create
        @article=Article.new(set_params)
        @article.user = current_user
       # render plain:@article.inspect
       if @article.save
        flash[:notice]="Data Created."
       redirect_to @article
       else 
       
        # render :new, status: :unprocessable_entity
        render 'new'

       end
    end
    def update 
        
       if @article.update(set_params)
        flash[:notice]="Artcle is updated"
        redirect_to @article
       else
        render 'new'
       end

    end
    def destroy
        
        @article.destroy
        redirect_to articles_path
    end
    private
    def set_article
        @article=Article.find(params[:id])
    end
    def set_params
        params.require(:article).permit(:title,:description)
    end
    def require_same_user 
        if current_user!=@article.user && !current_user.admin?
            flash[:alert]="You can only edit or Detele Your Articles"
            redirect_to @article
        end
    end
end