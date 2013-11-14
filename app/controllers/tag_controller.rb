class TagController < ApplicationController
   def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new new_tag_params
        if @tag.valid?
            @tag.save
            redirect_to tag_show_path(slug: @tag.slug)
        else
            render :new
        end
    end

    def index
        @categories = Tag.all
    end

    def show
        @tag = Tag.find_by_slug(params[:slug])
        if @tag.nil?
            not_found
        end
    end

    private

    def new_tag_params
        params.require(:tag).permit(:name)
    end

end
