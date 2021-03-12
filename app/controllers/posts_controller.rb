class PostsController < ApplicationController
    before_action :find_post, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_user!,only:[:edit,:update,:destroy]

    def new
        @post = Post.new
    end

    def create
        @post=Post.new post_params
        @post.user = current_user

        if @post.save
            redirect_to post_path(@post.id) # show page   
        else
            render :new
        end
    end

    def index
        @posts = Post.filter_by_title(params[:name])
    end

    def show
        @comments=@post.comments.order(created_at: :desc)
        @comment=Comment.new
    end

    def edit

    end

    def destroy   
        @post.destroy
        redirect_to posts_path
    end

    def update
        if @post.update post_params
           
            redirect_to post_path(@post.id)
        else
            render :edit
        end
    end


    private
    def find_post
        @post=Post.find params[:id]
    end

    def post_params
        params.require(:post).permit(:title, :description,:image_url)
    end
    def authorize_user!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @post)
    end

end
