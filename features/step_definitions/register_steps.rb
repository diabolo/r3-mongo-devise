module RegisterStepHelper
  def sign_up_as(user, options={})
    user = user.dup
    options.each{|k,v| user.send "#{k}=", v}
    visit root_path
    click_link 'Sign up' # get to register form
    fill_in('user_name', :with => user.name)
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    fill_in('user_password_confirmation', :with => user.password)
    click_button 'Sign up'
  end

  def sign_in_as(user, options={})
    user = user.dup
    options.each{|k,v| user.send "#{k}=", v}
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
  sign_up_as @I
end

When /^I sign up$/ do
  sign_up_as(@I)
end

When /^I sign up with a malformed email$/ do
  sign_up_as(@I, :email => malformed_email) 
end

When /^I sign up with no name$/ do
  sign_up_as(@I, :name => '')
end

When /^I sign in$/ do
  sign_in_as @I
end

When /^I sign in as 'Fred'$/ do
  @I = create_user 'Fred'
  sign_in_as @I
end

When /^I sign in with a bad password$/ do
  sign_in_as @I, :password => bad_password
end

When /^I sign in with a bad email$/ do
  sign_in_as @I, :email => bad_email
end

When /^I view my profile$/ do
  view_my_profile
end

Then /^I should be signed out$/ do
  signed_out?.should be_true
end

Then /^I should be signed in$/ do
  signed_out?.should be_false
#  page.body.should have_css('#flash_notice', :text => /signed.*success/i)
end

Then /^I should be registered$/ do
  User.where(:name => @I.name).should be_true
end

Then /^I should see my profile$/ do
  page.should have_css "#user_email[@value='#{@I.email}']"
end

Then /^I should see malformed email error$/ do
  page.should have_css('.field_with_errors #user_email')
end

Then /^I should see no name error$/ do
  page.should have_css('.field_with_errors #user_name')
end

