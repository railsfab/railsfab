class Tag < ActiveRecord::Base
    validate :create_and_validate_slug
    validates :slug, :uniqueness => { 
        message: ": Category with this name already exists"}

    paginates_per 10

    def create_and_validate_slug
        self.slug = self.name.parameterize
    end

end
