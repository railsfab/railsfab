class BlogPostController < ApplicationController
    before_filter :authenticate_user!
    def new
        @post = BlogPost.new
    end

    def create
        @post = BlogPost.new(user_params)
        if @post.valid?
            @post.save()
            redirect_to root_url
        else
            render :new
        end
    end

    
    private

    def user_params
        params.require(:blog_post).permit(:title, :content)
    end
end
