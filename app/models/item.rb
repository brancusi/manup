class Item < ActiveRecord::Base
	actable

	validates :name, presence: true
end
