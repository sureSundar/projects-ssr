class Post < ActiveRecord::Base
belongs_to :weblog
has_many :comments,:class_name => 'Comment',:foreign_key => "ppost_id"

accepts_nested_attributes_for :comments
end
