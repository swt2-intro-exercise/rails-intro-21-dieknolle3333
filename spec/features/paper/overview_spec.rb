require 'rails_helper'

 describe "Overview page", type: :feature do

   it "should only show papers from specified years" do
    title_1950 = "made in 1950"
    @paper1950 = FactoryBot.create(:paper, title: title_1950, year: 1950)
    title_1968 = "made in 1968"
    @paper1968 = FactoryBot.create(:paper, title: title_1968, year: 1968)

    visit papers_path(year: 1950)
    expect(page).to have_text(title_1950)
    expect(page).to_not have_text(title_1968)
    end

 end