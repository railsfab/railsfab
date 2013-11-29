class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
      @pages = Page.all
  end

  def new
      @page = Page.new
  end

  def edit
      @page = Page.find params[:id]
  end

  def create
      @page = Page.new page_params
      if @page.valid?
          @page.save
          redirect_to pages_path
      else
          render :new
      end
  end

  def update
      @page = Page.find params[:id]
      @page.assign_attributes page_params
      if @page.valid?
          @page.save
          redirect_to pages_path
      else
          render :edit
      end
  end

  private

  def page_params
      params.require(:page).permit(:name, :content)
  end

end
