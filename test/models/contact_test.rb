require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "name cannot be null" do
    contact = Contact.new(name:nil, code:'001')
  	assert_not contact.save, 'Saved contact with null name!'
  end

  test "code cannot be null" do
    contact = Contact.new(name:'Bed Rock', code:nil)
    assert_not contact.save, 'Saved contact with null code!'
  end

  test "can save with valid info" do
    contact = Contact.new(name:'Bed Rock', code:'001')
    assert contact.save, 'Could not save with valid info.'
  end

end