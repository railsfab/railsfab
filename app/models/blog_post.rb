class BlogPost < ActiveRecord::Base
    belongs_to :author, class_name: "User", foreign_key: "author_id"

    def short_content
        ActionView::Base.full_sanitizer.sanitize(self.content).slice(0, 100)
    end

end
