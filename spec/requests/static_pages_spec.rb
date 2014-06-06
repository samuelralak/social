require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "Should have the content 'Social Network'" do
			visit '/static_pages/home'
			expect(page).to have_content('Social Network')
		end

		it "Should have title 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title('Social Network | Home')
		end
	end

	describe "Help page" do
		it "Should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "Should have title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title('Social Network | Help')
		end
	end

	describe "About page" do
		it "Should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "Should have title 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_title('Social Network | About Us')
		end
	end

end
