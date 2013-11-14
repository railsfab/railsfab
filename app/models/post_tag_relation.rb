class PostTagRelation < ActiveRecord::Base
    belongs_to :post, class_name: :BlogPost, foreign_key: :post_id
    belongs_to :tag, class_name: :Tag, foreign_key: :tag_id
end
