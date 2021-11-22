require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have a title (str), a venue (str) and a year (int)" do
    local_title = 'A study on behaviour'
    local_venue = 'New Dehli'
    local_year = 2019

    paper = Paper.new(:title => local_title, :venue => local_venue, :year => local_year)

    expect(paper.title).to eq(local_title)
    expect(paper.venue).to eq(local_venue)
    expect(paper.year).to eq(local_year)
    end
end
