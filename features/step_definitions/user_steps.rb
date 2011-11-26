module UserStepHelper
  class TUser
    attr_accessor :name, :email, :password

    def initialize(name)
      @name = name
      @email = "#{name}.#{name}@example.com".downcase
      @password = "#{name}password"
    end
  end

  def create_user(name)
    TUser.new(name)
  end

  def bad_password
    'wibbletastic'
  end
  
  def bad_email
    'wibble@badexample.com'
  end

  def malformed_email
    'wibble.badexample.com'
  end
end
World(UserStepHelper)

Given /^I am Fred$/ do
  @I = create_user 'Fred'
end



