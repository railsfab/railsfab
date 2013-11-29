class Page < ActiveRecord::Base
    validates :name, presence: true
    validate :create_and_validate_slug
    validates :slug, :uniqueness => { 
        message: ": Page with this name already exists. Please choose another. " }

    def create_and_validate_slug
        self.slug = self.name.parameterize
    end
end
