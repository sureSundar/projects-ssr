class Comment < ActiveRecord::Base
belongs_to :post,:class_name => "Post",:foreign_key => "ppost_id"
belongs_to :Pcomment,:class_name => "Comment",:foreign_key => "pc_id"

has_many :comments,:class_name => "Comment",:foreign_key => "pc_id", :dependent => :destroy

end
