module RegisterStepHelper
  def register_as(user)
    click_link 'Register' # get to register form
    fill_in('user_name', :with => user.name)
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    fill_in('user_password_confirmation', :with => user.password)
    click_button 'Sign up'
  end
end
World(RegisterStepHelper)

When /^I register$/ do
  register_as(@I)
end

Then /^I should be registered$/ do
  User.where(:name => @I.name).should be_true
end

