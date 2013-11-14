class Tag < ActiveRecord::Base
    has_many :post_tag_relations
    has_many :posts, class_name: BlogPost, through: :post_tag_relations, uniq: true

    validate :create_and_validate_slug
    validates :slug, :uniqueness => { 
        message: ": Category with this name already exists"}

    paginates_per 10

    def create_and_validate_slug
        self.slug = self.name.parameterize
    end

end
