require 'rails_helper'

 describe "Edit author page", type: :feature do
 
    it "should store updated information about an author in the database" do
        edited_first_name = "Grace THE QUEEN"
        @grace = FactoryBot.create :author
        visit edit_author_path(@grace)
        page.fill_in 'author[first_name]', with: edited_first_name
        find('input[type="submit"]').click
        @grace.reload
        Author.find_by!(first_name: edited_first_name)
        expect(@grace).to have_attributes(first_name: edited_first_name)
    end

 end