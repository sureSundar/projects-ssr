class Post < ActiveRecord::Base
belongs_to :weblog
has_many :comments

end
