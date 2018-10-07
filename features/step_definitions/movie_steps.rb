
Given(/^the following movies exist:$/) do |movies_table|
  # table is a Cucumber::Ast::Table
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    
    #debugger
    Movie.create(title: movie[:title], rating: movie[:rating], director: movie[:director], release_date: movie[:release_date])
  end
  #flunk "Unimplemented"
  #pending # express the regexp above with the code you wish you had
end

# When steps here


Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|
  #pending # express the regexp above with the code you wish you had
  #debugger
    page.body.should have_xpath("//h2", :text => "Details about #{title}") 
    page.body.should have_xpath("//li", :text => "#{director}") 
 
end