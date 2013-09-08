class Comment < ActiveRecord::Base
    belongs_to :post, class_name: "BlogPost", foreign_key: "post_id"
    validates :name, presence: true
    validates :comment, presence: true
    validates :email, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
