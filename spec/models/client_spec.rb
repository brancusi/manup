require 'spec_helper'

describe "A new instance of", Client do

	describe "when name is nil" do
		before do
			@client = Client.new(name:"")
		end

		subject { @client }

	    it { should_not be_valid }
	  	
	end

	describe "when name is valid" do
		before do
			@client = Client.new(name:"EB001")
		end

		subject { @client }

	    it { should be_valid }
	  	
	end

end