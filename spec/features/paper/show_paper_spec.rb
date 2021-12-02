require 'rails_helper'

 describe "Show paper page", type: :feature do

    it "should display the paper's authors' full names" do
        @paper = FactoryBot.create :paper
        @author = FactoryBot.create :author
        @paper.authors = [@author]
        visit paper_path(@paper)
        expect(page).to have_text("Grace Hopper")
    end

 end