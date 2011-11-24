When /^I visit the site$/ do
  visit root_path
end

Then /^I should be welcomed$/ do
  debugger
  page.should have_css('#welcome')
  pending # express the regexp above with the code you wish you had
end

