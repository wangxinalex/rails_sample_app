require 'spec_helper'

describe "Static Pages" do
	subject {page}

	shared_examples_for "all static pages" do
		it {should have_content(heading)}
		it {should have_title(full_title(page_title))}
	end

	describe "Home Page" do
		before {visit root_path}
		let(:heading) {'Sample App'}
		let(:page_title) {''}
		it_should_behave_like "all static pages"
		it {should_not have_title('| Home')}
	end

	describe "Help page" do
		before {visit help_path}
		let(:heading) {'Help'}
		let(:page_title) {''}
		it_should_behave_like "all static pages"	
	end

	describe "About page" do
		it "should have the content 'About Us'" do
			visit about_path
			expect(page).to have_content('About Us')
		end
	end

	describe "Contact page" do
		it "should have the content 'Contact'" do
			visit contact_path
			expect(page).to have_content('Contact Us')
		end

		it "should have the title 'Contact'" do
			visit contact_path
			expect(page).to have_title('Ruby on Rails Tutorial Sample App | Contact')
		end

	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"	
		expect(page).to have_title(full_title('About Us'))
		
	end
end
