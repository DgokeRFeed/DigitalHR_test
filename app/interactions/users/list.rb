module Users
  class List < ActiveInteraction::Base
    def execute
      User.all
    end
  end
end
