require 'rails_helper'

 describe "Edit author page", type: :feature do
 
    it "should display an existing author's details on a show page" do
        edited_first_name = "Grace THE QUEEN"
        @grace = FactoryBot.create :author
        visit edit_author_path(@grace)
        page.fill_in 'author[first_name]', with: edited_first_name
        find('input[type="submit"]').click
        @grace.reload
        expect(@grace).to have_attribute(first_name: edited_first_name)
    end

 end