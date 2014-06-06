require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "Should have the content 'Social Network'" do
			visit '/static_pages/home'
			expect(page).to have_content('Social Network')
		end
	end

	describe "Help page" do
		it "Should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
	end

end
