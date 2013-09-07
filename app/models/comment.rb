class Comment < ActiveRecord::Base
    belongs_to :post, class_name: "BlogPost", foreign_key: "post_id"
end
