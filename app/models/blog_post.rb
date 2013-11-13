class BlogPost < ActiveRecord::Base
    has_many :comments, foreign_key: :post_id
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    validates :title, presence: true
    validates :content, presence: true
    validate :create_and_validate_slug
    validates :slug, :uniqueness => { 
        message: ": Post with this title already exists, 
        please modify title slightly" }

    def create_and_validate_slug
        self.slug = self.title.parameterize
    end

    def short_content
        "%s ..." % ActionView::Base.full_sanitizer.sanitize(self.content).slice(0, 100).gsub(/[^a-zA-Z0-9 ]+/, '')
    end

end
