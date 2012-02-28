class Comment < ActiveRecord::Base
belongs_to :post,:class_name => "Post",:foreign_key => "ppost_id"
belongs_to :comment,:class_name => "Comment",:foreign_key => "pc_id"

has_many :comments
end
