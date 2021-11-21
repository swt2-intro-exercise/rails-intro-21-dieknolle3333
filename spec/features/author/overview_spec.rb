require 'rails_helper'

 describe "Overview page", type: :feature do

   it "should exist at 'authors_path' and render withour error" do
     visit authors_path
     expect(page).to have_content("Name")
     expect(page).to have_content("Homepage")
     expect(page).to have_link 'New', href: new_author_path
     Author.all.each do |author| 
         expect(page).to have_content author.name
         expect(page).to have_content author.homepage
         expect(page).to have_link 'Show', href: author_path(author)
         expect(page).to have_link 'Delete', href: author_path(author)
     end
   end

   it "should have a link to delete an author for every entry" do
    visit authors_path
    init_count = Author.count
    find('a[data-method=\'delete\'][href=\'/authors/1\']').click
    expect(Author.count).to == init_count - 1  
  end   


 end
