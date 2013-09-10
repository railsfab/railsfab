class BlogPost < ActiveRecord::Base
    has_many :comments, foreign_key: :post_id
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    validates :title, presence: true
    validates :content, presence: true

    def short_content
        "%s ..." % ActionView::Base.full_sanitizer.sanitize(self.content).slice(0, 100).gsub(/[^a-zA-Z0-9 ]+/, '')
    end

end
