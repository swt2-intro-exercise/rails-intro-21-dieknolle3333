require 'rails_helper'

 describe PapersController, :type => :controller do
 describe "Overview page", type: :feature do

   it "should only show papers from specified years" do
    @paper1950 = FactoryBot.create :paper
    @paper1950.title = "made in 1950"
    @paper1950.year = 1950
    @paper1968 = FactoryBot.create :paper
    @paper1968.title = "made in 1968"
    @paper1968.year = 1968

    get :index, { year: 1950 }
    expect(response).to have_text("made in 1950")
    expect(response).to_not have_text("made in 1968")
   end
end

 end