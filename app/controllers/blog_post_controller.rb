class BlogPostController < ApplicationController
    include BlogPostHelper
    before_filter :authenticate_user!, only: [:new, :create]

    def new
        @post = BlogPost.new
    end

    def create
        @post = BlogPost.new(user_params)
        if @post.valid?
            @post.author = current_user
            @post.save()
            redirect_to root_url
        else
            render :new
        end
    end

    def create_comment
        captcha_valid = validate_captcha params

        @comment = Comment.new(comment_params)
        @post = BlogPost.find(params[:id])
        if captcha_valid
            if @comment.valid?
                @comment.post = @post
                @comment.save
                @comment = Comment.new
            end
        else
            @comment.errors[:base] << "Entered CAPTCHA is wrong, please try again"
        end
        render :show
    end

    def index
        @posts = BlogPost.all
    end

    def show
        @post = BlogPost.find(params[:id])
        @comment = Comment.new
    end

    def profile
        @user = User.find_by(username: params[:username])
        @posts = @user.posts
    end

    
    private

    def user_params
        params.require(:blog_post).permit(:title, :content)
    end

    def comment_params
        params.require(:comment).permit(:name, :email, :comment)
    end

end
