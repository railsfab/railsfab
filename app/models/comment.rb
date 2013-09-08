class Comment < ActiveRecord::Base
    belongs_to :post, class_name: "BlogPost", foreign_key: "post_id"
    validates :name, presence: true
    validates :comment, presence: true
    validates :email, presence: true
end
