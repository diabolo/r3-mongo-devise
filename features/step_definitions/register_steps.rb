module RegisterStepHelper
  def register_as(user)
    visit root_path
    click_link 'Register' # get to register form
    fill_in('user_name', :with => user.name)
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    fill_in('user_password_confirmation', :with => user.password)
    click_button 'Sign up'
  end

  def sign_in_as(user)
    sign_out
    click_link 'Sign in'
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    click_button 'Sign in'
  end
    
  def view_my_profile
    click_link 'Edit registration'
  end

  def sign_out
    visit root_path
    click_link 'Sign out' unless signed_out?
  end

  def signed_out?
    page.all('a', :text => 'Sign out').empty?
  end 
end
World(RegisterStepHelper)

Given /^I am registered as 'Fred'$/ do
  @I = create_user 'Fred'
  register_as @I
end


When /^I register$/ do
  register_as(@I)
end

When /^I sign in$/ do
  sign_in_as @I
end
When /^I view my profile$/ do
  view_my_profile
end

Then /^I should be signed in$/ do
  page.body.should have_css('#flash_notice', :text => /signed.*success/i)
end

Then /^I should be registered$/ do
  User.where(:name => @I.name).should be_true
end

Then /^I should see my profile$/ do
  page.should have_css "#user_email[@value='#{@I.email}']"
end
