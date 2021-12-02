require 'rails_helper'

 describe "New paper page", type: :feature do

   it "should exist at 'new_paper_path' and render withour error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_paper_path
   end

   it "should have text inputs for a title, venue and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
   end
  
   it "should save a newly submitted paper in the database" do
    visit new_paper_path
    local_title = 'A study on behaviour'
    local_venue = 'New Dehli'
    local_year = 2019
    page.fill_in 'paper[title]', with: local_title
    page.fill_in 'paper[venue]', with: local_venue
    page.fill_in 'paper[year]', with: local_year
    find('input[type="submit"]').click
    Paper.find_by!(title: local_title, venue: local_venue, year: local_year)
   end

   it "should be invalid with any missing attribute" do
    @paper = FactoryBot.create :paper
    @paper.title = nil
    expect(@paper).to_not be_valid
   end

 end
