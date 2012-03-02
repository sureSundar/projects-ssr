class Comment < ActiveRecord::Base
belongs_to :post,:class_name => 'Post',:foreign_key => "ppost_id"

end
