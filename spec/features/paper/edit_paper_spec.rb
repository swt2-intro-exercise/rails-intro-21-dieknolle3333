require 'rails_helper'

 describe "Edit paper page", type: :feature do

    it "should display the paper's authors' full names" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(page).to have_css("select multiple")
    end

 end