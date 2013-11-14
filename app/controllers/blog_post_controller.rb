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

            #add categories
            @post.add_categories params[:categories].split(" ")

            #add tags
            @post.add_tags params[:tags].split(" ")

            redirect_to root_url
        else
            render :new
        end
    end

    def create_comment
        captcha_valid = validate_captcha params

        @comment = Comment.new(comment_params)
        @post = BlogPost.find_by_slug(params[:slug])
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
        if params[:username]
            @user = User.find_by_username(params[:username])
            if not @user
                not_found
            end
            @posts = @user.posts
        else
            @posts = BlogPost.all
        end
        @posts = @posts.order("created_at DESC").page(params[:page])
    end

    def show
        @post = BlogPost.find_by_slug(params[:slug])
        @comment = Comment.new
    end

    
    private

    def user_params
        params.require(:blog_post).permit(:title, :content)
    end

    def comment_params
        params.require(:comment).permit(:name, :email, :comment)
    end

end
