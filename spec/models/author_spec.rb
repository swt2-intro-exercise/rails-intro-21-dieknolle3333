describe "Author", type: :model do

    it "should have a first name, a last name and a homepage (all three strings) and a name method returning first name + last name" do
       local_first_name = 'Sandra'
       local_last_name = 'Ciesek'
       local_homepage = 'https://www.dzif.de/en/node/2284'
    
       author = Author.new(:first_name => local_first_name, :last_name => local_last_name, :homepage => local_homepage)
       expect(author.first_name).to eq(local_first_name)
       expect(author.last_name).to eq(local_last_name)
       expect(author.homepage).to eq(local_homepage)
       expect(author.name).to eq(local_first_name + " " + local_last_name)
       end
    
    end