class BlogPost < ActiveRecord::Base
    has_many :comments, foreign_key: :post_id
    has_many :post_category_relations, foreign_key: :post_id
    has_many :categories, class_name: Category, through: :post_category_relations, uniq: true

    has_many :post_tag_relations, foreign_key: :post_id
    has_many :tags, class_name: Tag, through: :post_tag_relations, uniq: true
    belongs_to :author, class_name: "User", foreign_key: "author_id"
    validates :title, presence: true
    validates :content, presence: true
    validate :create_and_validate_slug
    validates :slug, :uniqueness => { 
        message: ": Post with this title already exists, 
        please modify title slightly" }

    paginates_per 10

    def create_and_validate_slug
        self.slug = self.title.parameterize
    end

    def short_content(max_chars=nil)
        if not max_chars
            max_chars = 100
        end
        "%s ..." % ActionView::Base.full_sanitizer.sanitize(self.content).slice(0, max_chars).gsub(/[^a-zA-Z0-9 ]+/, '')
    end

    def add_categories(categories)
        for category in categories
            slug = category.parameterize
            obj = Category.find_by_slug(slug)
            if obj.nil?
                obj = Category.create(name: category)
            end
            if self.categories.find_by(id: obj.id).nil?
                self.categories.append obj
            end
        end
    end

    def add_tags(tags)
        for tag in tags
            slug = tag.parameterize
            obj = Tag.find_by_slug(slug)
            if obj.nil?
                obj = Tag.create(name: tag)
            end
            if self.tags.find_by(id: obj.id).nil?
                self.tags.append obj
            end
        end
    end

end
