require 'rails_helper'

 describe "New author page", type: :feature do

   it "should exist at 'new_author_path' and render withour error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end

   it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
   end
  
   it "should save a newly submitted author in the database" do
    visit new_author_path
    local_first_name = 'Grace'
    local_last_name = 'Hopper'
    local_homepage = 'https://en.wikipedia.org/wiki/Grace_Hopper'
    page.fill_in 'author[first_name]', with: local_first_name
    page.fill_in 'author[last_name]', with: local_last_name
    page.fill_in 'author[homepage]', with: local_homepage
    find('input[type="submit"]').click
    Author.find_by!(first_name: local_first_name, last_name: local_last_name, homepage: local_homepage)
   end

   it "should be invalid without an author's last name" do
      @grace = FactoryBot.create :author
      @grace.last_name = nil
      expect(@grace).to_not be_valid
   end

 end
