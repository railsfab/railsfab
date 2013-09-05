class HomeController < ApplicationController
  def index
      @posts = BlogPost.last(6)
  end
end
