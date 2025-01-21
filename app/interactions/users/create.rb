module Users
  class Create < ActiveInteraction::Base
    hash :params do
      string :name, :surname, :patronymic, :nationality,
        :country, :skills, presence: true
      string :email, presence: true, uniqueness: true
      string :gender, inclusion: { in: %w[male female] }

      integer :age, presence: true, comparison: { greater_than: 0, less_than_or_equal_to: 90 }

      array :interests, presence: true
    end



    def execute
      full_name =
        [
          params['surname'],
          params['name'],
          params['patronymic']
        ]
        .map(&:downcase)
        .join(' ')

      user_params = params.except(:interests, :skills).merge(full_name:)
      user = User.new(user_params)

      user.interests = Interest.where(name: params['interests'])

      user_skills = params['skills'].split(',')
      user.skills = Skill.where(name: user_skills)

      unless user.save
        errors.merge!(user.errors)
      end

      user
    end
  end
end
