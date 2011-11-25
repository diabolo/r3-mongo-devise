module RegisterStepHelper
  def register_as(user)
    debugger
    within '#register' do
      fill_in('.email', :text => user.email)
      fill_in('.password', :text => user.password)
      fill_in('.confirmation', :text => user.confirmation)
      click 'Register'
    end
  end
end
World(RegisterStepHelper)

When /^I register$/ do
  register_as(@I)
end

Then /^I should be registered$/ do
  pending # express the regexp above with the code you wish you had
end

