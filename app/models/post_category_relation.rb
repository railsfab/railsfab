class PostCategoryRelation < ActiveRecord::Base
    belongs_to :post, class_name: :BlogPost, foreign_key: :post_id
    belongs_to :category, class_name: :Category, foreign_key: :category_id
end
