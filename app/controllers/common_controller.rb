class CommonController < ApplicationController
    def ourwork
        @page = Page.find_by_slug("our-work")
    end
end
