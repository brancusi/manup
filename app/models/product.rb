class Product < ActiveRecord::Base
	acts_as :item

	def special
		hellyes = "Yes!"
		
		binding.pry

		puts 'Yes'
	end
end
