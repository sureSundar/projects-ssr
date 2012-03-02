class User < ActiveRecord::Base
acts_as_authentic
has_many :weblogs, :class_name => 'Weblog', :foreign_key => 'owner_id'

accepts_nested_attributes_for :weblogs

end
