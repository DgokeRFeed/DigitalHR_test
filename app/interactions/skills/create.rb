module Skills
  class Create < ActiveInteraction::Base
    string :name

    validates :name, presence: true

    def execute
      skill = Skill.new({ name: })

      unless skill.save
        errors.merge!(skill.errors)
      end

      skill
    end
  end
end
