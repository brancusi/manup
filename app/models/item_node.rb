class ItemNode < ActiveRecord::Base

  	belongs_to :child, :class_name => 'Item', :foreign_key => 'child_id'
  	belongs_to :parent, :class_name => 'Item', :foreign_key => 'parent_id'

end
