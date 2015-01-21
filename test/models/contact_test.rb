require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "name cannot be null" do
  	contact = Contact.new
  	assert_not contact.save, 'Saved contact with null name!'
  end

end
