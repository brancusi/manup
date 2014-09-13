require 'spec_helper'

describe "Clients API" do
  	it 'sends a list of messages' do
	    FactoryGirl.create_list(:client, 10)

	    get '/clients'

	    expect(response).to be_success            # test for the 200 status-code
	    json = JSON.parse(response.body)
	    expect(json['clients'].length).to eq(10) # check to make sure the right amount of messages are returned
	  end
end