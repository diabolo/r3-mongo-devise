module UserStepHelper
  class TUser
    attr_accessor :name, :email, :password

    def initialize(name)
      @name = name
      @email = "#{name}.#{name}@exampl.com"
      @password = "#{name}password"
    end
  end

  def create_user(name)
    TUser.new(name)
  end
end
World(UserStepHelper)

Given /^I am Fred$/ do
  @I = create_user 'Fred'
end

