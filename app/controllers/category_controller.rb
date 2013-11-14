class CategoryController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = Category.new new_category_params
        if @category.valid?
            @category.save
            redirect_to category_show_path(slug: @category.slug)
        else
            render :new
        end
    end

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find_by_slug(params[:slug])
        if @category.nil?
            not_found
        end
    end

    private

    def new_category_params
        params.require(:category).permit(:name)
    end
end
