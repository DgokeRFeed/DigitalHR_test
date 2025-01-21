module Skills
  class List < ActiveInteraction::Base
    def execute
      Skill.all
    end
  end
end
