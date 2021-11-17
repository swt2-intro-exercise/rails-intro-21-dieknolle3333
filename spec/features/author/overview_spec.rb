require 'rails_helper'

 describe "Overview page", type: :feature do

   it "should exist at 'new_author_path' and render withour error" do
     visit authors_path
     expect(page).to have_content("Name")
     expect(page).to have_content("Homepage")
     expect(page).to have_link 'New', href: new_author_path
     Author.all.each do |author| 
         expect(page).to have_content author.name
         expect(page).to have_content author.homepage
         expect(page).to have_link 'Details', href: author_path
     end
   end


 end
