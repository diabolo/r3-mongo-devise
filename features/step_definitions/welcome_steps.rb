When /^I visit the site$/ do
  visit root_path
end

Then /^I should be welcomed$/ do
  page.should have_css('#welcome')
end

