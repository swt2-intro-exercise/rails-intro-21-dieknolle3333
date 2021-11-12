require 'rails_helper'

 describe "Show author page", type: :feature do

    it "should display an existing author's details on a show page" do
        @grace = FactoryBot.create :author
        visit author_path(@grace)
        expect(page).to have_text("Grace")
        expect(page).to have_text("Hopper")
        expect(page).to have_text("https://en.wikipedia.org/wiki/Grace_Hopper")
    end

 end